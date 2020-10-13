CREATE database bookkeeper
use bookkeeper  

CREATE TABLE IF NOT EXISTS bk_entity_mapping (
	module_id INT ( 11 ) NOT NULL,
	app_id BIGINT ( 20 )UNSIGNED NOT NULL,
	external_id VARCHAR ( 30 ),
	STATUS TINYINT ( 3 )UNSIGNED NOT NULL,
	created_by BIGINT ( 20 )UNSIGNED NOT NULL ,
	created_timestamp TIMESTAMP NOT NULL,
	updated_by BIGINT ( 20 )UNSIGNED ,
	updated_timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS journal_setup_entry (
  transaction_type int(11) NOT NULL,
  entry_type char(1) NOT NULL,
  sequence int(11) NOT NULL,
  gl_account varchar(20) NOT NULL,
  mapping_field varchar(30) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS journal_setup (
  transaction_type int(11) NOT NULL,
  acc_transaction_type varchar(100) DEFAULT NULL,
  remark varchar(100) DEFAULT NULL,
  created_by bigint(20) unsigned NOT NULL DEFAULT '0',
  created_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by bigint(20) unsigned DEFAULT NULL,
  updated_timestamp timestamp NULL DEFAULT NULL,
  PRIMARY KEY (transaction_type)
) ENGINE=InnoDB;

INSERT INTO journal_setup (transaction_type,acc_transaction_type,remark,created_by,created_timestamp,updated_by,updated_timestamp) VALUES 
(1,NULL,'E Money Topup',0,'2020-07-06 13:16:54.000',NULL,NULL);

INSERT INTO journal_setup_entry (transaction_type,entry_type,sequence,gl_account,mapping_field) VALUES 
(1,'D',1,'GL_1140100','amount')
,(1,'C',1,'GL_2110100','amount');

INSERT INTO journal_setup (transaction_type,acc_transaction_type,remark,created_by,created_timestamp,updated_by,updated_timestamp) VALUES 
(2,NULL,'Payment at partner',0,'2020-07-06 13:16:54.000',NULL,NULL);

INSERT INTO journal_setup_entry (transaction_type,entry_type,sequence,gl_account,mapping_field) VALUES 
(2,'D',1,'GL_2110100','amount')
,(2,'C',1,'GL_2110200','amount');

INSERT INTO journal_setup (transaction_type,acc_transaction_type,remark,created_by,created_timestamp,updated_by,updated_timestamp) VALUES 
(3,NULL,'Refund',0,'2020-07-06 13:16:54.000',NULL,NULL);

INSERT INTO journal_setup_entry (transaction_type,entry_type,sequence,gl_account,mapping_field) VALUES 
(3,'D',1,'GL_2110200','amount')
,(3,'C',1,'GL_4100102','amount');

delete from journal_setup_entry where transaction_type = 3

select * from bk_entity_mapping
select * from journal_setup_entry

select * from journal_setup
delete from journal_setup where transaction_type = 3

SELECT exists (SELECT * FROM journal_setup where transaction_type=2)
SELECT remark FROM journal_setup where transaction_type=2
SELECT entry_type,sequence,gl_account,mapping_field FROM journal_setup_entry where transaction_type=2
