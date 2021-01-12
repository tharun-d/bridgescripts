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

/*dummy insert for push notification*/
insert into template(template_id, channel_type, language, sender, subject, message, created_time, created_by, updated_by)
values ('trx.topup.in', 4, 'id', '', 'Uang Masuk', 'Top-up saldo Anda senilai {{.topupAmount}} berhasil ditambahkan. Saldo dimii Anda saat ini {{.balance}}', now(), 0, 0);

insert into template(template_id, channel_type, language, sender, subject, message, created_time, created_by, updated_by)
values ('auth.otp', 1, 'id', '', '', 'Kode OTP: {{.code}}. Hati-hati penipuan! Kode OTP ini hanya untuk kamu, jangan pernah berikan ke siapapun. Pihak Dimii tidak pernah meminta kode ini', now(), 0, 0);

select * from template  where template_id = "auth.mail.invite.user"

insert into
    template(
        template_id,
        channel_type,
        language,
        sender,
        subject,
        message,
        created_time,
        created_by,
        updated_by
    )
values
    (
        'auth.mail.invite.user',
        2,
        'en',
        '',
        'Welcome to Dimiiland',
        'Hello,<br/>You are all set to access Dimiiland service. Please click on this link below and continue with your organization gsuite account to login.<br/>{{.inviteURL}}<br/> For your security, this link will expire in 24 hour. Please contact your Dimiiland administrator to reactivate the link.',
        now(),
        0,
        0
    );
   
update template 
set message = 'Hello,<br/><br/>You are all set to access Dimiiland service. Please click on this link below and continue with your organization gsuite account to login.<br/><br/><a href="{{.inviteURL}}">Verify</a><br/><br/>For your security, this link will expire in 24 hour. Please contact your Dimiiland administrator to reactivate the link.<br/><br/>Regards,<br/>Dimiiland Team'
where template.template_id = 'auth.gsuite.invite.user'

update template 
set message = 'Hello,<br/><br/>You are all set to access Dimiiland service. Please click on this link below to login.<br/><br/><a href="{{.inviteURL}}">Verify</a><br/><br/>For your security, this link will expire in 24 hour. Please contact your Dimiiland administrator to reactivate the link.<br/><br/>Regards,<br/>Dimiiland Team'
where template.template_id = 'auth.mail.invite.user'


select * from template where template_id = "kyc.level.unverified" and `language` = "id" and channel_type = 4
