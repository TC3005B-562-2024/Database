-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aci
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aci
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aci` DEFAULT CHARACTER SET utf8mb4 ;
USE `aci` ;

-- -----------------------------------------------------
-- Table `aci`.`connection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`connection` (
  `identifier` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(100) NOT NULL,
  `description` TINYTEXT NULL,
  `date_joined` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) INVISIBLE,
  INDEX `date_updated_INDEX` (`date_updated` ASC) INVISIBLE,
  INDEX `is_active_INDEX` (`is_active` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`category` (
  `identifier` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(100) NOT NULL,
  `description` TINYTEXT NULL,
  `priority` TINYINT UNSIGNED NOT NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE,
  INDEX `priority_INDEX` (`priority` ASC) INVISIBLE,
  INDEX `date_updated_INDEX` (`date_updated` ASC) INVISIBLE,
  INDEX `is_active_INDEX` (`is_active` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`training` (
  `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) INVISIBLE,
  INDEX `date_updated_INDEX` (`date_updated` ASC) INVISIBLE,
  INDEX `is_active_INDEX` (`is_active` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`insight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`insight` (
  `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_identifier` TINYINT UNSIGNED NOT NULL,
  `denomination` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE,
  INDEX `fk_insight_category_idx` (`category_identifier` ASC) VISIBLE,
  INDEX `date_updated_INDEX` (`date_updated` ASC) INVISIBLE,
  INDEX `is_active_INDEX` (`is_active` ASC) VISIBLE,
  CONSTRAINT `fk_insight_category`
    FOREIGN KEY (`category_identifier`)
    REFERENCES `aci`.`category` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`alert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`alert` (
  `identifier` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection_identifier` INT UNSIGNED NOT NULL,
  `insight_identifier` SMALLINT UNSIGNED NOT NULL,
  `training_identifier` SMALLINT UNSIGNED NULL,
  `resource` VARCHAR(200) NOT NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_solved` TINYINT UNSIGNED NULL,
  `date_training_completed` DATETIME NULL,
  `has_training` TINYINT UNSIGNED GENERATED ALWAYS AS (if(`training_identifier` is not null, 1, 0)),
  `is_training_completed` TINYINT UNSIGNED GENERATED ALWAYS AS (if(`date_training_completed` is not null, 1, 0)),
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  INDEX `fk_alert_connection1_idx` (`connection_identifier` ASC) VISIBLE,
  INDEX `fk_alert_training1_idx` (`training_identifier` ASC) VISIBLE,
  INDEX `fk_alert_insight1_idx` (`insight_identifier` ASC) VISIBLE,
  INDEX `resource_INDEX` (`resource` ASC) INVISIBLE,
  INDEX `date_updated_INDEX` (`date_updated` ASC) INVISIBLE,
  INDEX `is_solved_INDEX` (`is_solved` ASC) VISIBLE,
  CONSTRAINT `fk_alert_connection1`
    FOREIGN KEY (`connection_identifier`)
    REFERENCES `aci`.`connection` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alert_training1`
    FOREIGN KEY (`training_identifier`)
    REFERENCES `aci`.`training` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alert_insight1`
    FOREIGN KEY (`insight_identifier`)
    REFERENCES `aci`.`insight` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
