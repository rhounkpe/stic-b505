-- MappedSuperclass Inheritance Strategy
-- Each database table contains both the base class and the subclass properties
-- It’s not possible to use polymorphic queries
-- 
-- Uncomment and it become Table Per Class Strategy
-- 
-- 
DROP DATABASE IF EXISTS `refuge`;
-- GRANT ALL PRIVILEGES ON refuge .* TO 'asbl'@'localhost' IDENTIFIED BY 'HlnRuf2018';
-- FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS `refuge` CHARACTER SET 'utf8';
USE `refuge`;
-- 
CREATE TABLE IF NOT EXISTS `Person` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    `tel` VARCHAR(16),
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- Employee Veterinary
CREATE TABLE IF NOT EXISTS `Veterinary` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    `tel` VARCHAR(16),
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- Employee table
CREATE TABLE IF NOT EXISTS `Employee` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    -- tel[1-3]
    `tel` VARCHAR(16),
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    `matricule` CHAR(8) NOT NULL,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- Volunteer table
CREATE TABLE IF NOT EXISTS `Volunteer` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    -- tel[1-3]
    `tel` VARCHAR(16),
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    `matricule` CHAR(8) NOT NULL,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- 
-- Table Animal
--
/*
CREATE TABLE IF NOT EXISTS `Animal` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_naissance` DATE,
    `date_arrivee` DATE,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
*/
-- 
-- 
-- Table Pet
--
CREATE TABLE IF NOT EXISTS `Pet` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_naissance` DATETIME,
    `date_arrivee` DATETIME,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- 
-- Table Wild_Animal
--
CREATE TABLE IF NOT EXISTS `Wild_Animal` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_naissance` DATETIME,
    `date_arrivee` DATETIME,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- 
-- Table Farm_Animal
--
CREATE TABLE IF NOT EXISTS `Farm_Animal` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_naissance` DATETIME,
    `date_arrivee` DATETIME,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- 
-- Table Site
-- 
CREATE TABLE IF NOT EXISTS `Site` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
--  
-- Table Adoption
/*
CREATE TABLE IF NOT EXISTS `Adoption` (

)
ENGINE=INNODB;
*/
-- 
-- 
-- Let's populate Veterinary with 10 records
-- 
-- Trigger to verify email format. If not valid, will not save the record.
INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Hounkpe',
    'Rufin',
    '1976-06-13 08:55:00',
    'Cotonou',
    'rhounkpe@gmail.com',
    '0484979320',
    'Belgium',
    'Brussels',
    'Vorst',
    '1190',
    'Van Volxemlaan 302',
    '48'
);