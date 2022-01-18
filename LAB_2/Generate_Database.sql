drop database mydb;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`UserInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserInfo` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Zip` INT NOT NULL,
  `Age` INT NOT NULL,
  `Gender` ENUM("M", "F", "N") NOT NULL,
  `Income` INT NOT NULL,
  `UserInfocol` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SocialNetworks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SocialNetworks` (
  `SocialNetworkID` INT NOT NULL AUTO_INCREMENT,
  `UserInfo_UserID` INT NOT NULL,
  PRIMARY KEY (`SocialNetworkID`),
  INDEX `fk_SocialNetworks_UserInfo1_idx` (`UserInfo_UserID` ASC) VISIBLE,
  CONSTRAINT `fk_SocialNetworks_UserInfo1`
    FOREIGN KEY (`UserInfo_UserID`)
    REFERENCES `mydb`.`UserInfo` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facebook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facebook` (
  `FacebookUserID` INT NOT NULL AUTO_INCREMENT,
  `ProfileName` VARCHAR(45) NOT NULL,
  `Attribute_1` VARCHAR(45) NOT NULL,
  `Attribute_2` VARCHAR(45) NOT NULL,
  `SocialNetworkID` INT NOT NULL,
  PRIMARY KEY (`FacebookUserID`),
  INDEX `fk_Facebook_SocialNetworks1_idx` (`SocialNetworkID` ASC) VISIBLE,
  CONSTRAINT `fk_Facebook_SocialNetworks1`
    FOREIGN KEY (`SocialNetworkID`)
    REFERENCES `mydb`.`SocialNetworks` (`SocialNetworkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Twitter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Twitter` (
  `TwitterID` INT NOT NULL AUTO_INCREMENT,
  `ProfileName` VARCHAR(45) NOT NULL,
  `Attribute_1` VARCHAR(45) NOT NULL,
  `Attribute_2` VARCHAR(45) NOT NULL,
  `SocialNetworkID` INT NOT NULL,
  PRIMARY KEY (`TwitterID`),
  INDEX `fk_Twitter_SocialNetworks1_idx` (`SocialNetworkID` ASC) VISIBLE,
  CONSTRAINT `fk_Twitter_SocialNetworks1`
    FOREIGN KEY (`SocialNetworkID`)
    REFERENCES `mydb`.`SocialNetworks` (`SocialNetworkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instagram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instagram` (
  `InstagramID` INT NOT NULL AUTO_INCREMENT,
  `ProfileName` VARCHAR(45) NOT NULL,
  `Attribute_1` VARCHAR(45) NOT NULL,
  `Attribute_2` VARCHAR(45) NOT NULL,
  `SocialNetworkID` INT NOT NULL,
  PRIMARY KEY (`InstagramID`),
  INDEX `fk_Instagram_SocialNetworks1_idx` (`SocialNetworkID` ASC) VISIBLE,
  CONSTRAINT `fk_Instagram_SocialNetworks1`
    FOREIGN KEY (`SocialNetworkID`)
    REFERENCES `mydb`.`SocialNetworks` (`SocialNetworkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Services` (
  `ServiceID` INT NOT NULL AUTO_INCREMENT,
  `ServiceName` VARCHAR(45) NOT NULL,
  `ServiceCost` INT NOT NULL,
  `ServiceShortDescription` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ServiceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `ProductCost` INT NOT NULL,
  `ProductShortDescription` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserProducts` (
  `UserID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`UserID`, `ProductID`),
  INDEX `fk_UserInfo_has_Products_Products1_idx` (`ProductID` ASC) VISIBLE,
  INDEX `fk_UserInfo_has_Products_UserInfo1_idx` (`UserID` ASC) VISIBLE,
  CONSTRAINT `fk_UserInfo_has_Products_UserInfo1`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`UserInfo` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserInfo_has_Products_Products1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mydb`.`Products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserServices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserServices` (
  `UserID` INT NOT NULL,
  `ServiceID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`UserID`, `ServiceID`),
  INDEX `fk_UserInfo_has_Services_Services1_idx` (`ServiceID` ASC) VISIBLE,
  INDEX `fk_UserInfo_has_Services_UserInfo1_idx` (`UserID` ASC) VISIBLE,
  CONSTRAINT `fk_UserInfo_has_Services_UserInfo1`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`UserInfo` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserInfo_has_Services_Services1`
    FOREIGN KEY (`ServiceID`)
    REFERENCES `mydb`.`Services` (`ServiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FacebookPosts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FacebookPosts` (
  `PostID` INT NOT NULL AUTO_INCREMENT,
  `PostText` VARCHAR(45) NOT NULL,
  `Facebook_FacebookUserID` INT NOT NULL,
  PRIMARY KEY (`PostID`),
  INDEX `fk_FacebookPosts_Facebook1_idx` (`Facebook_FacebookUserID` ASC) VISIBLE,
  CONSTRAINT `fk_FacebookPosts_Facebook1`
    FOREIGN KEY (`Facebook_FacebookUserID`)
    REFERENCES `mydb`.`Facebook` (`FacebookUserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TwitterPosts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TwitterPosts` (
  `TwitterPostID` INT NOT NULL AUTO_INCREMENT,
  `PostText` VARCHAR(45) NOT NULL,
  `Twitter_TwitterID` INT NOT NULL,
  PRIMARY KEY (`TwitterPostID`),
  INDEX `fk_TwitterPosts_Twitter1_idx` (`Twitter_TwitterID` ASC) VISIBLE,
  CONSTRAINT `fk_TwitterPosts_Twitter1`
    FOREIGN KEY (`Twitter_TwitterID`)
    REFERENCES `mydb`.`Twitter` (`TwitterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InstragramPost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InstragramPost` (
  `idInstragramPost` INT NOT NULL,
  `Picture` BLOB NOT NULL,
  `PostText` VARCHAR(45) NOT NULL,
  `Instagram_InstagramID` INT NOT NULL,
  PRIMARY KEY (`idInstragramPost`),
  INDEX `fk_InstragramPost_Instagram1_idx` (`Instagram_InstagramID` ASC) VISIBLE,
  CONSTRAINT `fk_InstragramPost_Instagram1`
    FOREIGN KEY (`Instagram_InstagramID`)
    REFERENCES `mydb`.`Instagram` (`InstagramID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


