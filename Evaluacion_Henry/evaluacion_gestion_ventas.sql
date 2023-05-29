-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_ventas
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido1` varchar(100) DEFAULT NULL,
  `apellido2` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `categoria` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Aaron','Rivero','Gomez','Granada',100),(2,'Adela','Salas','Diaz','Granada',200),(3,'Adolfo','Rubio','Flores','Sevilla',NULL),(4,'Adrian','Suarez',NULL,'Jaen',300),(5,'Marcos','Loyola','Mendez','Almeria',200),(6,'Maria','Santana','Moreno','Cadiz',100),(7,'Pilar','Ruiz',NULL,'Sevilla',300),(8,'pepe','Ruiz','Santana','Huelva',200),(9,'Guillermo','Lopez','Gomez','Granada',225),(10,'Daniel','Santana','Loyola','Sevilla',125);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercial`
--

DROP TABLE IF EXISTS `comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercial` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido1` varchar(100) DEFAULT NULL,
  `apellido2` varchar(100) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercial`
--

LOCK TABLES `comercial` WRITE;
/*!40000 ALTER TABLE `comercial` DISABLE KEYS */;
INSERT INTO `comercial` VALUES (1,'Daniel','Saez','Vega',0.15),(2,'Juan','Gomez','Lopez',0.13),(3,'Diego','Flores','Salas',0.11),(4,'Marta','Herrera','Gil',0.14),(5,'Antonio','Carretero','Ortega',0.12),(6,'Manuel','Dominguez','Hernandez',0.13),(7,'Antonio','Vega','Hernandez',0.11),(8,'Alfredo','Ruiz','Flores',0.05);
/*!40000 ALTER TABLE `comercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL,
  `cantidad` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `id_comercial` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`) /*!80000 INVISIBLE */,
  KEY `id_comercial` (`id_comercial`) /*!80000 INVISIBLE */,
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `id_comercial` FOREIGN KEY (`id_comercial`) REFERENCES `comercial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,150.5,'2017-10-05',5,2),(2,270.65,'2016-09-10',2,5),(3,65.26,'2017-10-05',1,1),(4,110.5,'2016-08-17',8,3),(5,948.5,'2017-09-10',5,2),(6,2400.6,'2016-07-27',7,1),(7,5760,'2015-09-10',2,1),(8,1983.43,'2017-10-10',4,3),(9,2480.4,'2016-10-10',8,6),(10,250.45,'2015-06-27',8,2),(11,75.29,'2016-08-17',3,7),(12,3045.6,'2017-04-25',2,1),(13,545.75,'2019-01-25',6,1),(14,145.82,'2017-02-02',6,1),(15,370.85,'2019-03-11',1,5),(16,2389.23,'2019-03-11',1,5);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-28 22:25:53
