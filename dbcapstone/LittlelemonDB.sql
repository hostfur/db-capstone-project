-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff Table` (
  `StaffID` INT NOT NULL,
  `Staffrole` VARCHAR(255) NOT NULL,
  `Staff Salary` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customer Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customer Table` (
  `CustomerID` INT NOT NULL,
  `Fullname` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Phone` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `StaffID_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `StaffID_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDM`.`Staff Table` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Booking Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Booking Table` (
  `BookingID` INT NOT NULL,
  `Booking Date` DATE NOT NULL,
  `Table Number` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `Customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customer Table` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Order Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Order Table` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `OrderQuantity` INT NOT NULL,
  `TotalCost` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Customer_fk_id_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Customer_fk_id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customer Table` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Delivery Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Delivery Table` (
  `Delivery ID` INT NOT NULL,
  `Delivery Status` VARCHAR(255) NOT NULL,
  `Delivery Date` DATE NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`Delivery ID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Order Table` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `MenuID` INT NOT NULL,
  `cuisines` VARCHAR(255) NOT NULL,
  `Starters` VARCHAR(255) NOT NULL,
  `courses` VARCHAR(255) NOT NULL,
  `drinks` VARCHAR(255) NOT NULL,
  `desserts` VARCHAR(255) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `order_fk_id_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_fk_id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Order Table` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
