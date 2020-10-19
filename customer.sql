CREATE database customer
use customer  


CREATE TABLE IF NOT EXISTS `customer` (
  `id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(40) NULL DEFAULT '',
  `mobile` VARCHAR(15) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT '',
  `cif` VARCHAR(255) NOT NULL,
  `id_no` VARCHAR(30) NULL DEFAULT '',
  `full_name` VARCHAR(40) NULL DEFAULT '',
  `dob` DATETIME NULL DEFAULT '0000-00-00',
  `gender` INT NULL COMMENT '0 Male\n1 Female',
  `address` VARCHAR(255) NULL DEFAULT '',
  `photo_url` VARCHAR(255) NULL DEFAULT '',
  `icon_url` VARCHAR(255) NULL DEFAULT '',
  `status` INT NOT NULL,
  `type` TINYINT(3) NOT NULL,
  `kyc_level` TINYINT(3) NOT NULL,
  `created_by` BIGINT UNSIGNED NOT NULL,
  `created_time` DATETIME NOT NULL,
  `updated_by` BIGINT UNSIGNED NOT NULL,
  `updated_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mobile_UNIQUE` (`mobile` ASC),
  UNIQUE INDEX `cif_UNIQUE` (`cif` ASC))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `customer_merchant` (
  `id` BIGINT UNSIGNED NOT NULL,
  `customer_id` BIGINT UNSIGNED NOT NULL,
  `mobile` VARCHAR(15) NOT NULL,
  `merchant_id` BIGINT UNSIGNED NOT NULL,
  `merchant_name` VARCHAR(255) NOT NULL DEFAULT '',
  `partner_account_id` varchar(255),
  `status` INT NOT NULL,
  `last_linked` DATETIME NOT NULL,
  `last_unlinked` DATETIME NULL DEFAULT '0000-00-00',
  `created_by` BIGINT UNSIGNED NOT NULL,
  `created_time` DATETIME NOT NULL,
  `updated_by` BIGINT UNSIGNED NOT NULL,
  `updated_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

ALTER TABLE customer.customer_merchant ADD partner_account_id varchar(100) NOT NULL;

ALTER TABLE customer.customer ADD rejection_reason varchar(255) NULL;
ALTER TABLE customer.customer ADD ektp_status tinyint(4) NULL;
ALTER TABLE customer.customer ADD rejection_date datetime NULL;
ALTER TABLE customer.customer ADD rejection_step varchar(100) NULL;
ALTER TABLE customer.customer ADD rejected_by bigint(20) NULL;
ALTER TABLE customer.customer ADD verification_status tinyint(4) NULL;
ALTER TABLE customer.customer ADD requested_date datetime NULL;

ALTER TABLE customer.customer ADD place_of_birth varchar(100) NOT NULL default '';
ALTER TABLE customer.customer ADD blood_type varchar(10) NOT NULL default '';
ALTER TABLE customer.customer ADD province bigint NOT NULL default 0;
ALTER TABLE customer.customer ADD city bigint NOT NULL default 0;
ALTER TABLE customer.customer ADD district bigint NOT NULL default 0;
ALTER TABLE customer.customer ADD sub_district bigint NOT NULL default 0;
ALTER TABLE customer.customer ADD religion bigint NOT NULL default 0;
ALTER TABLE customer.customer ADD marrital_status varchar(10) NOT NULL default '';
ALTER TABLE customer.customer ADD employee varchar(10) NOT NULL default '';

select * from customer where name='AJ2'
select * from customer where name='Harsha1'
select * from customer_merchant

select id, name, mobile, requested_date from customer
where kyc_level = 1 and verification_status = 2 and ektp_status = 2

select * from customer limit 2,2

update customer set requested_date = now() where id='14000'

CREATE TABLE IF NOT EXISTS `religion` (
    `id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

insert into religion (`id`, `name`) Values 
(1, 'Islam'),
(2, 'Protestan'),
(3, 'katolik'),
(4, 'Hindu'),
(5, 'Budha'),
(6, 'Kong Hu Cu')

select * from customer c2 where id = 14002

select CURRENT_TIMESTAMP()

RENAME TABLE disctrict TO district;
RENAME TABLE subdisctrict TO subdistrict;

ALTER TABLE subdistrict CHANGE disctrict_id  district_id BIGINT UNSIGNED NOT NULL;

CREATE TABLE IF NOT EXISTS `kyc_audit_logs` (
    `agent_id` BIGINT UNSIGNED NOT NULL,
    `customer_cif` varchar(255) NOT NULL,
    `kyc_level` tinyint(3) NOT NULL,
    `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
    `rejection_reason` VARCHAR(255) NOT NULL DEFAULT '',
    `notes` TEXT NOT NULL DEFAULT ''
) ENGINE = InnoDB;

drop table kyc_audit_logs
select * from kyc_audit_logs 
