-- MySQL Script generated by MySQL Workbench
-- Fri Mar 31 18:10:20 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema confiapp_v1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema confiapp_v1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `confiapp_v1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `confiapp_v1` ;

-- -----------------------------------------------------
-- Table `confiapp_v1`.`menor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`menor` (
  `ID_menor` INT NOT NULL,
  `M_descripcion` VARCHAR(20) NULL DEFAULT NULL,
  `MN_colegio` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_menor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confiapp_v1`.`tutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`tutor` (
  `ID_tutor` INT NOT NULL,
  `TN_Empresa` VARCHAR(20) NULL DEFAULT NULL,
  `T_Parentesco` VARCHAR(20) NULL DEFAULT NULL,
  `T_ID_MENOR` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_tutor`),
  INDEX `T_ID_MENOR` (`T_ID_MENOR` ASC) VISIBLE,
  CONSTRAINT `tutor_ibfk_1`
    FOREIGN KEY (`T_ID_MENOR`)
    REFERENCES `confiapp_v1`.`menor` (`ID_menor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confiapp_v1`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`ruta` (
  `ID_RUTA` INT NOT NULL,
  `R_SALIDA` VARCHAR(20) NULL DEFAULT NULL,
  `R_LLEGADA` VARCHAR(20) NULL DEFAULT NULL,
  `R_FECHA` DATE NULL DEFAULT NULL,
  `R_ID_ALERTA` INT NULL DEFAULT NULL,
  `R_ID_MENOR` INT NULL DEFAULT NULL,
  `R_ID_TUTOR` INT NULL DEFAULT NULL,
  `R_HORA` TIME NULL DEFAULT NULL,
  `R_TIEMPO` TIME NULL DEFAULT NULL,
  `R_TTRANSPORTE` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_RUTA`),
  INDEX `R_ID_TUTOR` (`R_ID_TUTOR` ASC) VISIBLE,
  INDEX `R_ID_MENOR` (`R_ID_MENOR` ASC) VISIBLE,
  INDEX `R_ID_ALERTA` (`R_ID_ALERTA` ASC) VISIBLE,
  CONSTRAINT `ruta_ibfk_1`
    FOREIGN KEY (`R_ID_TUTOR`)
    REFERENCES `confiapp_v1`.`tutor` (`ID_tutor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `ruta_ibfk_2`
    FOREIGN KEY (`R_ID_MENOR`)
    REFERENCES `confiapp_v1`.`menor` (`ID_menor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `ruta_ibfk_3`
    FOREIGN KEY (`R_ID_ALERTA`)
    REFERENCES `confiapp_v1`.`alerta` (`ID_ALERTA`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confiapp_v1`.`alerta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`alerta` (
  `ID_ALERTA` INT NOT NULL,
  `ULTIMA_UBICACION` POINT NULL DEFAULT NULL,
  `ID_R` INT NULL DEFAULT NULL,
  `ID_T` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ALERTA`),
  INDEX `ID_T` (`ID_T` ASC) VISIBLE,
  INDEX `ID_R` (`ID_R` ASC) VISIBLE,
  CONSTRAINT `alerta_ibfk_1`
    FOREIGN KEY (`ID_T`)
    REFERENCES `confiapp_v1`.`tutor` (`ID_tutor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `alerta_ibfk_2`
    FOREIGN KEY (`ID_R`)
    REFERENCES `confiapp_v1`.`ruta` (`ID_RUTA`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confiapp_v1`.`aviso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`aviso` (
  `ID_AVISO` INT NOT NULL,
  `A_MENSAJE` VARCHAR(1500) NULL DEFAULT NULL,
  `A_NUMERO_TUTOR` INT NULL DEFAULT NULL,
  `A_VOZ` BLOB NULL DEFAULT NULL,
  `A_ID_MENOR` INT NULL DEFAULT NULL,
  `A_ID_TUTOR` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_AVISO`),
  INDEX `A_ID_TUTOR` (`A_ID_TUTOR` ASC) VISIBLE,
  INDEX `A_ID_MENOR` (`A_ID_MENOR` ASC) VISIBLE,
  CONSTRAINT `aviso_ibfk_1`
    FOREIGN KEY (`A_ID_TUTOR`)
    REFERENCES `confiapp_v1`.`tutor` (`ID_tutor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `aviso_ibfk_2`
    FOREIGN KEY (`A_ID_MENOR`)
    REFERENCES `confiapp_v1`.`menor` (`ID_menor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confiapp_v1`.`h_ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`h_ruta` (
  `ID_HR` INT NOT NULL,
  `HR_FECHA` DATE NULL DEFAULT NULL,
  `HR_HORA` TIME NULL DEFAULT NULL,
  `HR_SALIDA` VARCHAR(20) NULL DEFAULT NULL,
  `HR_LLEGADA` VARCHAR(20) NULL DEFAULT NULL,
  `HR_KILOMETROS` VARCHAR(20) NULL DEFAULT NULL,
  `HR_ID_RUTA` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_HR`),
  INDEX `HR_ID_RUTA` (`HR_ID_RUTA` ASC) VISIBLE,
  CONSTRAINT `h_ruta_ibfk_1`
    FOREIGN KEY (`HR_ID_RUTA`)
    REFERENCES `confiapp_v1`.`ruta` (`ID_RUTA`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `confiapp_v1`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v1`.`persona` (
  `ID_Persona` INT NOT NULL,
  `P_Edad` INT NULL DEFAULT NULL,
  `P_Email` VARCHAR(30) NULL DEFAULT NULL,
  `P_Contraseña` BLOB NULL DEFAULT NULL,
  `PC_Contraseña` BLOB NULL DEFAULT NULL,
  `P_Nombre` VARCHAR(30) NULL DEFAULT NULL,
  `P_Telefono` INT NULL DEFAULT NULL,
  `P_Ocupacion` VARCHAR(30) NULL DEFAULT NULL,
  `P_Direccion` VARCHAR(30) NULL DEFAULT NULL,
  `PF_nacimiento` DATE NULL DEFAULT NULL,
  `P_ID_MENOR` INT NULL DEFAULT NULL,
  `P_ID_TUTOR` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Persona`),
  INDEX `P_ID_TUTOR` (`P_ID_TUTOR` ASC) VISIBLE,
  INDEX `P_ID_MENOR` (`P_ID_MENOR` ASC) VISIBLE,
  CONSTRAINT `persona_ibfk_1`
    FOREIGN KEY (`P_ID_TUTOR`)
    REFERENCES `confiapp_v1`.`tutor` (`ID_tutor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `persona_ibfk_2`
    FOREIGN KEY (`P_ID_MENOR`)
    REFERENCES `confiapp_v1`.`menor` (`ID_menor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
