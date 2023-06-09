-- MySQL Script generated by MySQL Workbench
-- Sun May 28 22:12:41 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gestion_ventas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestion_ventas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestion_ventas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `gestion_ventas` ;

-- -----------------------------------------------------
-- Table `gestion_ventas`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_ventas`.`cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `apellido1` VARCHAR(100) NULL DEFAULT NULL,
  `apellido2` VARCHAR(100) NULL DEFAULT NULL,
  `ciudad` VARCHAR(100) NULL DEFAULT NULL,
  `categoria` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gestion_ventas`.`comercial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_ventas`.`comercial` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `apellido1` VARCHAR(100) NULL DEFAULT NULL,
  `apellido2` VARCHAR(100) NULL DEFAULT NULL,
  `comision` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gestion_ventas`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_ventas`.`pedido` (
  `id` INT NOT NULL,
  `cantidad` DOUBLE NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `id_cliente` INT NOT NULL,
  `id_comercial` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente` (`id_cliente` ASC) INVISIBLE,
  INDEX `id_comercial` (`id_comercial` ASC) INVISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `gestion_ventas`.`cliente` (`id`),
  CONSTRAINT `id_comercial`
    FOREIGN KEY (`id_comercial`)
    REFERENCES `gestion_ventas`.`comercial` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
