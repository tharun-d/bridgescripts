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

