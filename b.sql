INSERT INTO
    saving_account_amount_authorization (
        transaction_id,
        fund_in_amount,
        status,
        fund_out_amount,
        saving_account_id,
        created_by,
        created_timestamp,
        updated_by,
        updated_datetime
    ) (
        SELECT
            params.transaction_id,
            CASE
                WHEN type = 'source' THEN 0
                ELSE params.amount
            END AS fund_in_amount,
            params.status,
            CASE
                WHEN type = 'source' THEN params.amount
                ELSE 0
            END AS fund_out_amount,
            CASE
                WHEN type = 'source' THEN from_sa.id
                ELSE to_sa.id
            END AS saving_account_id,
            params.actor_id AS created_by,
            CURRENT_TIMESTAMP() AS created_timestamp,
            params.actor_id AS updated_by,
            CURRENT_TIMESTAMP() AS updated_datetime
        FROM
            (
                SELECT
                    ? AS transaction_id,
                    ? AS from_product_id,
                    ? AS to_product_id,
                    ? AS from_customer_id,
                    ? AS to_customer_id,
                    ? AS amount,
                    ? AS status,
                    ? AS actor_id
            ) AS params
            JOIN saving_account from_sa ON from_sa.customer_id = params.from_customer_id
            AND from_sa.saving_product_id = params.from_product_id
            JOIN saving_account to_sa ON to_sa.customer_id = params.to_customer_id
            AND to_sa.saving_product_id = params.to_product_id
            JOIN (
                SELECT
                    'source' AS type
                UNION
                SELECT
                    'destination' AS type
            ) AS type_transaction ON TRUE
    )