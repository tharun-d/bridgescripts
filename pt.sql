UPDATE
    saving_account saFrom,
    saving_account saTo,
    saving_account_amount_authorization authFrom,
    saving_account_amount_authorization authTo
SET
    saFrom.pending_fund_out = saFrom.pending_fund_out + authFrom.fund_out_amount,
    saTo.pending_fund_in = saTo.pending_fund_in + authTo.fund_in_amount,
    saFrom.updated_timestamp = CURRENT_TIMESTAMP(),
    saTo.updated_timestamp = CURRENT_TIMESTAMP()
WHERE
    TRUE
    AND authFrom.transaction_id = ?
    AND authFrom.transaction_id = authTo.transaction_id
    AND authFrom.saving_account_id != authTo.saving_account_id
    AND authFrom.status = authTo.status
    AND authTo.status = ?
    AND saFrom.id = authFrom.saving_account_id
    AND saTo.id = authTo.saving_account_id
    AND saFrom.id != saTo.id
    AND authFrom.fund_in_amount = 0
    AND authTo.fund_out_amount = 0
    AND authTo.fund_in_amount >= (
        SELECT
            IFNULL (
                (
                    SELECT
                        spr.value
                    FROM
                        saving_product_rule spr
                    WHERE
                        saving_product_id = saTo.saving_product_id
                        and saFrom.saving_product_id != ?
                        AND spr.code = 'min_topup_amount'
                ),
                0
            )
    )
    AND (
        (
            (
                SELECT
                    is_allow_overdraft
                FROM
                    saving_product
                WHERE
                    id = saFrom.saving_product_id
            ) = 1
            AND (
                saFrom.balance - saFrom.pending_fund_out - authTo.fund_in_amount >= (
                    SELECT
                        spr.value
                    FROM
                        saving_product_rule spr
                    WHERE
                        saving_product_id = saFrom.saving_product_id
                        AND spr.code = 'max_overdraft'
                )
            )
        )
        OR (
            (
                SELECT
                    is_allow_overdraft
                FROM
                    saving_product
                WHERE
                    id = saFrom.saving_product_id
            ) = 0
            AND (
                saFrom.balance - saFrom.pending_fund_out - authTo.fund_in_amount >= 0
            )
        )
    )
    AND IFNULL(
        saTo.balance + saTo.pending_fund_in + authTo.fund_in_amount <= (
            SELECT
                spr.value
            FROM
                saving_product_rule spr
            WHERE
                saving_product_id = saTo.saving_product_id
                AND spr.code = ?
        ),
        TRUE
    )
    AND (
        IFNULL(
            (
                CURRENT_TIMESTAMP() < saTo.fund_in_end_period
                AND saTo.total_monthly_fund_in + authTo.fund_in_amount <= (
                    SELECT
                        spr.value
                    FROM
                        saving_product_rule spr
                    WHERE
                        saving_product_id = saTo.saving_product_id
                        AND spr.code = 'max_monthly_funds_in'
                )
            ),
            TRUE
        )
        OR CURRENT_TIMESTAMP() > saTo.fund_in_end_period
    )