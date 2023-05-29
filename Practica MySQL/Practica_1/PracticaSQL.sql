-- MySQL Script generated by MySQL Workbench
-- Thu Mar 30 18:54:45 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema practica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `practica` ;

-- -----------------------------------------------------
-- Schema practica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `practica` ;

-- -----------------------------------------------------
-- Table `practica`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`departamentos` (
  `dnombre` VARCHAR(30) NULL DEFAULT NULL,
  `dnumero` INT NOT NULL AUTO_INCREMENT,
  `jefeci` VARCHAR(10) NULL DEFAULT NULL,
  `jefe_fi` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`dnumero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `practica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`empleados` (
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `apellido` VARCHAR(30) NULL DEFAULT NULL,
  `ci` VARCHAR(10) NOT NULL,
  `fecha_n` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(30) NULL DEFAULT NULL,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `salario` INT NULL DEFAULT NULL,
  `superci` VARCHAR(10) NULL DEFAULT NULL,
  `dno` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ci`),
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`dno`)
    REFERENCES `practica`.`departamentos` (`dnumero`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `empleado_ibfk_2`
    FOREIGN KEY (`superci`)
    REFERENCES `practica`.`empleados` (`ci`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `dno` ON `practica`.`empleados` (`dno` ASC) VISIBLE;

CREATE INDEX `superci` ON `practica`.`empleados` (`superci` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `practica`.`carga_f`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`carga_f` (
  `eci` VARCHAR(10) NOT NULL,
  `dep_nom` VARCHAR(30) NULL DEFAULT NULL,
  `sexo` VARCHAR(1) NULL DEFAULT NULL,
  `fechan_n` DATE NULL DEFAULT NULL,
  `relacion` VARCHAR(10) NULL DEFAULT NULL,
  CONSTRAINT `carga_f_ibfk_1`
    FOREIGN KEY (`eci`)
    REFERENCES `practica`.`empleados` (`ci`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `eci` ON `practica`.`carga_f` (`eci` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `practica`.`localizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`localizacion` (
  `dnumero` INT NOT NULL,
  `dep_loca` VARCHAR(30) NULL DEFAULT NULL,
  CONSTRAINT `localizacion_ibfk_1`
    FOREIGN KEY (`dnumero`)
    REFERENCES `practica`.`departamentos` (`dnumero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `dnumero` ON `practica`.`localizacion` (`dnumero` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `practica`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`proyecto` (
  `pnombre` VARCHAR(30) NULL DEFAULT NULL,
  `pnumero` INT NOT NULL AUTO_INCREMENT,
  `plocal` VARCHAR(30) NULL DEFAULT NULL,
  `dnum` INT NULL DEFAULT NULL,
  PRIMARY KEY (`pnumero`),
  CONSTRAINT `proyecto_ibfk_1`
    FOREIGN KEY (`dnum`)
    REFERENCES `practica`.`departamentos` (`dnumero`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `dnum` ON `practica`.`proyecto` (`dnum` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `practica`.`trabaja_en`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`trabaja_en` (
  `eci` VARCHAR(10) NOT NULL,
  `pno` INT NOT NULL,
  `horas` DOUBLE(4,2) NULL DEFAULT NULL,
  CONSTRAINT `trabaja_en_ibfk_1`
    FOREIGN KEY (`eci`)
    REFERENCES `practica`.`empleados` (`ci`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `trabaja_en_ibfk_2`
    FOREIGN KEY (`pno`)
    REFERENCES `practica`.`proyectos` (`pnumero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `eci` ON `practica`.`trabaja_en` (`eci` ASC) VISIBLE;

CREATE INDEX `pno` ON `practica`.`trabaja_en` (`pno` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;