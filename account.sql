CREATE database account
use account 

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
select * from saving_product_r

ALTER TABLE saving_account ADD `kyc_level` tinyint(3) NOT NULL DEFAULT 0

ALTER TABLE saving_account MODIFY `id` bigint(20) UNSIGNED AUTO_INCREMENT;
ALTER TABLE saving_account MODIFY `id`  BIGINT UNSIGNED NOT NULL;

DELETE FROM account.saving_account
WHERE id=1337238387983130624;
select * from  saving_account where customer_id = 1356885489749880832


INSERT INTO account.saving_product
(id, description, is_allow_overdraft, is_calculate_total_monthly_cash_in, is_calculate_pending_cash_in, is_calculate_pending_cash_out, created_timestamp, updated_timestamp)
VALUES(10, 'Alfa Topup Account', 0, 0, 0, 0, CURRENT_TIMESTAMP, NULL);

INSERT INTO account.saving_product_rule
(saving_product_id, code, value, created_by, created_timestamp, updated_by, updated_timestamp)
VALUES(10, 'payment_limit', 500000, 0, CURRENT_TIMESTAMP , 0, NULL);

select * from goose_db_version gdv spr 

select * from saving_account where customer_id = 1356885489749880832
select * from saving_account where card_no = "7438928689018"
INSERT INTO account.saving_account (id,card_no,customer_id,saving_product_id,balance,total_monthly_fund_in,fund_in_end_period,pending_fund_in,pending_fund_out,status,created_by,created_timestamp,updated_by,updated_timestamp,is_default_account) VALUES
	 (16,'000015',15,10,0.0000,0.0000,CURRENT_TIMESTAMP(),0.0000,0.0000,1,100,CURRENT_TIMESTAMP(),100,CURRENT_TIMESTAMP(),1);

select * from  saving_account_amount_authorization  
select * from  saving_product sp ro 
delete from  saving_account where customer_id = 10025

SELECT * from saving_product_rule spr 


