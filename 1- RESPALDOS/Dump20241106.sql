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
  `id_categoria` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Clasificacion de cada tipo de destino ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriasDestinos`
--

LOCK TABLES `CategoriasDestinos` WRITE;
/*!40000 ALTER TABLE `CategoriasDestinos` DISABLE KEYS */;
INSERT INTO `CategoriasDestinos` VALUES (16,'Balneario'),(7,'Cañón'),(8,'Cascada'),(14,'Catedral'),(13,'Centro Histórico'),(17,'Cueva'),(2,'Culturales'),(21,'Embalse'),(5,'Gastronómicos'),(22,'Granja Ecoturística'),(24,'Jardín Botánico'),(11,'Mirador'),(12,'Museo'),(1,'Naturales'),(9,'Páramo'),(23,'Parque de Aventuras'),(6,'Parque Natural'),(15,'Pueblo Patrimonio'),(3,'Recreativos'),(4,'Religiosos'),(10,'Reserva Natural'),(20,'Río'),(25,'Zona de Camping'),(18,'Zona de Escalada'),(19,'Zona de Parapente');
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
INSERT INTO `CorreosElectronicos` VALUES (1,1,'contacto@catedralsagradafamiliabga.com'),(2,2,'info@museocasa.bolivar.com'),(3,2,'contacto@museocasa.bolivar.com'),(4,3,'informacion@parquenacionalchicamocha.com'),(5,3,'contacto@parquenacionalchicamocha.com'),(6,4,'informes@canondelchicamocha.com'),(7,4,'contacto@canondelchicamocha.com'),(8,5,'informes@santuariovirgendeguadalupe.com'),(9,6,'atencion@parquedelosninosbga.com'),(10,7,'contacto@parquegarciarovira.com'),(11,8,'informes@museoartemodernobga.com'),(12,9,'informes@zoologicobucaramanga.com'),(13,10,'informes@cuevadelosaviones.com'),(14,11,'contacto@miradormesadelossantos.com'),(15,12,'informacion@parqueecoturistico.com'),(16,13,'contacto@parquenaturalmónaco.com'),(17,14,'informes@iglesiadesanpio.com'),(18,15,'contacto@puentecabrera.com'),(19,16,'info@casadelibrototal.com'),(20,17,'contacto@parquedelaflora.com'),(21,18,'informes@lacuevadelindio.com'),(22,58,'informes@parquenacionalchicamocha.com'),(24,60,'informacion@juan-curi.com'),(25,61,'atencion@paramosanturban.com'),(26,62,'informes@reservanaturalchicamocha.com'),(27,63,'contacto@miradorbarichara.com'),(28,64,'informacion@centrohistorico.giron.com'),(29,65,'informes@barichara.com'),(30,66,'contacto@balneariopozoazul.com'),(31,67,'informes@cuevadelnitro.com'),(32,68,'contacto@penondelosmuertos.com'),(33,69,'informes@parapentecuriti.com'),(34,70,'contacto@riofonce.com'),(35,71,'informes@embalsetopocoro.com'),(36,72,'informes@granjaecoturisticaelparaiso.com'),(37,73,'informacion@aventuraslamedesantos.com'),(38,74,'contacto@jardinbotanicoeloyvalenzuela.com'),(39,75,'informes@campingvalledesanjose.com');
/*!40000 ALTER TABLE `CorreosElectronicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destinos`
--

DROP TABLE IF EXISTS `Destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destinos` (
  `id_destino` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `sitio_web` varchar(400) DEFAULT NULL,
  `id_categoria` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_destino`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `sitio_web_UNIQUE` (`sitio_web`),
  KEY `FK_Categorias_destinos_idx` (`id_categoria`),
  CONSTRAINT `FK_Categorias_destinos` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriasDestinos` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Listado de nombres de destinos turisticos en Bga';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destinos`
--

