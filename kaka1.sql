-- MySQL Script generated by MySQL Workbench
-- Thu Oct  6 14:07:28 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
  `id` INT NOT NULL,
  `correct` TINYINT NULL,
  `wrong` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_question` (
  `user_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `question_id`),
  INDEX `fk_user_has_question_question1_idx` (`question_id` ASC) ,
  INDEX `fk_user_has_question_user_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_user_has_question_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `mydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question_has_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`question_has_answer` (
  `question_id` INT NOT NULL,
  `answer_id` INT NOT NULL,
  PRIMARY KEY (`question_id`, `answer_id`),
  INDEX `fk_question_has_answer_answer1_idx` (`answer_id` ASC) ,
  INDEX `fk_question_has_answer_question1_idx` (`question_id` ASC) ,
  CONSTRAINT `fk_question_has_answer_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `mydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_answer_answer1`
    FOREIGN KEY (`answer_id`)
    REFERENCES `mydb`.`answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_answer` (
  `user_id` INT NOT NULL,
  `answer_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `answer_id`),
  INDEX `fk_user_has_answer_answer1_idx` (`answer_id` ASC),
  INDEX `fk_user_has_answer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_answer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_answer_answer1`
    FOREIGN KEY (`answer_id`)
    REFERENCES `mydb`.`answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;