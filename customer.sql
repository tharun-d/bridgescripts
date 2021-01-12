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

update customer set name  = "aa" where id = 10070
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

CREATE TABLE IF NOT EXISTS `kyc_rejection_reason` (
    `id` int UNSIGNED AUTO_INCREMENT,
    `reason` text NOT NULL DEFAULT '',
    `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
    primary key (id)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `customer_account_verification` (
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `ektp_status` tinyint(4) NULL,
    `verification_status` tinyint(4) NULL,
    `processed_at` varchar(40) NULL,
    `rejection_reason` varchar(255) NULL,
    `rejected_by` bigint(20) NULL,
    primary key (customer_id)
) ENGINE = InnoDB;

where kyc_level = 1 and verification_status = 2 and ektp_status = 2 
select * from customer c order by id desc

update customer 
set dob = NULL, kyc_level = 1, verification_status = 2, ektp_status = 2, requested_date = NOW() 
ALTER TABLE kyc_audit_logs ADD kyc_rejection_reason_id bigint NULL;
ALTER TABLE kyc_audit_logs ADD kyc_rejection_reason_id bigint NULL;

ALTER TABLE kyc_audit_logs DROP COLUMN rejection_reason

CREATE TABLE IF NOT EXISTS `temp_customer` (
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `id_no` varchar(30) NOT NULL,
    `full_name` varchar(40) NOT NULL,
    `dob` DATETIME NOT NULL,
    PRIMARY KEY (`customer_id`)
) ENGINE = InnoDB;

ALTER TABLE customer.customer ADD ektp_file_name varchar(255) NULL;
ALTER TABLE customer.customer ADD selfie_file_name varchar(255) NULL;

ALTER TABLE customer.customer CHANGE marrital_status marital_status varchar(10) NOT NULL DEFAULT '';
ALTER TABLE customer.customer ADD occupation varchar(255) NOT NULL DEFAULT '';

ALTER TABLE customer MODIFY marital_status VARCHAR(255) NOT NULL default ''
update customer set ektp_status = 0 where ektp_status = NULL;
update customer set verification_status = 0 where verification_status = NULL;
update customer set rt_rw = '' where rt_rw = NULL;
update customer set ektp_file_name = '';
update customer set selfie_file_name = '';
update customer set gender = 0;

ALTER TABLE customer MODIFY ektp_status tinyint(4) NOT NULL default 0;
ALTER TABLE customer MODIFY verification_status tinyint(4) NOT NULL default 0;
ALTER TABLE customer MODIFY rt_rw varchar(255)  NOT NULL default '';
ALTER TABLE customer MODIFY ektp_file_name varchar(255) NOT NULL default '';
ALTER TABLE customer MODIFY selfie_file_name varchar(255) NOT NULL default '';
ALTER TABLE customer MODIFY gender int NOT NULL default 0;

select requested_date,ektp_status,verification_status from customer where id = 13003
select * from temp_customer tc where tc.customer_id =13003
delete from temp_customer
ALTER TABLE temp_customer ADD `request_id` TEXT NOT NULL DEFAULT '';

update customer set rt_rw = "hello", ektp_status = 0,verification_status=1, full_name = "aa" 
where id = 13003

select requested_date from customer where requested_date is NULL;

update customer set requested_date  = now() where requested_date = NULL 
update customer set customer.selfie_file_name = "9490285247",
customer.ektp_file_name = "9490285247" where id = 19031

drop table customer_audit_logs
CREATE TABLE IF NOT EXISTS `customer_audit_logs` (
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `customer_name` varchar(255) NOT NULL DEFAULT '',
    `request_id` TEXT NOT NULL DEFAULT '',
    `step` varchar(40) NOT NULL DEFAULT '',
    `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
    `status` tinyint(4) NOT NULL DEFAULT 0,
    `rejection_reason` TEXT NOT NULL DEFAULT '',
    `actor` varchar(40) NOT NULL DEFAULT '',
    `reference_id` BIGINT UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB;


delete from customer_audit_logs

select * from kyc_rejection_reason krr 

select * from customer where full_name LIKE "%Mas%"
update customer set requested_date = now(), ektp_status = 1, verification_status= 2 where full_name LIKE "%Mas%"

INSERT INTO customer.temp_customer
(customer_id, id_no, full_name, dob, request_id)
VALUES(19022, '3273022904920001', 'Arya Rezavidi Viciyudha', '1992-04-29 07:00:00.000', '11-aaaa-99-099');

select count(*) from customer_audit_logs
group by request_id 

WITH ranked_messages AS (
  SELECT request_id ,status, step, created_on, rejection_reason, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY created_on DESC) AS rn
  FROM customer_audit_logs WHERE customer_id = 13003
)
SELECT request_id ,status, step, created_on, 
CASE
    WHEN status = 2 THEN rejection_reason
    ELSE ''