LOCK TABLES `Destinos` WRITE;
/*!40000 ALTER TABLE `Destinos` DISABLE KEYS */;
INSERT INTO `Destinos` VALUES (1,'Catedral de la Sagrada Familia',NULL,4),(2,'Museo Casa de Bolívar','https://academiadehistoriadesantander.org/',2),(3,'Panachi','https://parquesdesantander.com/',3),(4,'Canon del Chicamocha','https://www.destinochicamocha.com/',1),(5,'Santuario de la Virgen de Guadalupe',NULL,4),(6,'Parque de los Niños',NULL,3),(7,'Parque García Rovira',NULL,3),(8,'Museo de Arte Moderno de Bucaramanga',NULL,2),(9,'Zoológico de Bucaramanga',NULL,3),(10,'Cueva de los Aviones',NULL,1),(11,'Mirador de la Mesa de los Santos',NULL,1),(12,'Parque Ecoturístico Cerro del Santísimo',NULL,3),(13,'Parque Natural El Mónaco',NULL,1),(14,'Iglesia de San Pío',NULL,4),(15,'Puente del Cabrera',NULL,2),(16,'La Casa del Libro Total',NULL,2),(17,'Parque de la Flora',NULL,1),(18,'La Cueva del Indio',NULL,1),(58,'Parque Nacional del Chicamocha','https://www.parquenacionaldelchicamocha.com',1),(59,'Cañón del Chicamocha',NULL,2),(60,'Cascada de Juan Curí','https://juan-curi.com',3),(61,'Páramo de Santurbán',NULL,4),(62,'Reserva Natural Cañón del Chicamocha',NULL,5),(63,'Mirador Barichara',NULL,6),(64,'Centro Histórico de Girón',NULL,8),(65,'Barichara','https://barichara.com',10),(66,'Balneario Pozo Azul',NULL,11),(67,'Cueva del Nitro',NULL,12),(68,'Peñón de los Muertos - Zapatoca',NULL,13),(69,'Parapente en Curití','https://parapentecuriti.com',14),(70,'Río Fonce',NULL,15),(71,'Embalse Topocoro','https://embalse-topocoro.com',16),(72,'Granja Ecoturística El Paraíso','https://granjaecoturisticaelparaiso.com',17),(73,'Parque de Aventuras La Mesa de los Santos','https://aventuraslamedesantos.com',18),(74,'Jardín Botánico Eloy Valenzuela','https://jardinbotanicoeloyvalenzuela.com',19),(75,'Camping Valle de San José',NULL,20);
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
  `latitud` decimal(9,6) NOT NULL,
  `longitud` decimal(10,6) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `FK_ubicacion_idx` (`id_destino`),
  CONSTRAINT `FK_ubicacion` FOREIGN KEY (`id_destino`) REFERENCES `Destinos` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Ubicacion de los destinos turisticos en Bga';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direcciones`
--

