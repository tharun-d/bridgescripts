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

select * from customer where name='Harsha'
select * from customer where name='Harsha1'
