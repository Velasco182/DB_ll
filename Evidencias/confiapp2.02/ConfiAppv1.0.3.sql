-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema confiapp_v3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema confiapp_v3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `confiapp_v3` DEFAULT CHARACTER SET utf8mb3 ;
USE `confiapp_v3` ;

-- -----------------------------------------------------
-- Table `confiapp_v3`.`alertas_avisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v3`.`alertas_avisos` (
  `idalertas_avisos` INT NOT NULL AUTO_INCREMENT,
  `tipo_alerta_aviso` ENUM('Alerta', 'Aviso') NOT NULL,
  `ultima_ubicacion` POINT NOT NULL,
  `mensaje_alerta_aviso` VARCHAR(200) NOT NULL,
  `voz_alerta_aviso` BLOB NOT NULL,
  PRIMARY KEY (`idalertas_avisos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `confiapp_v3`.`puntos_de_referencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v3`.`puntos_de_referencia` (
  `idpuntos_referencia` INT NOT NULL AUTO_INCREMENT,
  `nombre_punto` VARCHAR(50) NOT NULL,
  `direccion_punto` VARCHAR(50) NOT NULL,
  `georeferencia` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idpuntos_referencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `confiapp_v3`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v3`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `foto_persona` BLOB NULL DEFAULT NULL,
  `primer_nombre` VARCHAR(20) NOT NULL,
  `segundo_nombre` VARCHAR(20) NOT NULL,
  `primer_apellido` VARCHAR(20) NOT NULL,
  `segundo_apellido` VARCHAR(20) NOT NULL,
  `direccion_usuario` VARCHAR(50) NOT NULL,
  `email_usuario` VARCHAR(50) NOT NULL,
  `contraseña_usuario` VARCHAR(20) NOT NULL,
  `telefono_usuario` VARCHAR(20) NOT NULL,
  `telefono_alternativo` VARCHAR(20) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `informacion_adicional` TEXT NOT NULL,
  `rh_usuario` VARCHAR(10) NOT NULL,
  `numero_documento` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `confiapp_v3`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v3`.`ruta` (
  `idruta` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `fecha_ruta` DATETIME NOT NULL,
  `punto_salida` VARCHAR(40) NOT NULL,
  `geosalida` POINT NOT NULL,
  `punto_llegada` VARCHAR(40) NOT NULL,
  `geollegada` POINT NOT NULL,
  `tiempo_estimado` TIME NOT NULL,
  `estado` ENUM('1.activa', '2. inactiva') NOT NULL,
  `medio_transporte` VARCHAR(45) NOT NULL,
  `alertas_avisos_idalertas_avisos` INT NOT NULL,
  `puntos_de_referencia_idpuntos_referencia` INT NOT NULL,
  PRIMARY KEY (`idruta`),
  INDEX `fk_ruta_usuario1_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_ruta_alertas_avisos1_idx` (`alertas_avisos_idalertas_avisos` ASC) VISIBLE,
  INDEX `fk_ruta_puntos_de_referencia1_idx` (`puntos_de_referencia_idpuntos_referencia` ASC) VISIBLE,
  CONSTRAINT `fk_ruta_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `confiapp_v3`.`usuario` (`idusuario`),
  CONSTRAINT `fk_ruta_alertas_avisos1`
    FOREIGN KEY (`alertas_avisos_idalertas_avisos`)
    REFERENCES `confiapp_v3`.`alertas_avisos` (`idalertas_avisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta_puntos_de_referencia1`
    FOREIGN KEY (`puntos_de_referencia_idpuntos_referencia`)
    REFERENCES `confiapp_v3`.`puntos_de_referencia` (`idpuntos_referencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `confiapp_v3`.`ruta_activa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v3`.`ruta_activa` (
  `idruta_activa` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idruta` INT NOT NULL,
  `fecha_actual` TIMESTAMP NOT NULL,
  `distancia_aproximada` FLOAT NOT NULL,
  `posicion_actual` POINT NOT NULL,
  PRIMARY KEY (`idruta_activa`),
  INDEX `fk_ruta_activa_ruta1_idx` (`idruta` ASC) VISIBLE,
  INDEX `fk_ruta_activa_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_ruta_activa_ruta1`
    FOREIGN KEY (`idruta`)
    REFERENCES `confiapp_v3`.`ruta` (`idruta`),
  CONSTRAINT `fk_ruta_activa_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `confiapp_v3`.`usuario` (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `confiapp_v3`.`historial_ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confiapp_v3`.`historial_ruta` (
  `id_historial_ruta` INT NOT NULL AUTO_INCREMENT,
  `historial_ruta_fecha` DATE NOT NULL,
  `historial_ruta_hora` TIME NOT NULL,
  `historial_ruta_salida` VARCHAR(45) NOT NULL,
  `historial_ruta_llegada` VARCHAR(45) NOT NULL,
  `historial_ruta_kilometros` VARCHAR(45) NOT NULL,
  `ruta_idruta` INT NOT NULL,
  PRIMARY KEY (`id_historial_ruta`),
  UNIQUE INDEX `id_historial_ruta_UNIQUE` (`id_historial_ruta` ASC) VISIBLE,
  INDEX `fk_historial_ruta_ruta1_idx` (`ruta_idruta` ASC) VISIBLE,
  CONSTRAINT `fk_historial_ruta_ruta1`
    FOREIGN KEY (`ruta_idruta`)
    REFERENCES `confiapp_v3`.`ruta` (`idruta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
