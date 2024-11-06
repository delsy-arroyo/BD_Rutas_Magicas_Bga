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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 12:07:36
