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
-- Table `aci`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`Category` (
  `identifier` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`Training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`Training` (
  `identifier` SMALLINT NOT NULL,
  `denomination` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`Alert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`Alert` (
  `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Category_identifier` TINYINT UNSIGNED NOT NULL,
  `Training_identifier` SMALLINT NOT NULL,
  `denomination` VARCHAR(30) NOT NULL,
  `description` VARCHAR(100) NULL,
  `priority` TINYINT UNSIGNED NOT NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  INDEX `fk_Alert_Category1_idx` (`Category_identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE,
  INDEX `fk_Alert_Training1_idx` (`Training_identifier` ASC) VISIBLE,
  CONSTRAINT `fk_Alert_Category1`
    FOREIGN KEY (`Category_identifier`)
    REFERENCES `aci`.`Category` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alert_Training1`
    FOREIGN KEY (`Training_identifier`)
    REFERENCES `aci`.`Training` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`Resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`Resource` (
  `identifier` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  UNIQUE INDEX `denomination_UNIQUE` (`denomination` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`AlertResource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`AlertResource` (
  `Alert_identifier` SMALLINT UNSIGNED NOT NULL,
  `Resource_identifier` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`Alert_identifier`, `Resource_identifier`),
  INDEX `fk_AlertResource_Resource1_idx` (`Resource_identifier` ASC) VISIBLE,
  CONSTRAINT `fk_AlertResource_Alert1`
    FOREIGN KEY (`Alert_identifier`)
    REFERENCES `aci`.`Alert` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AlertResource_Resource1`
    FOREIGN KEY (`Resource_identifier`)
    REFERENCES `aci`.`Resource` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`Connection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`Connection` (
  `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `denomination` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `key` TINYTEXT NOT NULL,
  `date_joined` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  `is_active` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aci`.`Instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aci`.`Instance` (
  `identifier` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Connection_identifier` SMALLINT UNSIGNED NOT NULL,
  `Alert_identifier` SMALLINT UNSIGNED NOT NULL,
  `AgentTraining_identifier` BIGINT UNSIGNED NULL,
  `is_solved` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `is_training_completed` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `date_training_completed` DATETIME NULL,
  `date_registered` DATETIME NOT NULL DEFAULT NOW(),
  `date_updated` DATETIME NOT NULL DEFAULT NOW(),
  INDEX `fk_Instance_Connection1_idx` (`Connection_identifier` ASC) VISIBLE,
  INDEX `fk_Instance_Alert1_idx` (`Alert_identifier` ASC) VISIBLE,
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC) VISIBLE,
  PRIMARY KEY (`identifier`),
  CONSTRAINT `fk_Instance_Connection1`
    FOREIGN KEY (`Connection_identifier`)
    REFERENCES `aci`.`Connection` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instance_Alert1`
    FOREIGN KEY (`Alert_identifier`)
    REFERENCES `aci`.`Alert` (`identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
