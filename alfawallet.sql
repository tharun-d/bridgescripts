CREATE database alfawallet

CREATE TABLE IF NOT EXISTS cash_in_transactions (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	login TEXT NOT NULL,
	terminal TEXT NOT NULL,
	customer_key TEXT NOT NULL,
	transaction_date TIMESTAMP NOT NULL,
	transaction_type TEXT NOT NULL,
	transaction_amount BIGINT NOT NULL,
	client_reference_id TEXT NOT NULL,
	transaction_id BIGINT UNSIGNED NOT NULL,
	customer_name TEXT NOT NULL,
	account_type TEXT NOT NULL,
	signature TEXT NOT NULL,
	status TEXT NOT NULL,
    validation_text TEXT NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (client_reference_id(255))
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS credentials (
    id INT PRIMARY KEY auto_increment,
    login TEXT,
    hash_password TEXT,
    secret_key TEXT,
    customer_id BIGINT UNSIGNED,
    customer_card_no TEXT,
    UNIQUE KEY (login(255)),
    created_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE = InnoDB;
-- for development environment
INSERT INTO `credentials`(`login`, `hash_password`, `secret_key`, `customer_id`,
`customer_card_no`, `created_timestamp`, `updated_timestamp`) VALUES ('AlfaLogin', 'AlfaPassword',
'AlfaKey', 0, '089671890224', '2020-07-08 10:36:37', '2020-07-08 10:36:37');