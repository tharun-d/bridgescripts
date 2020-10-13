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

CREATE TABLE IF NOT EXISTS token_event (
    id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    token TEXT NOT NULL,
    status VARCHAR(20) NOT NULL,
    count int NOT NULL,
    created_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_timestamp TIMESTAMP NULL,
    blocked_until_timestamp TIMESTAMP NULL,
    PRIMARY KEY (id)
)
select * from token_event te 
delete  from token_event

select * from `saving_account_transaction`
select * from `transaction_event`
delete from `transaction_event`
select * from `transaction_event` where id = 200921083818208

select te.id as transactionid, sct.saving_account_id,sct.transaction_type,sct.amount from `transaction_event` te 
	INNER JOIN `saving_account_transaction` sct ON te.id = sct.transaction_id
		where te.id = '200921083818208'
		
		
		select sat.transaction_id,sat.status,sat.amount , sat.transaction_type ,te.event_type_id ,sat.saving_account_id,dt.saving_account_id as to_saving_account_id,sat.description   
	from saving_account_transaction sat join transaction_event te on 
	sat.transaction_id = te.id 
	join  saving_account_transaction dt on dt.transaction_id = sat.transaction_id 
	where sat.transaction_id = '200921083818208'
and sat.transaction_type = 2 and dt.transaction_type =1 

ALTER TABLE transaction_event ADD is_refunded BOOL NOT NULL DEFAULT FALSE;
ALTER TABLE transaction_event DROP COLUMN is_refunded

select * from transaction_event te where te.id = 200928153944866

