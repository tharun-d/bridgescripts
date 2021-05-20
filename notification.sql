CREATE database notification

use notification
CREATE TABLE IF NOT EXISTS `template` (
  `template_id` VARCHAR(100) NOT NULL,
  `channel_type` INT NOT NULL COMMENT '1 = sms\n2 = email\n4 = push',
  `language` CHAR(2) NOT NULL,
  `sender` VARCHAR(50) NOT NULL,
  `subject` VARCHAR(127) NOT NULL,
  `message` TEXT NOT NULL,
  `created_by` BIGINT UNSIGNED NOT NULL,
  `created_time` DATETIME NOT NULL,
  `updated_by` BIGINT UNSIGNED NOT NULL,
  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`template_id`, `channel_type`, `language`))
ENGINE = InnoDB;


select * from template  where template_id = "auth.mail.invite.user"

select * from template 
where template_id = "trx.cpm.payment.amount.limit" and `language` = "id" and channel_type = 4


UPDATE template set subject = "Aduh, Belanjaanmu Kepentok Limit", message = "Transaksi melewati limit Rp500.000. Cek belanjaanmu dan coba lagi ya"
where template_id = "trx.cpm.payment.amount.limit"