END AS rejection_reason 
FROM ranked_messages WHERE rn = 1;

order by created_on DESC

ALTER TABLE customer MODIFY `id` bigint(20) UNSIGNED AUTO_INCREMENT;

select * from customer_audit_logs cal 
select * from temp_customer tc 

DELETE from customer_audit_logs where customer_id = 19022
INSERT INTO customer.temp_customer
(customer_id, id_no, full_name, dob, request_id)
VALUES(19001, '323', 'Masumarno 99', '1992-04-29 07:00:00.000', '11-aa-99-011');
ALTER TABLE customer DROP COLUMN kyc_level;

select * from customer order by id desc


UPDATE customer SET selfie_file_name = "fileName" WHERE ID = 100
UPDATE customer SET ektp_file_name = fileName WHERE ID = 100
SELECT id_no, id, mobile, selfie_file_name from customer where id = 100

UPDATE customer SET verification_status = 1, ektp_status = 0 where verification_status = 0

SELECT * from customer_audit_logs where mobile = "085889376946"

select requested_date,ektp_status,verification_status,mobile from customer where id = 13003
select * from temp_customer tc where tc.customer_id =13003
select * from customer where id =13003

select * from customer order by id desc

select ektp_status, verification_status from customer where id = 1339857673017532416

delete from customer where id = 1339857673017532416;
delete from temp_customer;

INSERT INTO customer.customer
(id, name, mobile, email, cif, id_no, full_name, dob, gender, address, photo_url, icon_url, status, `type`, created_by, created_time, updated_by, updated_time, verification_status, ektp_status, requested_date, place_of_birth, blood_type, province, city, district, sub_district, religion, marital_status, employee, ektp_file_name, selfie_file_name, occupation, rt_rw)
VALUES(1339857673017532416, 'Jeff Test Xl', '081906405999', 'bb@gmail.com', '1339857673855922176', '', 'Jeff Test Xl', NULL, 0, '', '', '', 1, 1, 100, '2020-12-18 15:58:57.000', 100, '2020-12-18 09:00:25.000', 1, 0, NULL, '', '', 0, 0, 0, 0, 0, '', '', 'e-ktp-1339857673017532416', 'selfie-1339857673017532416', '', '');

INSERT INTO customer.temp_customer
(customer_id, id_no, full_name, dob, request_id)
VALUES(1339857673017532416, '3530000000119191', 'Jeff Xl', '2020-12-18 07:00:00.000', 'f9792b34-efcc-4528-8939-e7567fcc3a34');

UPDATE `customer_audit_logs` SET `request_id` = '' WHERE `request_id` is NULL;
UPDATE `temp_customer` SET `request_id` = '' WHERE `request_id` is NULL;

ALTER TABLE `customer_audit_logs` MODIFY column `request_id` varchar(255) NOT NULL DEFAULT '';
ALTER TABLE `temp_customer` MODIFY column `request_id` varchar(255) NOT NULL DEFAULT '';

select * from temp_customer tc where tc.request_id is NULL;
select * from customer_audit_logs c where c.request_id is NULL; 

ALTER TABLE `kyc_rejection_reason` MODIFY column `reason` varchar(255) NOT NULL DEFAULT '';

select * from kyc_rejection_reason krr 

UPDATE `customer_audit_logs` SET `request_id` = '' WHERE `request_id` is NULL;
UPDATE `customer_audit_logs` SET `rejection_reason` = '' WHERE `rejection_reason` is NULL;
UPDATE `temp_customer` SET `request_id` = '' WHERE `request_id` is NULL;
UPDATE `kyc_rejection_reason` SET `reason` = '' WHERE `reason` is NULL;

ALTER TABLE `customer_audit_logs` MODIFY column `rejection_reason` varchar(255) NOT NULL DEFAULT '';
ALTER TABLE `customer_audit_logs` MODIFY column `request_id` varchar(255) NOT NULL DEFAULT '';
ALTER TABLE `temp_customer` MODIFY column `request_id` varchar(255) NOT NULL DEFAULT '';
ALTER TABLE `kyc_rejection_reason` MODIFY column `reason` varchar(255) NOT NULL DEFAULT '';

select * from customer offset 1 limit 1 

select * from customer.temp_customer 


