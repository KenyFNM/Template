CREATE DATABASE IF NOT EXISTS `template`;


ALTER DATABASE `template`
	DEFAULT CHARACTER SET UTF8MB4;
	
ALTER DATABASE `template`
	DEFAULT COLLATE UTF8MB4_UNICODE_CI;

CREATE TABLE `users` (
	`identifier` VARCHAR(60) NOT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`group` VARCHAR(50) NULL DEFAULT 'user',
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`position` VARCHAR(255) NULL DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',

	PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;


CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`rare` TINYINT NOT NULL DEFAULT 0,
	`can_remove` TINYINT NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;


CREATE TABLE `job_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB;


INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;


INSERT INTO `jobs` VALUES ('unemployed','Unemployed');

ALTER TABLE `users` ADD COLUMN `job2` varchar(20) DEFAULT 'unemployed2';
ALTER TABLE `users` ADD COLUMN `job2_grade` int(11) DEFAULT 0;
ALTER TABLE `users` ADD COLUMN `secondjob` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unemployed';
ALTER TABLE `users` ADD COLUMN `secondjob_grade` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0';
