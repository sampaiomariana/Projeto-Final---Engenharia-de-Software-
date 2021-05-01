-- MySQL Script generated by MySQL Workbench
-- Fri Apr 16 12:15:42 2021
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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cadastro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cadastro` (
  `idCadastro` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`idCadastro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autenticação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autenticação` (
  `idUsuário` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `Cadastro_idCadastro` INT NOT NULL,
  PRIMARY KEY (`idUsuário`, `Cadastro_idCadastro`),
  INDEX `fk_Autenticação_Cadastro_idx` (`Cadastro_idCadastro` ASC) VISIBLE,
  CONSTRAINT `fk_Autenticação_Cadastro`
    FOREIGN KEY (`Cadastro_idCadastro`)
    REFERENCES `mydb`.`Cadastro` (`idCadastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Imóvel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Imóvel` (
  `idImóvel` INT NOT NULL,
  `classedoimóvel` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `numeromaxhospedes` INT NOT NULL,
  `datainicio` DATE NOT NULL,
  `datafim` DATE NOT NULL,
  `valordiariaminimo` FLOAT NOT NULL,
  `Autenticação_idUsuário` INT NOT NULL,
  `Autenticação_Cadastro_idCadastro` INT NOT NULL,
  PRIMARY KEY (`idImóvel`, `Autenticação_idUsuário`, `Autenticação_Cadastro_idCadastro`),
  INDEX `fk_Imóvel_Autenticação1_idx` (`Autenticação_idUsuário` ASC, `Autenticação_Cadastro_idCadastro` ASC) VISIBLE,
  CONSTRAINT `fk_Imóvel_Autenticação1`
    FOREIGN KEY (`Autenticação_idUsuário` , `Autenticação_Cadastro_idCadastro`)
    REFERENCES `mydb`.`Autenticação` (`idUsuário` , `Cadastro_idCadastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cadastrarproposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cadastrarproposta` (
  `idcadastrarproposta` INT NOT NULL,
  `datainicio` DATE NOT NULL,
  `datafim` DATE NOT NULL,
  `numerodehospedes` INT NOT NULL,
  `valordadiaria` FLOAT NOT NULL,
  `Autenticação_idUsuário` INT NOT NULL,
  `Autenticação_Cadastro_idCadastro` INT NOT NULL,
  PRIMARY KEY (`idcadastrarproposta`),
  INDEX `fk_cadastrarproposta_Autenticação1_idx` (`Autenticação_idUsuário` ASC, `Autenticação_Cadastro_idCadastro` ASC) VISIBLE,
  CONSTRAINT `fk_cadastrarproposta_Autenticação1`
    FOREIGN KEY (`Autenticação_idUsuário` , `Autenticação_Cadastro_idCadastro`)
    REFERENCES `mydb`.`Autenticação` (`idUsuário` , `Cadastro_idCadastro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;