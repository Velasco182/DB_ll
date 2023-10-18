CREATE DATABASE  IF NOT EXISTS `confiapp_v2` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `confiapp_v2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: confiapp_v2
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
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medio_transporte`
--

DROP TABLE IF EXISTS `medio_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medio_transporte` (
  `idtipo_transporte` int NOT NULL AUTO_INCREMENT,
  `nombre_transporte` varchar(50) NOT NULL,
  `descripcion_transporte` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo_transporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paradas_usuario`
--

DROP TABLE IF EXISTS `paradas_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paradas_usuario` (
  `idpares_usuario` int NOT NULL AUTO_INCREMENT,
  `fecha_parada` timestamp NOT NULL,
  `ubicacion_parada` point NOT NULL,
  `nombre_parada` varchar(50) NOT NULL,
  `descripcion_parada` varchar(225) NOT NULL,
  `actividad_parada` varchar(100) NOT NULL,
  `duracion_parada` time NOT NULL,
  PRIMARY KEY (`idpares_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `idperfil` int NOT NULL AUTO_INCREMENT,
  `perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`idperfil`)
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
-- Table structure for table `puntosxruta`
--

DROP TABLE IF EXISTS `puntosxruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntosxruta` (
  `idpuntosxruta` int NOT NULL AUTO_INCREMENT,
  `idruta` int NOT NULL,
  `idpuntos_referencia` int NOT NULL,
  PRIMARY KEY (`idpuntosxruta`),
  KEY `fk_puntosxruta_ruta1_idx` (`idruta`),
  KEY `fk_puntosxruta_puntos_de_referencia1_idx` (`idpuntos_referencia`),
  CONSTRAINT `fk_puntosxruta_puntos_de_referencia1` FOREIGN KEY (`idpuntos_referencia`) REFERENCES `puntos_de_referencia` (`idpuntos_referencia`),
  CONSTRAINT `fk_puntosxruta_ruta1` FOREIGN KEY (`idruta`) REFERENCES `ruta` (`idruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ractivaxalertas`
--

DROP TABLE IF EXISTS `ractivaxalertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ractivaxalertas` (
  `idractivaxalertas` int NOT NULL AUTO_INCREMENT,
  `idalertas_avisos` int NOT NULL,
  `idruta_activa` int NOT NULL,
  PRIMARY KEY (`idractivaxalertas`),
  KEY `fk_ractivaxalertas_alertas_avisos1_idx` (`idalertas_avisos`),
  KEY `fk_ractivaxalertas_ruta_activa1_idx` (`idruta_activa`),
  CONSTRAINT `fk_ractivaxalertas_alertas_avisos1` FOREIGN KEY (`idalertas_avisos`) REFERENCES `alertas_avisos` (`idalertas_avisos`),
  CONSTRAINT `fk_ractivaxalertas_ruta_activa1` FOREIGN KEY (`idruta_activa`) REFERENCES `ruta_activa` (`idruta_activa`)
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
  PRIMARY KEY (`idruta`),
  KEY `fk_ruta_usuario1_idx` (`idusuario`),
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
  `idtipo_transporte` int NOT NULL,
  `fecha_actual` timestamp NOT NULL,
  `distancia_aproximada` float NOT NULL,
  `posicion_actual` point NOT NULL,
  PRIMARY KEY (`idruta_activa`),
  KEY `fk_ruta_activa_ruta1_idx` (`idruta`),
  KEY `fk_ruta_activa_medio_transporte1_idx` (`idtipo_transporte`),
  KEY `fk_ruta_activa_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_ruta_activa_medio_transporte1` FOREIGN KEY (`idtipo_transporte`) REFERENCES `medio_transporte` (`idtipo_transporte`),
  CONSTRAINT `fk_ruta_activa_ruta1` FOREIGN KEY (`idruta`) REFERENCES `ruta` (`idruta`),
  CONSTRAINT `fk_ruta_activa_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rutaactivaxparadas`
--

DROP TABLE IF EXISTS `rutaactivaxparadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutaactivaxparadas` (
  `idrutaactivaxparadas` int NOT NULL AUTO_INCREMENT,
  `idruta_activa` int NOT NULL,
  `idpares_usuario` int NOT NULL,
  PRIMARY KEY (`idrutaactivaxparadas`),
  KEY `fk_rutaactivaxparadas_ruta_activa1_idx` (`idruta_activa`),
  KEY `fk_rutaactivaxparadas_paradas_usuario1_idx` (`idpares_usuario`),
  CONSTRAINT `fk_rutaactivaxparadas_paradas_usuario1` FOREIGN KEY (`idpares_usuario`) REFERENCES `paradas_usuario` (`idpares_usuario`),
  CONSTRAINT `fk_rutaactivaxparadas_ruta_activa1` FOREIGN KEY (`idruta_activa`) REFERENCES `ruta_activa` (`idruta_activa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_de_documento`
--

DROP TABLE IF EXISTS `tipo_de_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_documento` (
  `idtipo_de_documento` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(20) NOT NULL,
  `descripcion_documento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipo_de_documento`)
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
  `idperfil` int NOT NULL,
  `idtipo_de_documento` int NOT NULL,
  `genero_idgenero` int NOT NULL,
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
  `informacion_adicional` text,
  `rh_usuario` varchar(10) DEFAULT NULL,
  `numero_documento` varchar(20) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_tipo_de_documento1_idx` (`idtipo_de_documento`),
  KEY `fk_usuario_perfil1_idx` (`idperfil`),
  KEY `fk_usuario_genero1_idx` (`genero_idgenero`),
  CONSTRAINT `fk_usuario_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`),
  CONSTRAINT `fk_usuario_tipo_de_documento1` FOREIGN KEY (`idtipo_de_documento`) REFERENCES `tipo_de_documento` (`idtipo_de_documento`)
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

-- Dump completed on 2023-10-18 15:00:01
