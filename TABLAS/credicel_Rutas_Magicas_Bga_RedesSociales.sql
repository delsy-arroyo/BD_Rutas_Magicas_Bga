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
-- Table structure for table `RedesSociales`
--

DROP TABLE IF EXISTS `RedesSociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RedesSociales` (
  `id_red_social` int(10) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `link` varchar(500) NOT NULL,
  `id_nombre_red_social` int(11) NOT NULL,
  PRIMARY KEY (`id_red_social`),
  KEY `FK_destino_redes_sociales_idx` (`id_destino`),
  KEY `FK_nombre_red_social_idx` (`id_nombre_red_social`),
  CONSTRAINT `FK_destino_redes_sociales` FOREIGN KEY (`id_destino`) REFERENCES `Destinos` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nombre_red_social` FOREIGN KEY (`id_nombre_red_social`) REFERENCES `NombresRedesSociales` (`id_nombre_red_social`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Redes sociales de contactos de los sitios turisticos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RedesSociales`
--

LOCK TABLES `RedesSociales` WRITE;
/*!40000 ALTER TABLE `RedesSociales` DISABLE KEYS */;
INSERT INTO `RedesSociales` VALUES (1,1,'https://www.instagram.com/catedralsagradafamiliabga/',2),(2,2,'https://www.instagram.com/museocasa_bolivar/',2),(3,2,'https://www.facebook.com/museocasadebolivarbga/',1),(4,3,'https://www.facebook.com/Parque.Nacional.Chicamocha/',1),(5,3,'https://www.instagram.com/parquenacionaldelchicamocha',2);
/*!40000 ALTER TABLE `RedesSociales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 12:08:50
