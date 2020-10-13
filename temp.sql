UPDATE
    saving_account saFrom,
    saving_account saTo,
    saving_account_amount_authorization authFrom,
    saving_account_amount_authorization authTo
SET
    saFrom.balance = saFrom.balance - authFrom.fund_out_amount,
    saTo.balance = saTo.balance + authTo.fund_in_amount,
    saTo.total_monthly_fund_in = CASE
        WHEN saTo.fund_in_end_period > CURRENT_TIMESTAMP THEN authTo.fund_in_amount
        ELSE saTo.total_monthly_fund_in + authTo.fund_in_amount
    END,
    saTo.fund_in_end_period = CASE
        WHEN saTo.fund_in_end_period > CURRENT_TIMESTAMP THEN LAST_DAY(CURRENT_TIMESTAMP)
        ELSE saTo.fund_in_end_period
    END,
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
     10000
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

INSERT INTO `user`.`user`
(id, username, name, mobile, email, passcode, device_id, status, last_blocked, created_by, created_time, updated_by, updated_time, last_login)
VALUES(Default, 'superadmin', 'Super admin', '999', '', '$argon2id$v=19$m=65536,t=3,p=2$9dll4EnCzFRSTSnqcOr/Fg$mjihhvFDpkvRV71JswTPEiBTyiGFeFXva9GkPRvuPD8', '7b5f9802-5fesb-42a7-a019-f39210191164', 1, NULL, 100, '2020-10-05 17:54:57.000', 100, '2020-10-05 17:54:57.000', NULL);

insert into `role` values (Default,'super admin','role super admin added', 1 , now(), now(), '100', now())

insert into user_application values (18016, 1,1 ,'100', now(), '100', now())

