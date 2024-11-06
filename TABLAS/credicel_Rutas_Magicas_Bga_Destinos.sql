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
INSERT INTO `Destinos` VALUES (1,'Catedral de la Sagrada Familia',NULL,4),(2,'Museo Casa de Bolívar','https://academiadehistoriadesantander.org/',2),(3,'Panachi','https://parquesdesantander.com/',3),(4,'Canon del Chicamocha','https://www.destinochicamocha.com/',1),(5,'Santuario de la Virgen de Guadalupe',NULL,4),(6,'Parque de los Niños',NULL,3),(7,'Parque García Rovira',NULL,3),(8,'Museo de Arte Moderno de Bucaramanga',NULL,2),(9,'Zoológico de Bucaramanga',NULL,3),(10,'Cueva de los Aviones',NULL,1),(11,'Mirador de la Mesa de los Santos',NULL,1),(12,'Parque Ecoturístico Cerro del Santísimo',NULL,3),(13,'Parque Natural El Mónaco',NULL,1),(14,'Iglesia de San Pío',NULL,4),(15,'Puente del Cabrera',NULL,2),(16,'La Casa del Libro Total',NULL,2),(17,'Parque de la Flora',NULL,1),(18,'La Cueva del Indio',NULL,1);
/*!40000 ALTER TABLE `Destinos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 12:08:00
