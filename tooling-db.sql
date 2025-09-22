-- Clean import for DB: tooling
-- Compatible with MySQL 5.7+/8.0+ and MariaDB 10.3+

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET NAMES utf8mb4;

START TRANSACTION;

-- Ensure database exists and select it
CREATE DATABASE IF NOT EXISTS `tooling`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `tooling`;

-- Recreate table
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT,
  `username`  VARCHAR(255) NOT NULL,
  `password`  VARCHAR(255) NOT NULL,
  `email`     VARCHAR(255) NOT NULL,
  `user_type` VARCHAR(255) NOT NULL,
  `status`    VARCHAR(10)  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed row
INSERT INTO `users`
  (`id`,`username`,`password`,`email`,`user_type`,`status`)
VALUES
  (1,'admin','21232f297a57a5a743894a0e4a801fc3','dare@dare.com','admin','1')
ON DUPLICATE KEY UPDATE
  username=VALUES(username),
  password=VALUES(password),
  email=VALUES(email),
  user_type=VALUES(user_type),
  status=VALUES(status);

-- Keep AUTO_INCREMENT ahead of inserted ids
ALTER TABLE `users` AUTO_INCREMENT = 3;

COMMIT;