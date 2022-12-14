-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esports
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esports
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esports` DEFAULT CHARACTER SET utf8 ;
USE `esports` ;

-- -----------------------------------------------------
-- Table `esports`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Department` (
  `deptID` INT NOT NULL AUTO_INCREMENT COMMENT 'corporate departments like marketing, finance, etc.',
  `deptName` VARCHAR(45) NOT NULL,
  `deptDesc` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`deptID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Building_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Building_Type` (
  `buildingTypeID` INT NOT NULL AUTO_INCREMENT COMMENT 'HQ, Arena, etc.',
  `buildingType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`buildingTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Building` (
  `buildingID` INT NOT NULL AUTO_INCREMENT,
  `buildingName` VARCHAR(45) NOT NULL,
  `bAddress` VARCHAR(60) NOT NULL,
  `bCity` VARCHAR(60) NOT NULL,
  `bState` VARCHAR(45) NOT NULL,
  `bZip` VARCHAR(10) NOT NULL,
  `buildingTypeID` INT NOT NULL,
  PRIMARY KEY (`buildingID`),
  INDEX `fk_Building_buildingType1_idx` (`buildingTypeID` ASC) VISIBLE,
  CONSTRAINT `fk_Building_buildingType1`
    FOREIGN KEY (`buildingTypeID`)
    REFERENCES `esports`.`Building_Type` (`buildingTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Employee` (
  `employeeID` INT NOT NULL AUTO_INCREMENT,
  `empFirst` VARCHAR(45) NOT NULL,
  `empLast` VARCHAR(45) NOT NULL,
  `joinDate` DATE NOT NULL,
  `exitDate` DATE NULL,
  `salary` INT NOT NULL,
  `eAddress` VARCHAR(60) NOT NULL,
  `eCity` VARCHAR(60) NOT NULL,
  `eState` VARCHAR(45) NOT NULL,
  `eZIP` VARCHAR(10) NOT NULL,
  `deptID` INT NOT NULL,
  `reportsTo` INT NOT NULL,
  `buildingID` INT NOT NULL,
  PRIMARY KEY (`employeeID`),
  INDEX `fk_Employee_Department1_idx` (`deptID` ASC) VISIBLE,
  INDEX `fk_Employee_Building1_idx` (`buildingID` ASC) VISIBLE,
  INDEX `fk_Employee_Employee1_idx` (`reportsTo` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Department1`
    FOREIGN KEY (`deptID`)
    REFERENCES `esports`.`Department` (`deptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Building1`
    FOREIGN KEY (`buildingID`)
    REFERENCES `esports`.`Building` (`buildingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Employee1`
    FOREIGN KEY (`reportsTo`)
    REFERENCES `esports`.`Employee` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Video_Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Video_Game` (
  `gameID` INT NOT NULL AUTO_INCREMENT COMMENT 'each game is in 1 league',
  `gameName` VARCHAR(45) NOT NULL,
  `gameDesc` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`gameID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`League`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`League` (
  `leagueID` INT NOT NULL AUTO_INCREMENT COMMENT '1 video game can only be in 1 professional league',
  `leagueName` VARCHAR(45) NOT NULL,
  `leagueAbv` VARCHAR(45) NOT NULL,
  `gameID` INT NOT NULL,
  PRIMARY KEY (`leagueID`),
  INDEX `fk_League_Video_Game1_idx` (`gameID` ASC) VISIBLE,
  CONSTRAINT `fk_League_Video_Game1`
    FOREIGN KEY (`gameID`)
    REFERENCES `esports`.`Video_Game` (`gameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Team` (
  `teamID` INT NOT NULL AUTO_INCREMENT,
  `leagueID` INT NOT NULL,
  `teamName` VARCHAR(45) NOT NULL,
  `teamAbv` VARCHAR(45) NOT NULL,
  `begDate` DATE NOT NULL,
  `endDate` DATE NULL,
  PRIMARY KEY (`teamID`),
  INDEX `fk_Team_League1_idx` (`leagueID` ASC) VISIBLE,
  CONSTRAINT `fk_Team_League1`
    FOREIGN KEY (`leagueID`)
    REFERENCES `esports`.`League` (`leagueID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Player` (
  `playerID` INT NOT NULL AUTO_INCREMENT COMMENT 'player can also be a manager but not a coach\nplayer can only be in one league/play one game',
  `playerTag` VARCHAR(45) NOT NULL,
  `contractStart` DATE NOT NULL,
  `contractEnd` DATE NOT NULL,
  `contractCost` INT NOT NULL,
  `employeeID` INT NOT NULL,
  `teamID` INT NOT NULL,
  PRIMARY KEY (`playerID`),
  INDEX `fk_Player_Employee1_idx` (`employeeID` ASC) VISIBLE,
  INDEX `fk_Player_Team1_idx` (`teamID` ASC) VISIBLE,
  CONSTRAINT `fk_Player_Employee1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `esports`.`Employee` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_Team1`
    FOREIGN KEY (`teamID`)
    REFERENCES `esports`.`Team` (`teamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Content_Creator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Content_Creator` (
  `contentCreatorID` INT NOT NULL AUTO_INCREMENT COMMENT 'content creators solely create content for org\n\nex. Kyedae for 100 Thieves ',
  `creatorTag` VARCHAR(45) NOT NULL,
  `employeeID` INT NOT NULL,
  PRIMARY KEY (`contentCreatorID`),
  INDEX `fk_Content_Creator_Employee1_idx` (`employeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Content_Creator_Employee1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `esports`.`Employee` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Social_Media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Social_Media` (
  `mediaID` INT NOT NULL AUTO_INCREMENT,
  `mediaName` VARCHAR(45) NULL,
  `mediaAccount` VARCHAR(45) NULL,
  PRIMARY KEY (`mediaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Sponsorship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Sponsorship` (
  `sponsorshipID` INT NOT NULL AUTO_INCREMENT COMMENT 'Logitech, G-Fuel, Astro',
  `companyName` VARCHAR(60) NOT NULL,
  `contractStart` DATE NOT NULL,
  `contractEnd` DATE NOT NULL,
  `contractDeal` INT NOT NULL,
  PRIMARY KEY (`sponsorshipID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Equipment_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Equipment_Type` (
  `equipmentTypeID` INT NOT NULL AUTO_INCREMENT,
  `equipmentType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`equipmentTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Equipment` (
  `equipmentID` INT NOT NULL AUTO_INCREMENT COMMENT 'equipment can have a sponsorship',
  `equipmentTypeID` INT NOT NULL,
  `equipmentDesc` VARCHAR(60) NOT NULL,
  `sponsorshipID` INT NULL,
  PRIMARY KEY (`equipmentID`),
  INDEX `fk_Equipment_equipmentType1_idx` (`equipmentTypeID` ASC) VISIBLE,
  INDEX `fk_Equipment_Sponsorship1_idx` (`sponsorshipID` ASC) VISIBLE,
  CONSTRAINT `fk_Equipment_equipmentType1`
    FOREIGN KEY (`equipmentTypeID`)
    REFERENCES `esports`.`Equipment_Type` (`equipmentTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipment_Sponsorship1`
    FOREIGN KEY (`sponsorshipID`)
    REFERENCES `esports`.`Sponsorship` (`sponsorshipID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Coach` (
  `coachID` INT NOT NULL AUTO_INCREMENT COMMENT 'coach can\'t be a player or a manager \ncoach can only be in one league/coach one game',
  `coachTag` VARCHAR(45) NOT NULL,
  `employeeID` INT NOT NULL,
  `teamID` INT NOT NULL,
  PRIMARY KEY (`coachID`),
  INDEX `fk_Coach_Employee1_idx` (`employeeID` ASC) VISIBLE,
  INDEX `fk_Coach_Team1_idx` (`teamID` ASC) VISIBLE,
  CONSTRAINT `fk_Coach_Employee1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `esports`.`Employee` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coach_Team1`
    FOREIGN KEY (`teamID`)
    REFERENCES `esports`.`Team` (`teamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Vendor` (
  `vendorID` INT NOT NULL AUTO_INCREMENT,
  `vendorName` VARCHAR(45) NOT NULL,
  `vAddress` VARCHAR(60) NOT NULL,
  `vCity` VARCHAR(60) NOT NULL,
  `vState` VARCHAR(45) NOT NULL,
  `vZip` VARCHAR(10) NOT NULL,
  `vContactFirst` VARCHAR(45) NOT NULL,
  `vContactLast` VARCHAR(45) NOT NULL,
  `vContactNum` VARCHAR(10) NOT NULL,
  `vContactEmail` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`vendorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Merch_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Merch_Type` (
  `merchTypeID` INT NOT NULL AUTO_INCREMENT COMMENT 'apparel, accessories, figurines, posters',
  `merchType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`merchTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Merchandise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Merchandise` (
  `merchID` INT NOT NULL AUTO_INCREMENT,
  `merchName` VARCHAR(45) NOT NULL,
  `merchDesc` VARCHAR(45) NOT NULL,
  `merchBuy` DECIMAL(4,2) NOT NULL,
  `merchSell` DECIMAL(4,2) NOT NULL,
  `qoh` INT NOT NULL,
  `merchTypeID` INT NOT NULL,
  PRIMARY KEY (`merchID`),
  INDEX `fk_Merchandise_merchType1_idx` (`merchTypeID` ASC) VISIBLE,
  CONSTRAINT `fk_Merchandise_merchType1`
    FOREIGN KEY (`merchTypeID`)
    REFERENCES `esports`.`Merch_Type` (`merchTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Merch_Vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Merch_Vendor` (
  `merchVendorID` INT NOT NULL AUTO_INCREMENT,
  `merchID` INT NOT NULL,
  `vendorID` INT NOT NULL,
  `qtyOrdered` INT NOT NULL,
  `unitPrice` DECIMAL(4,2) NOT NULL,
  `totalPrice` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`merchVendorID`),
  INDEX `fk_Merchandise_has_Vendor_Vendor1_idx` (`vendorID` ASC) VISIBLE,
  INDEX `fk_Merchandise_has_Vendor_Merchandise1_idx` (`merchID` ASC) VISIBLE,
  CONSTRAINT `fk_Merchandise_has_Vendor_Merchandise1`
    FOREIGN KEY (`merchID`)
    REFERENCES `esports`.`Merchandise` (`merchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Merchandise_has_Vendor_Vendor1`
    FOREIGN KEY (`vendorID`)
    REFERENCES `esports`.`Vendor` (`vendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Advertisement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Advertisement` (
  `advertisementID` INT NOT NULL AUTO_INCREMENT,
  `platformID` INT NOT NULL,
  `sponsorshipID` INT NULL,
  `contentCreatorID` INT NULL,
  `merchID` INT NULL,
  PRIMARY KEY (`advertisementID`),
  INDEX `fk_Advertisement_Social_Media1_idx` (`platformID` ASC) VISIBLE,
  INDEX `fk_Advertisement_Sponsorship1_idx` (`sponsorshipID` ASC) VISIBLE,
  INDEX `fk_Advertisement_Content_Creator1_idx` (`contentCreatorID` ASC) VISIBLE,
  INDEX `fk_Advertisement_Merchandise1_idx` (`merchID` ASC) VISIBLE,
  CONSTRAINT `fk_Advertisement_Social_Media1`
    FOREIGN KEY (`platformID`)
    REFERENCES `esports`.`Social_Media` (`mediaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Advertisement_Sponsorship1`
    FOREIGN KEY (`sponsorshipID`)
    REFERENCES `esports`.`Sponsorship` (`sponsorshipID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Advertisement_Content_Creator1`
    FOREIGN KEY (`contentCreatorID`)
    REFERENCES `esports`.`Content_Creator` (`contentCreatorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Advertisement_Merchandise1`
    FOREIGN KEY (`merchID`)
    REFERENCES `esports`.`Merchandise` (`merchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Media_Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Media_Team` (
  `mediaTeamID` INT NOT NULL AUTO_INCREMENT,
  `mediaID` INT NOT NULL,
  `employeeID` INT NOT NULL,
  INDEX `fk_table1_Social_Media1_idx` (`mediaID` ASC) VISIBLE,
  PRIMARY KEY (`mediaTeamID`),
  INDEX `fk_Media_Team_Employee1_idx` (`employeeID` ASC) VISIBLE,
  CONSTRAINT `fk_table1_Social_Media1`
    FOREIGN KEY (`mediaID`)
    REFERENCES `esports`.`Social_Media` (`mediaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Media_Team_Employee1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `esports`.`Employee` (`employeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Merch_For_Players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Merch_For_Players` (
  `playerMerchID` INT NOT NULL AUTO_INCREMENT,
  `merchID` INT NOT NULL,
  `playerID` INT NOT NULL,
  PRIMARY KEY (`playerMerchID`),
  INDEX `fk_Merch_For_Players_Merchandise1_idx` (`merchID` ASC) VISIBLE,
  INDEX `fk_Merch_For_Players_Player1_idx` (`playerID` ASC) VISIBLE,
  CONSTRAINT `fk_Merch_For_Players_Merchandise1`
    FOREIGN KEY (`merchID`)
    REFERENCES `esports`.`Merchandise` (`merchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Merch_For_Players_Player1`
    FOREIGN KEY (`playerID`)
    REFERENCES `esports`.`Player` (`playerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Customer` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `cusFirst` VARCHAR(45) NOT NULL,
  `cusLast` VARCHAR(45) NOT NULL,
  `cAddress` VARCHAR(60) NOT NULL,
  `cCity` VARCHAR(60) NOT NULL,
  `cState` VARCHAR(60) NOT NULL,
  `cZip` VARCHAR(10) NOT NULL,
  `cPhone` VARCHAR(10) NULL,
  `cEmail` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esports`.`Order_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esports`.`Order_Detail` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `qtyOrdered` INT NOT NULL,
  `customerID` INT NOT NULL,
  `merchID` INT NOT NULL,
  INDEX `fk_Order_Detail_Customer1_idx` (`customerID` ASC) VISIBLE,
  PRIMARY KEY (`orderID`),
  INDEX `fk_Order_Detail_Merchandise1_idx` (`merchID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Detail_Customer1`
    FOREIGN KEY (`customerID`)
    REFERENCES `esports`.`Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Detail_Merchandise1`
    FOREIGN KEY (`merchID`)
    REFERENCES `esports`.`Merchandise` (`merchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;