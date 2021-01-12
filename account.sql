CREATE database account
use account 

-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE IF NOT EXISTS `saving_account` (
  `id` BIGINT UNSIGNED NOT NULL,
  `card_no` VARCHAR(255) NOT NULL,
  `customer_id` BIGINT UNSIGNED NOT NULL,
  `saving_product_id` INT(10) NOT NULL,
  `balance` DECIMAL(20,4) NOT NULL DEFAULT 0.0,
  `total_monthly_fund_in` DECIMAL(20,4) NOT NULL DEFAULT 0.0,
  `fund_in_end_period` DATETIME DEFAULT LAST_DAY(CURRENT_TIMESTAMP),
  `pending_fund_in` DECIMAL(20,4) NOT NULL DEFAULT 0.0,
  `pending_fund_out` DECIMAL(20,4) NOT NULL DEFAULT 0.0,
  `status` INT NOT NULL COMMENT '-1 deleted\n0  inactive\n1  active\n2  blocked',
  `created_by` BIGINT UNSIGNED NOT NULL,
  `created_timestamp` TIMESTAMP NOT NULL,
  `updated_by` BIGINT UNSIGNED NOT NULL,
  `updated_timestamp` TIMESTAMP NOT NULL,
  `is_default_account` INT(3) NOT NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE IF NOT EXISTS `saving_product` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_allow_overdraft` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_calculate_total_monthly_cash_in` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_calculate_pending_cash_in` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_calculate_pending_cash_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `saving_product_rule` (
  `saving_product_id` int(10) unsigned NOT NULL,
  `code` varchar(30) NOT NULL,
  `value` bigint(20) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `updated_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`saving_product_id`,`code`)
);

CREATE TABLE IF NOT EXISTS `saving_account_amount_authorization` (
    `transaction_id` bigint(20) unsigned NOT NULL,
    `fund_in_amount` decimal(20,4) NOT NULL DEFAULT '0.0000',
    `status` tinyint(3) unsigned NOT NULL,
    `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by` bigint(20) unsigned NOT NULL DEFAULT '0',
    `updated_by` bigint(20) DEFAULT NULL,
    `updated_datetime` timestamp NULL DEFAULT NULL,
    `fund_out_amount` decimal(20,4) NOT NULL DEFAULT '0.0000',
    `saving_account_id` bigint(20) unsigned NOT NULL,
    PRIMARY KEY (`transaction_id`,`saving_account_id`)
);
-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS `saving_product`;
DROP TABLE IF EXISTS `saving_product_rule`;
DROP TABLE IF EXISTS `saving_account_amount_authorization`;
DROP TABLE IF EXISTS `saving_account`;
 
INSERT INTO saving_product (id,description,is_allow_overdraft,is_calculate_total_monthly_cash_in,is_calculate_pending_cash_in,is_calculate_pending_cash_out,created_timestamp,updated_timestamp) VALUES 
(1,'E-Money Account',0,1,1,1,'2020-06-21 12:15:22.000',NULL),
(2,'Partner Non Deposit Topup Account',1,0,0,1,'2020-06-21 12:17:27.000',NULL);

INSERT INTO saving_product_rule (saving_product_id,code,value,created_by,created_timestamp,updated_by,updated_timestamp) VALUES 
(1,'kyc[1].max_balance',2000000,0,'2020-06-21 12:24:55.000',NULL,NULL),
(1,'kyc[2].max_balance',10000000,0,'2020-06-21 12:25:24.000',NULL,NULL),
(1,'max_monthly_funds_in',20000000,0,'2020-06-21 12:25:57.000',NULL,NULL),
(1,'min_topup_amount',10000,0,'2020-06-21 12:18:52.000',NULL,NULL);

INSERT INTO saving_product_rule
(saving_product_id, code, value, created_by, created_timestamp, updated_by, updated_timestamp)
VALUES(2, 'max_overdraft', -1000000000, 0, CURRENT_TIMESTAMP(), 0, CURRENT_TIMESTAMP());
INSERT INTO account.saving_product
(id, description, is_allow_overdraft, is_calculate_total_monthly_cash_in, is_calculate_pending_cash_in, is_calculate_pending_cash_out, created_timestamp, updated_timestamp)
VALUES(3, 'payment invoice-', 0, 0, 0, 0, '2020-07-21 13:52:22.000', NULL);
	
UPDATE saving_account SET fund_in_end_period = LAST_DAY(CURRENT_TIMESTAMP) WHERE fund_in_end_period IS NULL;

ALTER TABLE saving_account ALTER fund_in_end_period SET DEFAULT LAST_DAY(CURRENT_TIMESTAMP);

select card_no,customer_id, balance from saving_account where customer_id in (11015,11017)
select * from saving_account where customer_id = 11017
select * from saving_account where customer_id = 11015
delete from saving_account where customer_id = 11017 and balance = 0
update saving_account set balance=100000 where customer_id = 11015

select * from saving_account_amount_authorization
delete from saving_account_amount_authorization
 select * from  saving_product_rule
 select * from  saving_account where customer_id = 13003
select * from saving_product

ALTER TABLE saving_account ADD `kyc_level` tinyint(3) NOT NULL DEFAULT 0

ALTER TABLE saving_account MODIFY `id` bigint(20) UNSIGNED AUTO_INCREMENT;
ALTER TABLE saving_account MODIFY `id`  BIGINT UNSIGNED NOT NULL;

DELETE FROM account.saving_account
WHERE id=1337238387983130624;

