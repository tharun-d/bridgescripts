CREATE database user
use user

drop table user
CREATE TABLE `role_permission` (
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(40) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
)

CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
)

CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
)

CREATE TABLE `user_role` (
  `role_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(40) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
)

CREATE TABLE IF NOT EXISTS `user` (
  `id` BIGINT UNSIGNED NOT NULL,
  `username` VARCHAR(255) NULL,
  `name` VARCHAR(40) NULL,
  `mobile` VARCHAR(15) NOT NULL,
  `email` VARCHAR(255) NULL,
  `passcode` VARCHAR(255) NOT NULL,
  `device_id` VARCHAR(255) NULL,
  `status` INT NOT NULL COMMENT '1 active\n2  inactive\n3  blocked\n4  deleted',
  `last_blocked` DATETIME NULL,
  `created_by` BIGINT UNSIGNED NOT NULL,
  `created_time` DATETIME NOT NULL,
  `updated_by` BIGINT UNSIGNED NOT NULL,
  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mobile_UNIQUE` (`mobile` ASC)
);

CREATE TABLE IF NOT EXISTS `user_device` (
  `mobile` VARCHAR(15) NOT NULL,
  `device_id` VARCHAR(255) NULL,
  `expired_device_id_blocked` INT NULL,
  `counter` INT NOT NULL DEFAULT 0,
  `status` INT NOT NULL COMMENT '1 Unblocked\n2  Blocked',
  `last_login` TIMESTAMP NULL,
  `device_reg_token` varchar(255) NULL COMMENT 'FCM Device registration token'
);


ALTER TABLE `role` MODIFY `id` bigint(20) unsigned AUTO_INCREMENT;
ALTER TABLE `permission` MODIFY `id` bigint(20) unsigned AUTO_INCREMENT;

ALTER TABLE user_device ALTER device_reg_token SET DEFAULT '';
UPDATE user_device SET device_reg_token = '' WHERE device_reg_token IS NULL;
ALTER TABLE user_device ADD PRIMARY KEY(mobile, device_id);

ALTER TABLE user MODIFY mobile VARCHAR(255);
ALTER TABLE user DROP index mobile_unique;
#ALTER TABLE user ADD domain VARCHAR(30) NOT NULL AFTER status;

select * from user
