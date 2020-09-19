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


select card_no,customer_id, balance from saving_account where customer_id in (11015,11017)
select * from saving_account where customer_id = 11017
select * from saving_account where customer_id = 11015
update saving_account set balance=1000 where customer_id = 11015

select * from saving_account_amount_authorization
delete from saving_account_amount_authorization
 select * from  saving_product_rule

