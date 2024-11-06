-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 190.90.160.172    Database: credicel_Rutas_Magicas_Bga
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.19-MariaDB-cll-lve

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
-- Table structure for table `CategoriasDestinos`
--

DROP TABLE IF EXISTS `CategoriasDestinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoriasDestinos` (
  `id_categoria` tinyint(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Clasificacion de cada tipo de destino ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriasDestinos`
--

LOCK TABLES `CategoriasDestinos` WRITE;
/*!40000 ALTER TABLE `CategoriasDestinos` DISABLE KEYS */;
INSERT INTO `CategoriasDestinos` VALUES (2,'Culturales'),(5,'Gastronómicos'),(1,'Naturales'),(3,'Recreativos'),(4,'Religiosos');
/*!40000 ALTER TABLE `CategoriasDestinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CorreosElectronicos`
--

DROP TABLE IF EXISTS `CorreosElectronicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CorreosElectronicos` (
  `id_correo_electronico` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  PRIMARY KEY (`id_correo_electronico`),
  UNIQUE KEY `correo_electronico_UNIQUE` (`correo_electronico`),
  KEY `FK_correo_destino_idx` (`id_destino`),
  CONSTRAINT `FK_correo_destino` FOREIGN KEY (`id_destino`) REFERENCES `Destinos` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CorreosElectronicos`
--

LOCK TABLES `CorreosElectronicos` WRITE;
/*!40000 ALTER TABLE `CorreosElectronicos` DISABLE KEYS */;
INSERT INTO `CorreosElectronicos` VALUES (1,3,'mercadeo@parquenacionaldelchicamocha.com'),(2,2,'quintabolivar@mincultura.gov.co'),(3,1,'pquiasagradafamilia@arquibucaramanga.com');
/*!40000 ALTER TABLE `CorreosElectronicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destinos`
--

DROP TABLE IF EXISTS `Destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destinos` (
  `id_destino` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `sitio_web` varchar(400) DEFAULT NULL,
  `id_categoria` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_destino`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `sitio_web_UNIQUE` (`sitio_web`),
  KEY `FK_Categorias_destinos_idx` (`id_categoria`),
  CONSTRAINT `FK_Categorias_destinos` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriasDestinos` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Listado de nombres de destinos turisticos en Bga';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destinos`
--

LOCK TABLES `Destinos` WRITE;
/*!40000 ALTER TABLE `Destinos` DISABLE KEYS */;
INSERT INTO `Destinos` VALUES (1,'Catedral de la Sagrada Familia',NULL,4),(2,'Museo Casa de Bolívar','https://academiadehistoriadesantander.org/',2),(3,'Panachi','https://parquesdesantander.com/',3);
/*!40000 ALTER TABLE `Destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direcciones`
--

DROP TABLE IF EXISTS `Direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Direcciones` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_destino` int(11) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `barrio` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `codigo_postal` int(6) DEFAULT NULL,
  `latitud` decimal(6,5) NOT NULL,
  `longitud` decimal(7,5) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `FK_ubicacion_idx` (`id_destino`),
  CONSTRAINT `FK_ubicacion` FOREIGN KEY (`id_destino`) REFERENCES `Destinos` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Ubicacion de los destinos turisticos en Bga';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direcciones`
--

LOCK TABLES `Direcciones` WRITE;
/*!40000 ALTER TABLE `Direcciones` DISABLE KEYS */;
INSERT INTO `Direcciones` VALUES (1,1,'Calle 36 # 19-56','Bolivar','Bucaramanga','Santander',680006,7.11924,-73.12517),(2,2,'Cl. 37 #12-15','García Rovira','Bucaramanga','Santander',NULL,7.11684,-73.13114),(3,3,'Aratoca, Km. 54 Via Bucaramanga - San Gil',NULL,'Bucaramanga','Santander',NULL,6.79181,-73.00549);
/*!40000 ALTER TABLE `Direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedesSociales`
--

DROP TABLE IF EXISTS `RedesSociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RedesSociales` (
  `id_red_social` int(10) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `link` varchar(500) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_red_social`),
  KEY `FK_destino_redes_sociales_idx` (`id_destino`),
  CONSTRAINT `FK_destino_redes_sociales` FOREIGN KEY (`id_destino`) REFERENCES `Destinos` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Redes sociales de contactos de los sitios turisticos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RedesSociales`
--

LOCK TABLES `RedesSociales` WRITE;
/*!40000 ALTER TABLE `RedesSociales` DISABLE KEYS */;
INSERT INTO `RedesSociales` VALUES (1,1,'https://www.instagram.com/catedralsagradafamiliabga/','Instagram'),(2,2,'https://www.instagram.com/museocasa_bolivar/','Instagram'),(3,2,'https://www.facebook.com/museocasadebolivarbga/','Facebook'),(4,3,'https://www.facebook.com/Parque.Nacional.Chicamocha/','Facebook'),(5,3,'https://www.instagram.com/parquenacionaldelchicamocha','Instagram');
/*!40000 ALTER TABLE `RedesSociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefonos`
--

DROP TABLE IF EXISTS `Telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telefonos` (
  `id_telefono` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `telefono` bigint(10) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  KEY `FK_contacto_telefono_idx` (`id_destino`),
  CONSTRAINT `FK_contacto_telefono` FOREIGN KEY (`id_destino`) REFERENCES `Destinos` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='telefonos de contactos para los destinos turiticos en BGA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefonos`
--

LOCK TABLES `Telefonos` WRITE;
/*!40000 ALTER TABLE `Telefonos` DISABLE KEYS */;
INSERT INTO `Telefonos` VALUES (1,1,6076427708,'Fijo'),(2,2,6076511716,'Fijo'),(3,3,3212050097,'Movil'),(4,3,6076394444,'Fijo');
/*!40000 ALTER TABLE `Telefonos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 19:10:28
