-- MySQL Script generated by MySQL Workbench
-- Fri Aug 11 22:32:25 2023
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
-- Table `mydb`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoas` (
  `cod_pessoa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`cod_pessoa`),
  UNIQUE INDEX `cod_pessoa_UNIQUE` (`cod_pessoa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fabrincantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fabrincantes` (
  `cod_fabricante` INT NOT NULL,
  `fabricante` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_fabricante`),
  UNIQUE INDEX `cod_fabricante_UNIQUE` (`cod_fabricante` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`modelos` (
  `cod_modelo` INT NOT NULL,
  `desc_modelo` VARCHAR(45) NULL,
  `fabrincantes_cod_fabricante` INT NOT NULL,
  PRIMARY KEY (`cod_modelo`),
  UNIQUE INDEX `desc_modelo_UNIQUE` (`desc_modelo` ASC) VISIBLE,
  INDEX `fk_modelos_fabrincantes_idx` (`fabrincantes_cod_fabricante` ASC) VISIBLE,
  CONSTRAINT `fk_modelos_fabrincantes`
    FOREIGN KEY (`fabrincantes_cod_fabricante`)
    REFERENCES `mydb`.`fabrincantes` (`cod_fabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vendas` (
  `cod_venda` INT NOT NULL,
  `data_venda` DATE NULL,
  `valor_venda` DECIMAL(10,2) NULL,
  `pessoas_cod_pessoa` INT NOT NULL,
  `modelos_cod_modelo` INT NOT NULL,
  PRIMARY KEY (`cod_venda`),
  UNIQUE INDEX `cod_venda_UNIQUE` (`cod_venda` ASC) VISIBLE,
  INDEX `fk_vendas_pessoas1_idx` (`pessoas_cod_pessoa` ASC) VISIBLE,
  INDEX `fk_vendas_modelos1_idx` (`modelos_cod_modelo` ASC) VISIBLE,
  CONSTRAINT `fk_vendas_pessoas1`
    FOREIGN KEY (`pessoas_cod_pessoa`)
    REFERENCES `mydb`.`pessoas` (`cod_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_modelos1`
    FOREIGN KEY (`modelos_cod_modelo`)
    REFERENCES `mydb`.`modelos` (`cod_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
