CREATE database transaction
use transaction   


CREATE TABLE IF NOT EXISTS saving_account_transaction (
  id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  saving_account_id BIGINT UNSIGNED NOT NULL,
  transaction_type INT UNSIGNED NOT NULL,
  transaction_datetime DATETIME,
  amount DECIMAL(20,4) NOT NULL,
  status TINYINT NOT NULL,
  description VARCHAR(100) NULL DEFAULT NULL,
  created_by BIGINT UNSIGNED NOT NULL DEFAULT 0,
  created_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  committed_by BIGINT UNSIGNED NULL DEFAULT NULL,
  committed_timestamp TIMESTAMP NULL DEFAULT NULL,
  transaction_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (transaction_id, transaction_type)
);

CREATE TABLE IF NOT EXISTS transaction_event (
  id BIGINT UNSIGNED NOT NULL,
  transaction_datetime TIMESTAMP NOT NULL,
  event_type_id SMALLINT UNSIGNED NOT NULL,
  amount DECIMAL(20,4) NOT NULL,
  location_info VARCHAR(200) NULL,
  partner_id BIGINT(20) NOT NULL,
  partner_reference_id VARCHAR(200) NOT NULL,
  description VARCHAR(200) NULL DEFAULT NULL,
  status TINYINT NOT NULL,
  sub_status TINYINT NOT NULL DEFAULT 0,
  created_by BIGINT UNSIGNED NOT NULL DEFAULT 0,
  created_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  committed_by BIGINT UNSIGNED NULL DEFAULT NULL,
  committed_timestamp TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

select * from `saving_account_transaction`
select * from `transaction_event`
delete from `transaction_event`

select is_refunded from transaction_event te where te.id = 200928153944866

drop table token_for_cpm
select * from token_for_cpm  
select * from transaction_event order by id desc
select * from transfer_blocklist tb order by created_timestamp desc

select * from transaction_event where cpm_data is  not null order by id desc


