CREATE database onboarding

CREATE TABLE IF NOT EXISTS `temp_customer` (
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `id_no` varchar(30) NOT NULL,
    `full_name` varchar(40) NOT NULL,
    `dob` DATETIME NOT NULL,
    `request_id` varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`customer_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `kyc_rejection_reason` (
    `id` int UNSIGNED AUTO_INCREMENT,
    `reason` varchar(255) NOT NULL DEFAULT '',
    `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
    primary key (`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `customer_audit_logs` (
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `customer_name` varchar(255) NOT NULL DEFAULT '',
    `request_id` varchar(255) NOT NULL DEFAULT '',
    `step` varchar(40) NOT NULL DEFAULT '',
    `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
    `status` tinyint(4) NOT NULL DEFAULT 0,
    `rejection_reason` varchar(255) NOT NULL DEFAULT '',
    `actor` varchar(40) NOT NULL DEFAULT '',
    `reference_id` BIGINT UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `account_close` (
  `user_id` bigint(20) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `emoney_status` varchar(20) NOT NULL,
  `llinkage_status` varchar(20) NOT NULL,
  `account_status` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `registration` (
    `id` int UNSIGNED AUTO_INCREMENT,
    `registration_id` BIGINT UNSIGNED NOT NULL,
    `customer_mobile` varchar(40) NOT NULL,
    `customer_device_id` varchar(200) NOT NULL DEFAULT '',
    `registration_status` varchar (100) NOT NULL DEFAULT '',
    `registration_date` DATETIME NOT NULL,
    `updated_date` DATETIME,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

ALTER TABLE `account_close` CHANGE `llinkage_status` `linkage_status` VARCHAR(20) NOT NULL;
ALTER TABLE `account_close` ADD `limits` INT NOT NULL AFTER `status`;

CREATE TABLE IF NOT EXISTS `terms_and_conditions_version` (
   	`id` int UNSIGNED AUTO_INCREMENT,
    `version` varchar(255) NOT NULL DEFAULT '',
    `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

INSERT INTO terms_and_conditions_version
(version, created_on, updated_on)
VALUES('v1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

delete from terms_and_conditions_version
CREATE TABLE IF NOT EXISTS `terms_and_conditions_logs` (
   	`customer_id` bigint(20) NOT NULL,
    `terms_and_conditions_version_id` int NOT NULL,
    `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB;

INSERT INTO terms_and_conditions_logs
(customer_id, version, created_on)
VALUES(11,'v1', CURRENT_TIMESTAMP);

select * from terms_and_conditions_version
select * from terms_and_conditions_logs order by terms_and_conditions_version_id desc

select * from registration r 
SELECT id, version, created_on, updated_on FROM terms_and_conditions_version 
		WHERE id=(SELECT max(id) FROM terms_and_conditions_version)
		
INSERT INTO terms_and_conditions_version
(version, created_on, updated_on)
VALUES('v1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

delete  from terms_and_conditions_version where version = 'v2'
