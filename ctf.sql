CREATE DATABASE `ctf`;

CREATE TABLE `users` (
  `username` VARCHAR(200) PRIMARY KEY,
  `name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL UNIQUE,
  `mobile` INT(10) NOT NULL,
  `college` VARCHAR(200) NOT NULL,
  `password` TEXT NOT NULL,
  `cookie_data` TEXT NOT NULL,
  `tutorial_level` INT NOT NULL DEFAULT 0
);

CREATE TABLE `registration_temp` (
  `username` VARCHAR(200) PRIMARY KEY,
  `name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL UNIQUE,
  `mobile` INT(10) NOT NULL,
  `college` VARCHAR(200) NOT NULL,
  `password` TEXT NOT NULL,
  `conf_code` TEXT NOT NULL,
  `confirmed` INT(1) DEFAULT 0
);

CREATE TABLE `password_reset` (
  `username` VARCHAR(200) PRIMARY KEY,
  `reset_key` TEXT NOT NULL,
  `link_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`username`) REFERENCES `users`(`username`)
);

CREATE TABLE `question` (
	`id` VARCHAR(200) PRIMARY KEY,
	`webpage` VARCHAR(200) NOT NULL UNIQUE,
	`rating` INT(1) NOT NULL,
	`marks` INT NOT NULL,
	`domain` ENUM('crypto', 'forensic', 'linux', 'networking', 'webexp') NOT NULL,
	`solution` TEXT
);

CREATE TABLE `solved` (
	`username` VARCHAR(200),
	`question_id` VARCHAR(200) NOT NULL,
	`time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (`username`) REFERENCES `users`(`username`),
	FOREIGN KEY (`question_id`) REFERENCES `question`(`id`)
);

CREATE TABLE `leaderboard`(
	`username` VARCHAR(200) PRIMARY KEY,
	`total_score` INT NOT NULL DEFAULT 0,
	`last_solved` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `inject`(
	`username` VARCHAR(200) PRIMARY KEY,
	`password` VARCHAR(200) NOT NULL
);