LOCK TABLES `Direcciones` WRITE;
/*!40000 ALTER TABLE `Direcciones` DISABLE KEYS */;
INSERT INTO `Direcciones` VALUES (1,1,'Calle 36 # 19-56','Bolivar','Bucaramanga','Santander',680006,7.119240,-73.125170),(2,2,'Cl. 37 #12-15','García Rovira','Bucaramanga','Santander',NULL,7.116840,-73.131140),(3,3,'Aratoca, Km. 54 Via Bucaramanga - San Gil',NULL,'Bucaramanga','Santander',NULL,6.791810,-73.005490),(4,1,'Carrera 24 # 47-20','Centro','Bucaramanga','Santander',680001,7.440020,-73.810270),(5,2,'Calle 35 # 10-11','Centro','Bucaramanga','Santander',680001,7.119360,-73.121270),(6,3,'Km 22, vía San Gil - Barichara','Panachi','San Gil','Santander',684031,6.546030,-73.090650),(7,4,'Vereda La Mesa, Parque Natural Chicamocha','Mesa de los Santos','Santander','Santander',680030,6.630420,-73.077230),(8,5,'Carrera 24 # 50-90','La Concordia','Bucaramanga','Santander',680002,7.439610,-73.815840),(9,6,'Carrera 9 # 34-10','La Flora','Bucaramanga','Santander',680002,7.119200,-73.118900),(10,7,'Carrera 14 # 23-44','Búcaro','Bucaramanga','Santander',680004,7.135400,-73.124800),(11,8,'Calle 36 # 13-19','Centro','Bucaramanga','Santander',680001,7.119900,-73.118570),(12,9,'Carrera 14 # 10-35','Bucaramanga','Bucaramanga','Santander',680002,7.137180,-73.119020),(13,10,'Calle 10 # 20-17','Centro','Bucaramanga','Santander',680001,7.431230,-73.826760),(14,11,'Carrera 10 # 13-23','Mesa de los Santos','Bucaramanga','Santander',680020,6.645730,-73.146460),(15,12,'Vereda El Santísimo','La Mesa','Girón','Santander',681007,6.636550,-73.144600),(16,13,'Vereda La Mesa','La Mesa','Bucaramanga','Santander',680030,6.617280,-73.082450),(17,14,'Carrera 20 # 24-17','San Pío','Bucaramanga','Santander',680004,7.145260,-73.121750),(18,15,'Carrera 8 # 11-33','Cabrera','Bucaramanga','Santander',680003,7.150730,-73.116570),(19,16,'Carrera 15 # 8-12','Centro','Bucaramanga','Santander',680001,7.119110,-73.118250),(20,17,'Calle 42 # 18-17','La Concordia','Bucaramanga','Santander',680002,7.127370,-73.116730),(21,18,'Vereda El Indio','Mesa de los Santos','Bucaramanga','Santander',680030,6.626760,-73.126240),(22,58,'Carrera 9 # 12-56','Chicamocha','Bucaramanga','Santander',680008,6.593080,-73.087570),(23,59,'Calle 2 # 15-22','Chicamocha','Bucaramanga','Santander',680009,6.586830,-73.090800),(24,60,'Carrera 10 # 10-22','Juan Curí','San Gil','Santander',684001,6.589060,-73.118290),(25,61,'Vereda El Páramo','Páramo','Vélez','Santander',684005,6.787120,-73.291150),(26,62,'Vereda Cañón del Chicamocha','Chicamocha','Bucaramanga','Santander',680009,6.568770,-73.089680),(27,63,'Carrera 9 # 20-45','Barichara','Barichara','Santander',684008,6.633190,-73.137840),(28,64,'Calle 7 # 10-16','Centro Histórico','Girón','Santander',681001,6.879610,-73.147320),(29,65,'Carrera 8 # 13-10','Barichara','Barichara','Santander',684008,6.633840,-73.137910),(30,66,'Calle 10 # 12-24','La Mesa','Zapatoca','Santander',683551,6.410840,-73.360440),(31,67,'Carrera 14 # 16-19','La Mesa','Zapatoca','Santander',683551,6.450620,-73.349220),(32,68,'Carrera 10 # 14-10','Zapatoca','Zapatoca','Santander',683550,6.480780,-73.332210),(33,69,'Carrera 12 # 15-10','Curití','Curití','Santander',684020,6.374960,-73.073990),(34,70,'Calle 15 # 19-25','Fonce','San Gil','Santander',684041,6.548090,-73.128310),(35,71,'Carrera 6 # 12-18','Topocoro','Zapatoca','Santander',683550,6.429360,-73.327840),(36,72,'Vereda El Paraíso','El Paraíso','Bucaramanga','Santander',680006,6.491230,-73.278280),(37,73,'Vereda La Mesa','Mesa de los Santos','Bucaramanga','Santander',680020,6.628970,-73.083590),(38,74,'Carrera 9 # 10-15','Centro','Bucaramanga','Santander',680001,7.128970,-73.117770),(39,75,'Carrera 8 # 12-10','Valle de San José','Valle de San José','Santander',684030,6.448830,-73.144280),(40,1,'Carrera 24 # 47-20','Centro','Bucaramanga','Santander',680001,7.440022,-73.810272),(41,2,'Calle 35 # 10-11','Centro','Bucaramanga','Santander',680001,7.119363,-73.121271),(42,3,'Km 22, vía San Gil - Barichara','Panachi','San Gil','Santander',684031,6.546033,-73.090651),(43,4,'Vereda La Mesa, Parque Natural Chicamocha','Mesa de los Santos','Santander','Santander',680030,6.630421,-73.077229),(44,5,'Carrera 24 # 50-90','La Concordia','Bucaramanga','Santander',680002,7.439611,-73.815835),(45,6,'Carrera 9 # 34-10','La Flora','Bucaramanga','Santander',680002,7.119198,-73.118897),(46,7,'Carrera 14 # 23-44','Búcaro','Bucaramanga','Santander',680004,7.135396,-73.124803),(47,8,'Calle 36 # 13-19','Centro','Bucaramanga','Santander',680001,7.119901,-73.118569),(48,9,'Carrera 14 # 10-35','Bucaramanga','Bucaramanga','Santander',680002,7.137175,-73.119021),(49,10,'Calle 10 # 20-17','Centro','Bucaramanga','Santander',680001,7.431233,-73.826760),(50,11,'Carrera 10 # 13-23','Mesa de los Santos','Bucaramanga','Santander',680020,6.645731,-73.146463),(51,12,'Vereda El Santísimo','La Mesa','Girón','Santander',681007,6.636554,-73.144597),(52,13,'Vereda La Mesa','La Mesa','Bucaramanga','Santander',680030,6.617280,-73.082450),(53,14,'Carrera 20 # 24-17','San Pío','Bucaramanga','Santander',680004,7.145258,-73.121746),(54,15,'Carrera 8 # 11-33','Cabrera','Bucaramanga','Santander',680003,7.150729,-73.116573),(55,16,'Carrera 15 # 8-12','Centro','Bucaramanga','Santander',680001,7.119105,-73.118245),(56,17,'Calle 42 # 18-17','La Concordia','Bucaramanga','Santander',680002,7.127365,-73.116728),(57,18,'Vereda El Indio','Mesa de los Santos','Bucaramanga','Santander',680030,6.626759,-73.126235),(58,58,'Carrera 9 # 12-56','Chicamocha','Bucaramanga','Santander',680008,6.593080,-73.087570),(59,59,'Calle 2 # 15-22','Chicamocha','Bucaramanga','Santander',680009,6.586832,-73.090804),(60,60,'Carrera 10 # 10-22','Juan Curí','San Gil','Santander',684001,6.589062,-73.118294),(61,61,'Vereda El Páramo','Páramo','Vélez','Santander',684005,6.787121,-73.291154),(62,62,'Vereda Cañón del Chicamocha','Chicamocha','Bucaramanga','Santander',680009,6.568772,-73.089681),(63,63,'Carrera 9 # 20-45','Barichara','Barichara','Santander',684008,6.633189,-73.137843),(64,64,'Calle 7 # 10-16','Centro Histórico','Girón','Santander',681001,6.879610,-73.147322),(65,65,'Carrera 8 # 13-10','Barichara','Barichara','Santander',684008,6.633835,-73.137906),(66,66,'Calle 10 # 12-24','La Mesa','Zapatoca','Santander',683551,6.410835,-73.360440),(67,67,'Carrera 14 # 16-19','La Mesa','Zapatoca','Santander',683551,6.450623,-73.349223),(68,68,'Carrera 10 # 14-10','Zapatoca','Zapatoca','Santander',683550,6.480776,-73.332211),(69,69,'Carrera 12 # 15-10','Curití','Curití','Santander',684020,6.374956,-73.073989),(70,70,'Calle 15 # 19-25','Fonce','San Gil','Santander',684041,6.548091,-73.128312),(71,71,'Carrera 6 # 12-18','Topocoro','Zapatoca','Santander',683550,6.429356,-73.327844),(72,72,'Vereda El Paraíso','El Paraíso','Bucaramanga','Santander',680006,6.491227,-73.278283),(73,73,'Vereda La Mesa','Mesa de los Santos','Bucaramanga','Santander',680020,6.628974,-73.083593),(74,74,'Carrera 9 # 10-15','Centro','Bucaramanga','Santander',680001,7.128971,-73.117765),(75,75,'Carrera 8 # 12-10','Valle de San José','Valle de San José','Santander',684030,6.448832,-73.144278),(76,1,'Carrera 24 # 47-20','Centro','Bucaramanga','Santander',680001,7.440022,-73.810272),(77,2,'Calle 35 # 10-11','Centro','Bucaramanga','Santander',680001,7.119363,-73.121271),(78,3,'Km 22, vía San Gil - Barichara','Panachi','San Gil','Santander',684031,6.546033,-73.090651),(79,4,'Vereda La Mesa, Parque Natural Chicamocha','Mesa de los Santos','Santander','Santander',680030,6.630421,-73.077229),(80,5,'Carrera 24 # 50-90','La Concordia','Bucaramanga','Santander',680002,7.439611,-73.815835),(81,6,'Carrera 9 # 34-10','La Flora','Bucaramanga','Santander',680002,7.119198,-73.118897),(82,7,'Carrera 14 # 23-44','Búcaro','Bucaramanga','Santander',680004,7.135396,-73.124803),(83,8,'Calle 36 # 13-19','Centro','Bucaramanga','Santander',680001,7.119901,-73.118569),(84,9,'Carrera 14 # 10-35','Bucaramanga','Bucaramanga','Santander',680002,7.137175,-73.119021),(85,10,'Calle 10 # 20-17','Centro','Bucaramanga','Santander',680001,7.431233,-73.826760),(86,11,'Carrera 10 # 13-23','Mesa de los Santos','Bucaramanga','Santander',680020,6.645731,-73.146463),(87,12,'Vereda El Santísimo','La Mesa','Girón','Santander',681007,6.636554,-73.144597),(88,13,'Vereda La Mesa','La Mesa','Bucaramanga','Santander',680030,6.617280,-73.082450),(89,14,'Carrera 20 # 24-17','San Pío','Bucaramanga','Santander',680004,7.145258,-73.121746),(90,15,'Carrera 8 # 11-33','Cabrera','Bucaramanga','Santander',680003,7.150729,-73.116573),(91,16,'Carrera 15 # 8-12','Centro','Bucaramanga','Santander',680001,7.119105,-73.118245),(92,17,'Calle 42 # 18-17','La Concordia','Bucaramanga','Santander',680002,7.127365,-73.116728),(93,18,'Vereda El Indio','Mesa de los Santos','Bucaramanga','Santander',680030,6.626759,-73.126235),(94,58,'Carrera 9 # 12-56','Chicamocha','Bucaramanga','Santander',680008,6.593080,-73.087570),(95,59,'Calle 2 # 15-22','Chicamocha','Bucaramanga','Santander',680009,6.586832,-73.090804),(96,60,'Carrera 10 # 10-22','Juan Curí','San Gil','Santander',684001,6.589062,-73.118294),(97,61,'Vereda El Páramo','Páramo','Vélez','Santander',684005,6.787121,-73.291154),(98,62,'Vereda Cañón del Chicamocha','Chicamocha','Bucaramanga','Santander',680009,6.568772,-73.089681),(99,63,'Carrera 9 # 20-45','Barichara','Barichara','Santander',684008,6.633189,-73.137843),(100,64,'Calle 7 # 10-16','Centro Histórico','Girón','Santander',681001,6.879610,-73.147322),(101,65,'Carrera 8 # 13-10','Barichara','Barichara','Santander',684008,6.633835,-73.137906),(102,66,'Calle 10 # 12-24','La Mesa','Zapatoca','Santander',683551,6.410835,-73.360440),(103,67,'Carrera 14 # 16-19','La Mesa','Zapatoca','Santander',683551,6.450623,-73.349223),(104,68,'Carrera 10 # 14-10','Zapatoca','Zapatoca','Santander',683550,6.480776,-73.332211),(105,69,'Carrera 12 # 15-10','Curití','Curití','Santander',684020,6.374956,-73.073989),(106,70,'Calle 15 # 19-25','Fonce','San Gil','Santander',684041,6.548091,-73.128312),(107,71,'Carrera 6 # 12-18','Topocoro','Zapatoca','Santander',683550,6.429356,-73.327844),(108,72,'Vereda El Paraíso','El Paraíso','Bucaramanga','Santander',680006,6.491227,-73.278283),(109,73,'Vereda La Mesa','Mesa de los Santos','Bucaramanga','Santander',680020,6.628974,-73.083593),(110,74,'Carrera 9 # 10-15','Centro','Bucaramanga','Santander',680001,7.128971,-73.117765),(111,75,'Carrera 8 # 12-10','Valle de San José','Valle de San José','Santander',684030,6.448832,-73.144278),(112,1,'Carrera 24 # 47-20','Centro','Bucaramanga','Santander',680001,7.440022,-73.810272),(113,2,'Calle 35 # 10-11','Centro','Bucaramanga','Santander',680001,7.119363,-73.121271),(114,3,'Km 22, vía San Gil - Barichara','Panachi','San Gil','Santander',684031,6.546033,-73.090651),(115,4,'Vereda La Mesa, Parque Natural Chicamocha','Mesa de los Santos','Santander','Santander',680030,6.630421,-73.077229),(116,5,'Carrera 24 # 50-90','La Concordia','Bucaramanga','Santander',680002,7.439611,-73.815835),(117,6,'Carrera 9 # 34-10','La Flora','Bucaramanga','Santander',680002,7.119198,-73.118897),(118,7,'Carrera 14 # 23-44','Búcaro','Bucaramanga','Santander',680004,7.135396,-73.124803),(119,8,'Calle 36 # 13-19','Centro','Bucaramanga','Santander',680001,7.119901,-73.118569),(120,9,'Carrera 14 # 10-35','Bucaramanga','Bucaramanga','Santander',680002,7.137175,-73.119021),(121,10,'Calle 10 # 20-17','Centro','Bucaramanga','Santander',680001,7.431233,-73.826760),(122,11,'Carrera 10 # 13-23','Mesa de los Santos','Bucaramanga','Santander',680020,6.645731,-73.146463),(123,12,'Vereda El Santísimo','La Mesa','Girón','Santander',681007,6.636554,-73.144597),(124,13,'Vereda La Mesa','La Mesa','Bucaramanga','Santander',680030,6.617280,-73.082450),(125,14,'Carrera 20 # 24-17','San Pío','Bucaramanga','Santander',680004,7.145258,-73.121746),(126,15,'Carrera 8 # 11-33','Cabrera','Bucaramanga','Santander',680003,7.150729,-73.116573),(127,16,'Carrera 15 # 8-12','Centro','Bucaramanga','Santander',680001,7.119105,-73.118245),(128,17,'Calle 42 # 18-17','La Concordia','Bucaramanga','Santander',680002,7.127365,-73.116728),(129,18,'Vereda El Indio','Mesa de los Santos','Bucaramanga','Santander',680030,6.626759,-73.126235),(130,58,'Carrera 9 # 12-56','Chicamocha','Bucaramanga','Santander',680008,6.593080,-73.087570),(131,59,'Calle 2 # 15-22','Chicamocha','Bucaramanga','Santander',680009,6.586832,-73.090804),(132,60,'Carrera 10 # 10-22','Juan Curí','San Gil','Santander',684001,6.589062,-73.118294),(133,61,'Vereda El Páramo','Páramo','Vélez','Santander',684005,6.787121,-73.291154),(134,62,'Vereda Cañón del Chicamocha','Chicamocha','Bucaramanga','Santander',680009,6.568772,-73.089681),(135,63,'Carrera 9 # 20-45','Barichara','Barichara','Santander',684008,6.633189,-73.137843),(136,64,'Calle 7 # 10-16','Centro Histórico','Girón','Santander',681001,6.879610,-73.147322),(137,65,'Carrera 8 # 13-10','Barichara','Barichara','Santander',684008,6.633835,-73.137906),(138,66,'Calle 10 # 12-24','La Mesa','Zapatoca','Santander',683551,6.410835,-73.360440),(139,67,'Carrera 14 # 16-19','La Mesa','Zapatoca','Santander',683551,6.450623,-73.349223),(140,68,'Carrera 10 # 14-10','Zapatoca','Zapatoca','Santander',683550,6.480776,-73.332211),(141,69,'Carrera 12 # 15-10','Curití','Curití','Santander',684020,6.374956,-73.073989),(142,70,'Calle 15 # 19-25','Fonce','San Gil','Santander',684041,6.548091,-73.128312),(143,71,'Carrera 6 # 12-18','Topocoro','Zapatoca','Santander',683550,6.429356,-73.327844),(144,72,'Vereda El Paraíso','El Paraíso','Bucaramanga','Santander',680006,6.491227,-73.278283),(145,73,'Vereda La Mesa','Mesa de los Santos','Bucaramanga','Santander',680020,6.628974,-73.083593),(146,74,'Carrera 9 # 10-15','Centro','Bucaramanga','Santander',680001,7.128971,-73.117765),(147,75,'Carrera 8 # 12-10','Valle de San José','Valle de San José','Santander',684030,6.448832,-73.144278),(148,1,'Carrera 24 # 47-20','Centro','Bucaramanga','Santander',680001,7.440022,-73.810272),(149,2,'Calle 35 # 10-11','Centro','Bucaramanga','Santander',680001,7.119363,-73.121271),(150,3,'Km 22, vía San Gil - Barichara','Panachi','San Gil','Santander',684031,6.546033,-73.090651),(151,4,'Vereda La Mesa, Parque Natural Chicamocha','Mesa de los Santos','Santander','Santander',680030,6.630421,-73.077229),(152,5,'Carrera 24 # 50-90','La Concordia','Bucaramanga','Santander',680002,7.439611,-73.815835),(153,6,'Carrera 9 # 34-10','La Flora','Bucaramanga','Santander',680002,7.119198,-73.118897),(154,7,'Carrera 14 # 23-44','Búcaro','Bucaramanga','Santander',680004,7.135396,-73.124803),(155,8,'Calle 36 # 13-19','Centro','Bucaramanga','Santander',680001,7.119901,-73.118569),(156,9,'Carrera 14 # 10-35','Bucaramanga','Bucaramanga','Santander',680002,7.137175,-73.119021),(157,10,'Calle 10 # 20-17','Centro','Bucaramanga','Santander',680001,7.431233,-73.826760),(158,11,'Carrera 10 # 13-23','Mesa de los Santos','Bucaramanga','Santander',680020,6.645731,-73.146463),(159,12,'Vereda El Santísimo','La Mesa','Girón','Santander',681007,6.636554,-73.144597),(160,13,'Vereda La Mesa','La Mesa','Bucaramanga','Santander',680030,6.617280,-73.082450),(161,14,'Carrera 20 # 24-17','San Pío','Bucaramanga','Santander',680004,7.145258,-73.121746),(162,15,'Carrera 8 # 11-33','Cabrera','Bucaramanga','Santander',680003,7.150729,-73.116573),(163,16,'Carrera 15 # 8-12','Centro','Bucaramanga','Santander',680001,7.119105,-73.118245),(164,17,'Calle 42 # 18-17','La Concordia','Bucaramanga','Santander',680002,7.127365,-73.116728),(165,18,'Vereda El Indio','Mesa de los Santos','Bucaramanga','Santander',680030,6.626759,-73.126235),(166,58,'Carrera 9 # 12-56','Chicamocha','Bucaramanga','Santander',680008,6.593080,-73.087570),(167,59,'Calle 2 # 15-22','Chicamocha','Bucaramanga','Santander',680009,6.586832,-73.090804),(168,60,'Carrera 10 # 10-22','Juan Curí','San Gil','Santander',684001,6.589062,-73.118294),(169,61,'Vereda El Páramo','Páramo','Vélez','Santander',684005,6.787121,-73.291154),(170,62,'Vereda Cañón del Chicamocha','Chicamocha','Bucaramanga','Santander',680009,6.568772,-73.089681),(171,63,'Carrera 9 # 20-45','Barichara','Barichara','Santander',684008,6.633189,-73.137843),(172,64,'Calle 7 # 10-16','Centro Histórico','Girón','Santander',681001,6.879610,-73.147322),(173,65,'Carrera 8 # 13-10','Barichara','Barichara','Santander',684008,6.633835,-73.137906),(174,66,'Calle 10 # 12-24','La Mesa','Zapatoca','Santander',683551,6.410835,-73.360440),(175,67,'Carrera 14 # 16-19','La Mesa','Zapatoca','Santander',683551,6.450623,-73.349223),(176,68,'Carrera 10 # 14-10','Zapatoca','Zapatoca','Santander',683550,6.480776,-73.332211),(177,69,'Carrera 12 # 15-10','Curití','Curití','Santander',684010,6.589042,-73.112234),(178,70,'Carrera 9 # 15-20','Río Fonce','Bucaramanga','Santander',680004,7.215081,-73.172319),(179,71,'Carrera 9 # 10-5','Embalse Topocoro','Girón','Santander',681003,6.451222,-73.085833),(180,72,'Vereda El Paraíso','La Mesa','Bucaramanga','Santander',680031,7.139933,-73.167530),(181,73,'Carrera 10 # 24-34','La Mesa de los Santos','Bucaramanga','Santander',680033,6.617732,-73.172382),(182,74,'Carrera 7 # 15-22','La Flora','Bucaramanga','Santander',680012,7.166098,-73.123056),(183,75,'Carrera 8 # 13-17','Camping Valle','San José','Santander',680031,6.314550,-73.169025);
/*!40000 ALTER TABLE `Direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NombresRedesSociales`
--

DROP TABLE IF EXISTS `NombresRedesSociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NombresRedesSociales` (
  `id_nombre_red_social` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_red_social` varchar(45) NOT NULL,
  PRIMARY KEY (`id_nombre_red_social`),
  UNIQUE KEY `nombre_red_social_UNIQUE` (`nombre_red_social`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='Tipos de redes sociales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NombresRedesSociales`
--

LOCK TABLES `NombresRedesSociales` WRITE;
/*!40000 ALTER TABLE `NombresRedesSociales` DISABLE KEYS */;
INSERT INTO `NombresRedesSociales` VALUES (1,'Facebook'),(2,'Instagram'),(3,'Linkedln'),(6,'TikTok'),(4,'X (twitter)'),(5,'YouTube');
/*!40000 ALTER TABLE `NombresRedesSociales` ENABLE KEYS */;
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
INSERT INTO `RedesSociales` VALUES (6,1,'https://www.instagram.com/catedralsagradafamiliabga/',2),(7,2,'https://www.instagram.com/museocasa_bolivar/',2),(8,2,'https://www.facebook.com/museocasadebolivarbga/',1),(9,3,'https://www.facebook.com/Parque.Nacional.Chicamocha/',1),(10,3,'https://www.instagram.com/parquenacionaldelchicamocha',2),(11,4,'https://www.facebook.com/CanonChicamocha',1),(12,5,'https://www.instagram.com/santuariodelavirgendeguadalupe',2),(13,6,'https://www.instagram.com/parquedelosninosbga',2),(14,7,'https://www.facebook.com/parquegarciarovira',1),(15,8,'https://www.instagram.com/museoartemodernobga',2),(16,9,'https://www.facebook.com/zoologicobucaramanga',1),(17,10,'https://www.instagram.com/cuevadelosaviones',2),(18,11,'https://www.facebook.com/miradormesadelossantos',1),(19,12,'https://www.instagram.com/parqueecoturisticocerrodelssantisimo',2),(20,13,'https://www.facebook.com/parquemonaco',1),(21,14,'https://www.instagram.com/iglesiadesanpio',2),(22,15,'https://www.instagram.com/puentecabrera',2),(23,16,'https://www.facebook.com/casadelibrototal',1),(24,17,'https://www.instagram.com/parquedelaflora',2),(25,18,'https://www.facebook.com/lacuevadelindio',1),(26,58,'https://www.instagram.com/parquenacionaldelchicamocha',2),(27,58,'https://www.facebook.com/parquenacionaldelchicamocha',1),(28,59,'https://www.instagram.com/canondelchicamocha',2),(29,60,'https://www.facebook.com/cascadadejuancuri',1),(30,61,'https://www.instagram.com/paramosanturban',2),(31,62,'https://www.facebook.com/reservanaturalcañonchicamocha',1),(32,63,'https://www.instagram.com/miradorbarichara',2),(33,64,'https://www.facebook.com/centrohistoricoGirón',1),(34,65,'https://www.instagram.com/baricharacolombia',2),(35,66,'https://www.facebook.com/balneariopozoazul',1),(36,67,'https://www.instagram.com/cuevadelnitro',2),(37,68,'https://www.facebook.com/peñondelosmuertos',1),(38,69,'https://www.instagram.com/parapentecuriti',2),(39,70,'https://www.facebook.com/riofonce',1),(40,71,'https://www.instagram.com/embalsetopocoro',2),(41,72,'https://www.facebook.com/granjaecoturisticaparaíso',1),(42,73,'https://www.instagram.com/aventuraslamedesantos',2),(43,74,'https://www.facebook.com/jardinbotanicoeloyvalenzuela',1),(44,75,'https://www.instagram.com/campingvallesanjose',2);
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
INSERT INTO `Telefonos` VALUES (1,1,6076345190,'Oficina'),(2,2,6076345123,'Fijo'),(3,3,6077349600,'Oficina'),(4,4,6076749800,'Móvil'),(5,5,6076345345,'Oficina'),(6,6,6076345678,'Fijo'),(7,7,6076345789,'Móvil'),(8,8,6076345890,'Oficina'),(9,9,6076345912,'Móvil'),(10,10,6076346000,'Fijo'),(11,11,6076346090,'Móvil'),(12,12,6076346123,'Oficina'),(13,13,6076346234,'Móvil'),(14,14,6076346345,'Fijo'),(15,15,6076346456,'Oficina'),(16,16,6076346567,'Móvil'),(17,17,6076346678,'Oficina'),(18,18,6076346789,'Fijo'),(58,58,6076347890,'Móvil'),(59,59,6076347901,'Fijo'),(60,60,6076348002,'Móvil'),(61,61,6076348112,'Oficina'),(62,62,6076348223,'Móvil'),(63,63,6076348334,'Fijo'),(64,64,6076348445,'Móvil'),(65,65,6076348556,'Oficina'),(66,66,6076348667,'Fijo'),(67,67,6076348778,'Móvil'),(68,68,6076348889,'Oficina'),(69,69,6076348990,'Móvil'),(70,70,6076349001,'Oficina'),(71,71,6076349112,'Fijo'),(72,72,6076349223,'Móvil'),(73,73,6076349334,'Oficina'),(74,74,6076349445,'Móvil'),(75,75,6076349556,'Fijo');
/*!40000 ALTER TABLE `Telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_destinos_con_facebook`
--

DROP TABLE IF EXISTS `v_destinos_con_facebook`;
/*!50001 DROP VIEW IF EXISTS `v_destinos_con_facebook`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_destinos_con_facebook` AS SELECT 
 1 AS `Destino`,
 1 AS `Tipo Red Social`,
 1 AS `Link_Red_Social`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_listado_destinos_telefonos`
--

DROP TABLE IF EXISTS `v_listado_destinos_telefonos`;
/*!50001 DROP VIEW IF EXISTS `v_listado_destinos_telefonos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_listado_destinos_telefonos` AS SELECT 
 1 AS `Nombre del Destino`,
 1 AS `Telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_destinos_con_facebook`
--

/*!50001 DROP VIEW IF EXISTS `v_destinos_con_facebook`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`credicel_mysql_estudiantes_ago24`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_destinos_con_facebook` AS select `D`.`nombre` AS `Destino`,`NRS`.`nombre_red_social` AS `Tipo Red Social`,`RS`.`link` AS `Link_Red_Social` from ((`Destinos` `D` join `RedesSociales` `RS` on(`D`.`id_destino` = `RS`.`id_destino`)) join `NombresRedesSociales` `NRS` on(`NRS`.`id_nombre_red_social` = `RS`.`id_nombre_red_social`)) where `NRS`.`id_nombre_red_social` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_listado_destinos_telefonos`
--

/*!50001 DROP VIEW IF EXISTS `v_listado_destinos_telefonos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`credicel_mysql_estudiantes_ago24`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_listado_destinos_telefonos` AS select `D`.`nombre` AS `Nombre del Destino`,`T`.`telefono` AS `Telefono` from (`Destinos` `D` join `Telefonos` `T` on(`D`.`id_destino` = `T`.`id_destino`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 20:35:39
