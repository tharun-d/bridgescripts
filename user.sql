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
  `` bigint(20) unsigned NOT NULL,
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

CREATE TABLE `application` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
);

select * from application
insert into application values (1, 'dimiland', 'hello',1 ,'100', now(), '100', now())

CREATE TABLE `user_application` (
  `user_id` bigint(40) unsigned NOT NULL,
  `application_id` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
);
select * from user_application
insert into user_application values (17001, 1,1 ,'100', now(), '100', now())
insert into user_application values (18016, 1,1 ,'100', now(), '100', now())

ALTER TABLE `role` MODIFY `id` bigint(20) unsigned AUTO_INCREMENT;
ALTER TABLE `permission` MODIFY `id` bigint(20) unsigned AUTO_INCREMENT;

ALTER TABLE user_device ALTER device_reg_token SET DEFAULT '';
UPDATE user_device SET device_reg_token = '' WHERE device_reg_token IS NULL;
ALTER TABLE user_device ADD PRIMARY KEY(mobile, device_id);

ALTER TABLE user MODIFY mobile VARCHAR(255);
ALTER TABLE user DROP index mobile_unique;
ALTER TABLE user ADD domain VARCHAR(30) NOT NULL AFTER status;
ALTER TABLE user ADD `last_login` DATETIME;
ALTER TABLE user ADD `block_reason` varchar(255) DEFAULT '';
ALTER TABLE user MODIFY `passcode` VARCHAR(255)  NULL;
ALTER TABLE user DROP domain ;
ALTER TABLE user MODIFY  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

select * from role
insert into `role` values (Default,'Role a','role a added', 1 , now(), now(), '11', now())
insert into `role` values (Default,'dimiiland','role super admin added', 1 , now(), now(), '100', now())

select id from role
select * from user_role
insert into `user_role` values (1,16000,1, 100 , now(),  '100', now())
insert into `user_role` values (2,16000,1, 100 , now(),  '100', now())
select * from user ud2 
select * from `application`

select  u.id, u.email, u.status, max(ud.last_login) as last, r.name from user u
		inner join user_device ud on ud.mobile = u.mobile 
		inner join user_role ur on ur.user_id = u.id 
		inner join role r on r.id = ur.role_id
		inner join user_application ua on ua.user_id = u.id 
		inner join application a on a.id = ua.application_id
		
		group by u.id, r.name limit 5 offset 0

UPDATE user_device ud
set ud.last_login = NULL
set ud.last_login = now() 

select  u.id, u.email, u.status, ud.last_login as last, r.name from user u
		inner join user_device ud on ud.device_id = u.device_id 
		inner join user_role ur on ur.user_id = u.id 
		inner join role r on r.id = ur.role_id
		inner join user_application ua on ua.user_id = u.id 
		inner join application a on a.id = ua.application_id
		
		group by u.id, r.name limit 5 offset 0
		
delete FROM user where mobile = 999
select application.name from user,user_application,application 
where user.id = user_application.user_id and user_application.application_id = application.id 
and user.username = 'superadmin'

select  * from role_permission rp 

select * from user_role ur 

SELECT * from user order by updated_time desc limit 5 offset 1

SELECT * from user where email = '11123@gmail.com'
SELECT * from user_role


select * from user where email = 'superadmin@dimii.dev'

select last_login from `user` where last_login != null

UPDATE `user` set last_login = now() 
where email = 'ellennellen7@gmail.com'

UPDATE `user` set email = "111", username = "a"
where email = 'tharundintakurthi@gmail.com'

ALTER TABLE `user` MODIFY `id` bigint(20) UNSIGNED AUTO_INCREMENT;
ALTER TABLE user MODIFY `id`  BIGINT UNSIGNED NOT NULL;
select * from user where username = 'superadmin' order by id desc

select * from user order by id desc where email = "tharundintakurthi@gmail.com" order by id desc
select * from permission p gdv ua p2  

select * from user_device where mobile = "7438928689018"

SELECT device_id, dev from user where mobile = "7438928689018"

SELECT ud.mobile, ud.device_id, ud.expired_device_id_blocked, ud.counter, 
		ud.status, ud.device_reg_token, ud.user_id
		FROM user_device  ud
		JOIN user u ON u.device_id = ud.device_id
			 AND u.mobile = ud.mobile
		WHERE u.mobile = "7438928689018"

select * from user