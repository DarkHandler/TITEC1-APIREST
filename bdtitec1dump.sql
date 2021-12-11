-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: titec1bd
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.04.1

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `codigo_actividad` int NOT NULL AUTO_INCREMENT,
  `rut_responsable` varchar(13) NOT NULL,
  `tipo` enum('Evento','Taller') NOT NULL,
  `cupos` int NOT NULL,
  `direccion` tinytext NOT NULL,
  `nombre_actividad` tinytext NOT NULL,
  `estado_actividad` varchar(12) NOT NULL,
  `descripción` text,
  `fecha_inicio` date NOT NULL,
  `fecha_termino` date NOT NULL,
  `modalidad` enum('Online','Presencial') NOT NULL,
  `requisitos` text,
  `area` varchar(50) DEFAULT 'Sin area',
  PRIMARY KEY (`codigo_actividad`,`rut_responsable`),
  KEY `rut_responsable` (`rut_responsable`),
  CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`rut_responsable`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,'13.231.412-2','Taller',30,'Av. Cubo Rubik 123','Futbol','Postulando','Esta actividad se realiza con todos los clubes deportivos de quintero','2022-01-01','2022-02-02','Presencial','Tener entusiasmo y zapatillas de football','Futbol'),(2,'14.222.313-3','Taller',30,'Av. Diputado Vivar 312','Basquetbol','Postulando','Esta actividad se realiza con todos los clubes deportivos de quintero que son de basquetbol','2022-01-01','2022-02-02','Presencial','Tener entusiasmo y balon de basquetbol','Basquetbol'),(3,'17.333.222-2','Taller',40,'Av. Argleton Bar´s','Natacion','Postulando','Este taller se realiza en el unico lugar deportivo de chile','2022-03-03','2022-04-04','Presencial','Tener gorra de baño, mascarilla y sufles','Natacion');
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_talleres`
--

DROP TABLE IF EXISTS `all_talleres`;
/*!50001 DROP VIEW IF EXISTS `all_talleres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_talleres` AS SELECT 
 1 AS `codigo_actividad`,
 1 AS `rut_responsable`,
 1 AS `tipo`,
 1 AS `cupos`,
 1 AS `direccion`,
 1 AS `nombre_actividad`,
 1 AS `estado_actividad`,
 1 AS `descripción`,
 1 AS `fecha_inicio`,
 1 AS `fecha_termino`,
 1 AS `modalidad`,
 1 AS `requisitos`,
 1 AS `area`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `area` varchar(45) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante_de_hora`
--

