SELECT
    params.amount >= (
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
    ) AS valid_minimum_amount,
    params.amount <= (
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
                        AND spr.code = 'max_purchase_amount'
                ),
                0
            )
    ) AS valid_maximum_amount,
    (
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
                saFrom.balance - saFrom.pending_fund_out - params.amount >= (
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
                saFrom.balance - saFrom.pending_fund_out - params.amount >= 0
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
            ) = 1
        )
    ) AS sufficient_source_balance,
    IFNULL(
        saTo.balance + saTo.pending_fund_in + params.amount <= (
            SELECT
                spr.value
            FROM
                saving_product_rule spr
            WHERE
                saving_product_id = saTo.saving_product_id
                AND spr.code = CONCAT('kyc[', params.to_kyc_lv, '].max_balance')
        ),
        TRUE
    ) AS valid_receiver_max_balance,
    (
        IFNULL(
            (
                CURRENT_TIMESTAMP() < saTo.fund_in_end_period
                AND saTo.total_monthly_fund_in + params.amount <= (
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
        OR CURRENT_TIMESTAMP > saTo.fund_in_end_period
    ) AS valid_receiver_max_monthly_fund_in,
    (
        saFrom.status = params.activeStatus
        AND saTo.status = params.activeStatus
    ) as status
FROM
    (
        SELECT
            ? AS amount,
            ? AS from_customer_id,
            ? AS from_saving_product_id,
            ? AS to_customer_id,
            ? AS to_saving_product_id,
            ? AS to_kyc_lv,
            ? AS activeStatus
    ) AS params
    JOIN saving_account saFrom ON saFrom.customer_id = params.from_customer_id
    AND saFrom.saving_product_id = params.from_saving_product_id
    JOIN saving_account saTo ON saTo.customer_id = params.to_customer_id
    AND saTo.saving_product_id = params.to_saving_product_id