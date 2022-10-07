-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: bdgrupo1_v2
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `direccion_multimedia_taller`
--

DROP TABLE IF EXISTS `direccion_multimedia_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_multimedia_taller` (
  `codigo_taller` int NOT NULL,
  `direccion_archivo_taller` mediumtext,
  PRIMARY KEY (`codigo_taller`),
  CONSTRAINT `direccion_multimedia_taller_ibfk_1` FOREIGN KEY (`codigo_taller`) REFERENCES `taller` (`codigo_Taller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_multimedia_taller`
--

LOCK TABLES `direccion_multimedia_taller` WRITE;
/*!40000 ALTER TABLE `direccion_multimedia_taller` DISABLE KEYS */;
INSERT INTO `direccion_multimedia_taller` VALUES (3,'futlbol.jpg'),(4,'basquetbol.jpg'),(5,'natacion.jpg');
/*!40000 ALTER TABLE `direccion_multimedia_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_taller`
--

DROP TABLE IF EXISTS `horarios_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_taller` (
  `codigo_taller` int NOT NULL,
  `horario` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_taller`,`horario`),
  CONSTRAINT `horarios_taller_ibfk_1` FOREIGN KEY (`codigo_taller`) REFERENCES `taller` (`codigo_Taller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_taller`
--

LOCK TABLES `horarios_taller` WRITE;
/*!40000 ALTER TABLE `horarios_taller` DISABLE KEYS */;
INSERT INTO `horarios_taller` VALUES (3,'Lunes 9:00 - 11:00'),(3,'Martes 9:00 - 11:00'),(4,'Lunes 12:00 - 14:00'),(5,'Jueves 9:00 - 13:00');
/*!40000 ALTER TABLE `horarios_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `rut` varchar(12) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono_personal` varchar(12) NOT NULL,
  `telefono_contacto` varchar(12) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `talla` enum('Talla XS','Talla S','Talla M','Talla L','Talla XL','NA') DEFAULT 'NA',
  `direccion` varchar(200) NOT NULL,
  `sexo` enum('Masculino','Femenino','Prefiero no decirlo') DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('14.773.509-K','Mauricio Gonzalo','Olivares Soto','+56912445648','+56912345648','1999-01-03','NA','Marga Marga 319','Masculino','mauricio.olivares@hotmail.com'),('19.774.119-8','Maria','Juan','+56912345678','','1992-08-21','NA','Calle nueva #50','Prefiero no decirlo',''),('20.271.137-5','Mauricio','Eduardo','+56912345679','+56955555555','1995-08-21','NA','Calle falsa#80','Prefiero no decirlo',''),('4.198.356-6','Sebastian Rodrigo','Yañez Medina','+56912345648','+56912345648','1999-01-02','NA','Marga Marga 315','Masculino','sebastian.yanez@hotmail.com'),('8.773.084-0','Eugenio Alonso','Vivar Cortes','+56912345678','+56912345678','1999-01-01','NA','Marga Marga 312','Masculino','eugenio.vivar@hotmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bdgrupo1`@`localhost`*/ /*!50003 TRIGGER `check_rut` BEFORE INSERT ON `persona` FOR EACH ROW BEGIN
declare existe_rut BOOLEAN;
set existe_rut = (select validate_rut(new.rut));
if existe_rut=0 then
SIGNAL SQLSTATE '45000' set message_text='El rut ingresado no es valido favor de introducir de nuevo los datos';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `solicitud_deportiva`
--

DROP TABLE IF EXISTS `solicitud_deportiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_deportiva` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `rut_postulante` varchar(12) NOT NULL,
  `codigo_taller` int NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `estado_taller` enum('aceptada','rechazada','En proceso') DEFAULT 'En proceso',
  PRIMARY KEY (`id_solicitud`),
  KEY `rut_postulante` (`rut_postulante`),
  KEY `codigo_taller` (`codigo_taller`),
  CONSTRAINT `solicitud_deportiva_ibfk_1` FOREIGN KEY (`rut_postulante`) REFERENCES `persona` (`rut`),
  CONSTRAINT `solicitud_deportiva_ibfk_2` FOREIGN KEY (`codigo_taller`) REFERENCES `taller` (`codigo_Taller`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_deportiva`
--

LOCK TABLES `solicitud_deportiva` WRITE;
/*!40000 ALTER TABLE `solicitud_deportiva` DISABLE KEYS */;
INSERT INTO `solicitud_deportiva` VALUES (1,'20.271.137-5',3,'2022-10-07','En proceso'),(2,'19.774.119-8',3,'2022-10-07','En proceso'),(3,'20.271.137-5',4,'2022-10-07','En proceso');
/*!40000 ALTER TABLE `solicitud_deportiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller` (
  `codigo_Taller` int NOT NULL AUTO_INCREMENT,
  `rut_responsable` varchar(12) NOT NULL,
  `cupos` int NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `nombre_taller` varchar(100) NOT NULL,
  `estado_taller` varchar(12) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_termino` date NOT NULL,
  `modalidad` enum('online','presencial','hibrido') NOT NULL,
  `requisitos` text,
  `area` varchar(50) NOT NULL,
  `fecha_inicio_postulacion` date NOT NULL,
  `fecha_termino_postulacion` date NOT NULL,
  `edad_minima` int DEFAULT '-1',
  PRIMARY KEY (`codigo_Taller`),
  KEY `rut_responsable` (`rut_responsable`),
  CONSTRAINT `taller_ibfk_1` FOREIGN KEY (`rut_responsable`) REFERENCES `persona` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (3,'8.773.084-0',25,'Quebrada diablo 2015','Futbol','Postulando','Taller vinculado a las edades mayores a 25 años o mas','2022-12-01','2023-01-01','presencial','Tener disposicion y zapatillas de football','Futbol','2022-10-01','2022-11-30',25),(4,'4.198.356-6',30,'Quebrada diablo 2015','Basquetbol','Postulando','Taller vinculado a las edades mayores a 25 años o mas','2022-12-01','2023-01-01','presencial','Tener disposicion y zapatillas de basquetbol','Basquetbol','2022-10-01','2022-11-30',25),(5,'14.773.509-K',20,'Quebrada diablo 2015','Natacion','Postulando','Taller vinculado a las edades mayores a 60 años o mas','2022-12-01','2023-01-01','presencial','Tener disposicion y Gorro de natacion','Natacionl','2022-10-01','2022-11-30',60);
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 12:40:40
