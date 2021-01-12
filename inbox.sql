CREATE database inbox

use inbox

CREATE TABLE IF NOT EXISTS `notification_inbox` (
  `notification_id` BIGINT NOT NULL AUTO_INCREMENT,
  `sender` VARCHAR(50) NOT NULL,
  `subject` VARCHAR(127) NOT NULL,
  `message` TEXT NOT NULL,
  `landing_url` VARCHAR(255) NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `created_by` BIGINT NULL,
  `created_time` DATETIME NULL,
  `notification_type_id` INT NOT NULL,
  PRIMARY KEY (`notification_id`),
  INDEX `fk_inbox_message_user_idx` (`user_id` ASC))
ENGINE = InnoDB;


SELECT * from notification_inbox order by notification_id desc limit 100
