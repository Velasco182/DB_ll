CREATE DATABASE  IF NOT EXISTS `confiapp_v3` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `confiapp_v3`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: confiapp_v3
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alertas_avisos`
--

DROP TABLE IF EXISTS `alertas_avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas_avisos` (
  `idalertas_avisos` int NOT NULL AUTO_INCREMENT,
  `tipo_alerta_aviso` enum('Alerta','Aviso') NOT NULL,
  `ultima_ubicacion` point NOT NULL,
  `mensaje_alerta_aviso` varchar(200) NOT NULL,
  `voz_alerta_aviso` blob NOT NULL,
  PRIMARY KEY (`idalertas_avisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_ruta`
--

DROP TABLE IF EXISTS `historial_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_ruta` (
  `id_historial_ruta` int NOT NULL AUTO_INCREMENT,
  `historial_ruta_fecha` date NOT NULL,
  `historial_ruta_hora` time NOT NULL,
  `historial_ruta_salida` varchar(45) NOT NULL,
  `historial_ruta_llegada` varchar(45) NOT NULL,
  `historial_ruta_kilometros` varchar(45) NOT NULL,
  `ruta_idruta` int NOT NULL,
  PRIMARY KEY (`id_historial_ruta`),
  UNIQUE KEY `id_historial_ruta_UNIQUE` (`id_historial_ruta`),
  KEY `fk_historial_ruta_ruta1_idx` (`ruta_idruta`),
  CONSTRAINT `fk_historial_ruta_ruta1` FOREIGN KEY (`ruta_idruta`) REFERENCES `ruta` (`idruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puntos_de_referencia`
--

DROP TABLE IF EXISTS `puntos_de_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos_de_referencia` (
  `idpuntos_referencia` int NOT NULL AUTO_INCREMENT,
  `nombre_punto` varchar(50) NOT NULL,
  `direccion_punto` varchar(50) NOT NULL,
  `georeferencia` varchar(60) NOT NULL,
  PRIMARY KEY (`idpuntos_referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta` (
  `idruta` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `fecha_ruta` datetime NOT NULL,
  `punto_salida` varchar(40) NOT NULL,
  `geosalida` point NOT NULL,
  `punto_llegada` varchar(40) NOT NULL,
  `geollegada` point NOT NULL,
  `tiempo_estimado` time NOT NULL,
  `estado` enum('1.activa','2. inactiva') NOT NULL,
  `medio_transporte` varchar(45) NOT NULL,
  `alertas_avisos_idalertas_avisos` int NOT NULL,
  `puntos_de_referencia_idpuntos_referencia` int NOT NULL,
  PRIMARY KEY (`idruta`),
  KEY `fk_ruta_usuario1_idx` (`idusuario`),
  KEY `fk_ruta_alertas_avisos1_idx` (`alertas_avisos_idalertas_avisos`),
  KEY `fk_ruta_puntos_de_referencia1_idx` (`puntos_de_referencia_idpuntos_referencia`),
  CONSTRAINT `fk_ruta_alertas_avisos1` FOREIGN KEY (`alertas_avisos_idalertas_avisos`) REFERENCES `alertas_avisos` (`idalertas_avisos`),
  CONSTRAINT `fk_ruta_puntos_de_referencia1` FOREIGN KEY (`puntos_de_referencia_idpuntos_referencia`) REFERENCES `puntos_de_referencia` (`idpuntos_referencia`),
  CONSTRAINT `fk_ruta_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ruta_activa`
--

DROP TABLE IF EXISTS `ruta_activa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta_activa` (
  `idruta_activa` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `idruta` int NOT NULL,
  `fecha_actual` timestamp NOT NULL,
  `distancia_aproximada` float NOT NULL,
  `posicion_actual` point NOT NULL,
  PRIMARY KEY (`idruta_activa`),
  KEY `fk_ruta_activa_ruta1_idx` (`idruta`),
  KEY `fk_ruta_activa_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_ruta_activa_ruta1` FOREIGN KEY (`idruta`) REFERENCES `ruta` (`idruta`),
  CONSTRAINT `fk_ruta_activa_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `foto_persona` blob,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) NOT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) NOT NULL,
  `direccion_usuario` varchar(50) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `contraseña_usuario` varchar(20) NOT NULL,
  `telefono_usuario` varchar(20) NOT NULL,
  `telefono_alternativo` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `informacion_adicional` text NOT NULL,
  `rh_usuario` varchar(10) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 17:01:55