DROP TABLE IF EXISTS `comprobante_de_hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante_de_hora` (
  `id_comprobante` int NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(150) NOT NULL,
  `id_hora` int NOT NULL,
  PRIMARY KEY (`id_comprobante`),
  KEY `id_hora` (`id_hora`),
  CONSTRAINT `comprobante_de_hora_ibfk_1` FOREIGN KEY (`id_hora`) REFERENCES `hora_medica` (`id_hora`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_de_hora`
--

LOCK TABLES `comprobante_de_hora` WRITE;
/*!40000 ALTER TABLE `comprobante_de_hora` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante_de_hora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correo` (
  `rut` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`rut`,`correo`),
  CONSTRAINT `correo_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datos_profesor`
--

DROP TABLE IF EXISTS `datos_profesor`;
/*!50001 DROP VIEW IF EXISTS `datos_profesor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_profesor` AS SELECT 
 1 AS `rut`,
 1 AS `nombres`,
 1 AS `apellidos`,
 1 AS `numero_contacto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `rut` varchar(13) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `poblacion_o_villa` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL,
  KEY `rut` (`rut`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_multimedia`
--

DROP TABLE IF EXISTS `direccion_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_multimedia` (
  `codigo_actividad` int NOT NULL,
  `direccion_archivo` mediumtext NOT NULL,
  KEY `codigo_actividad` (`codigo_actividad`),
  CONSTRAINT `direccion_multimedia_ibfk_1` FOREIGN KEY (`codigo_actividad`) REFERENCES `actividades` (`codigo_actividad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_multimedia`
--

LOCK TABLES `direccion_multimedia` WRITE;
/*!40000 ALTER TABLE `direccion_multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion_multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(30) NOT NULL,
  `id_area` int NOT NULL,
  PRIMARY KEY (`id_especialidad`),
  KEY `id_area` (`id_area`),
  CONSTRAINT `especialidad_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `codigo_estado` int NOT NULL,
  `glosa` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_clinica`
--

DROP TABLE IF EXISTS `ficha_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_clinica` (
  `historial` varchar(100) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `rut` (`rut`),
  CONSTRAINT `ficha_clinica_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_clinica`
--

LOCK TABLES `ficha_clinica` WRITE;
/*!40000 ALTER TABLE `ficha_clinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_nutricional`
--

DROP TABLE IF EXISTS `ficha_nutricional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_nutricional` (
  `rut` varchar(13) NOT NULL,
  `fecha` date NOT NULL,
  `actividad_laboral` int NOT NULL,
  `actividad_fisica` varchar(45) NOT NULL,
  `hrs_fisica_semanal` int NOT NULL,
  `consumo_alcohol` tinyint(1) NOT NULL,
  `cant_alcohol_semanal` int NOT NULL,
  `habito_tabaco` tinyint(1) NOT NULL,
  `cant_tabaco_semana` int NOT NULL,
  `antecedentes_morbidos` varchar(45) NOT NULL,
  `otras_patologias` varchar(45) NOT NULL,
  `peso` int NOT NULL,
  `talla` int NOT NULL,
  `imc` int NOT NULL,
  `pitri` float NOT NULL,
  `pibi` float NOT NULL,
  `pisb` float NOT NULL,
  `pisc` float NOT NULL,
  `porcentaje_grasa` float NOT NULL,
  `gmb` float NOT NULL,
  `tiempo_de_comida` int NOT NULL,
  `peso_ideal` int NOT NULL,
  `alimentos_porciones` varchar(100) NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `rut` (`rut`),
  CONSTRAINT `ficha_nutricional_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_nutricional`
--

LOCK TABLES `ficha_nutricional` WRITE;
/*!40000 ALTER TABLE `ficha_nutricional` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_nutricional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_psicologica`
--

DROP TABLE IF EXISTS `ficha_psicologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_psicologica` (
  `rut` varchar(13) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `rut` (`rut`),
  CONSTRAINT `ficha_psicologica_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_psicologica`
--

LOCK TABLES `ficha_psicologica` WRITE;
/*!40000 ALTER TABLE `ficha_psicologica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_psicologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hora_medica`
--

DROP TABLE IF EXISTS `hora_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hora_medica` (
  `id_hora` int NOT NULL AUTO_INCREMENT,
  `disponibilidad` tinyint(1) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `rut_p` varchar(13) NOT NULL,
  PRIMARY KEY (`id_hora`),
  KEY `rut_p` (`rut_p`),
  CONSTRAINT `hora_medica_ibfk_1` FOREIGN KEY (`rut_p`) REFERENCES `profesional` (`rut_p`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hora_medica`
--

LOCK TABLES `hora_medica` WRITE;
/*!40000 ALTER TABLE `hora_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `hora_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `codigo_actividad` int NOT NULL,
  `horario` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_actividad`,`horario`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`codigo_actividad`) REFERENCES `actividades` (`codigo_actividad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'Lunes 16:00-18:00'),(1,'Lunes 18:00-20:00'),(2,'Martes 12:00-14:00'),(3,'Miercoles 16:00-18:00');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `rut` varchar(13) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `numero_contacto` varchar(12) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `prevision` varchar(20) DEFAULT 'Sin Previsión',
  `foto` tinytext,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('13.231.412-2','Eugenio Alonso','Vivar Cortes','+569312412','1999-01-01','FONASA',NULL),('14.222.313-3','Sebastian Rodrigo','Yañez Medina','+5691112233','1999-02-03','ISAPRE',NULL),('17.333.222-2','Mauricio Gonzalo','Olivares Soto','+5694242312','1972-03-07','ISAPRE',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_espec`
--

DROP TABLE IF EXISTS `pro_espec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_espec` (
  `id_especialidad` int NOT NULL,
  `rut_p` varchar(13) NOT NULL,
  KEY `rut_p` (`rut_p`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `pro_espec_ibfk_1` FOREIGN KEY (`rut_p`) REFERENCES `profesional` (`rut_p`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pro_espec_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_espec`
--

LOCK TABLES `pro_espec` WRITE;
/*!40000 ALTER TABLE `pro_espec` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_espec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesional`
--

DROP TABLE IF EXISTS `profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesional` (
  `rut_p` varchar(13) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `fono` varchar(12) NOT NULL,
  `num_sala` int NOT NULL,
  PRIMARY KEY (`rut_p`),
  KEY `num_sala` (`num_sala`),
  CONSTRAINT `profesional_ibfk_1` FOREIGN KEY (`num_sala`) REFERENCES `sala` (`num_sala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesional`
--

LOCK TABLES `profesional` WRITE;
/*!40000 ALTER TABLE `profesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `num_sala` int NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  PRIMARY KEY (`num_sala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicita`
--

DROP TABLE IF EXISTS `solicita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicita` (
  `motivo` varchar(45) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `id_hora` int NOT NULL,
  PRIMARY KEY (`motivo`),
  KEY `rut` (`rut`),
  KEY `id_hora` (`id_hora`),
  CONSTRAINT `solicita_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `solicita_ibfk_2` FOREIGN KEY (`id_hora`) REFERENCES `hora_medica` (`id_hora`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicita`
--

LOCK TABLES `solicita` WRITE;
/*!40000 ALTER TABLE `solicita` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_deportiva`
--

DROP TABLE IF EXISTS `solicitud_deportiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_deportiva` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `rut_postulante` varchar(13) NOT NULL,
  `codigo_actividad` int NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `datos_extra` text,
  `obs_medica` text,
  `estado` enum('aceptada','pendiente','rechazada') DEFAULT 'pendiente',
  PRIMARY KEY (`id_solicitud`,`rut_postulante`),
  KEY `rut_postulante` (`rut_postulante`),
  KEY `codigo_actividad` (`codigo_actividad`),
  CONSTRAINT `solicitud_deportiva_ibfk_1` FOREIGN KEY (`rut_postulante`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `solicitud_deportiva_ibfk_2` FOREIGN KEY (`codigo_actividad`) REFERENCES `actividades` (`codigo_actividad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_deportiva`
--

LOCK TABLES `solicitud_deportiva` WRITE;
/*!40000 ALTER TABLE `solicitud_deportiva` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_deportiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_usuario`
--

DROP TABLE IF EXISTS `tipo_de_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_usuario` (
  `codigo_tip_usa` int NOT NULL,
  `glosa` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_tip_usa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_usuario`
--

LOCK TABLES `tipo_de_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_de_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_de_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `correo` varchar(100) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `estado` enum('ACTIVO','SUPRIMIDO','BLOQUEADO','INACTIVO') NOT NULL,
  `codigo_tip_usa` int NOT NULL,
  `codigo_estado` int NOT NULL,
  PRIMARY KEY (`correo`),
  KEY `rut` (`rut`),
  KEY `codigo_tip_usa` (`codigo_tip_usa`),
  KEY `codigo_estado` (`codigo_estado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`codigo_tip_usa`) REFERENCES `tipo_de_usuario` (`codigo_tip_usa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`codigo_estado`) REFERENCES `estado` (`codigo_estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_talleres`
--

/*!50001 DROP VIEW IF EXISTS `all_talleres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_talleres` AS select `actividades`.`codigo_actividad` AS `codigo_actividad`,`actividades`.`rut_responsable` AS `rut_responsable`,`actividades`.`tipo` AS `tipo`,`actividades`.`cupos` AS `cupos`,`actividades`.`direccion` AS `direccion`,`actividades`.`nombre_actividad` AS `nombre_actividad`,`actividades`.`estado_actividad` AS `estado_actividad`,`actividades`.`descripción` AS `descripción`,`actividades`.`fecha_inicio` AS `fecha_inicio`,`actividades`.`fecha_termino` AS `fecha_termino`,`actividades`.`modalidad` AS `modalidad`,`actividades`.`requisitos` AS `requisitos`,`actividades`.`area` AS `area` from `actividades` where (`actividades`.`tipo` = 'Taller') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datos_profesor`
--

/*!50001 DROP VIEW IF EXISTS `datos_profesor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_profesor` AS select `persona`.`rut` AS `rut`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`numero_contacto` AS `numero_contacto` from `persona` */;
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

-- Dump completed on 2021-12-07  2:05:41
