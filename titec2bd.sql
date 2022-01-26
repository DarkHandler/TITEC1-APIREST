-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-01-2022 a las 00:03:56
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `titec2bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `codigo_actividad` int(11) NOT NULL,
  `rut_responsable` varchar(13) NOT NULL,
  `tipo` enum('Evento','Taller') NOT NULL,
  `cupos` int(11) NOT NULL,
  `direccion` tinytext NOT NULL,
  `nombre_actividad` tinytext NOT NULL,
  `estado_actividad` varchar(12) NOT NULL,
  `descripción` text DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_termino` date NOT NULL,
  `modalidad` enum('Online','Presencial') NOT NULL,
  `requisitos` text DEFAULT NULL,
  `area` varchar(50) DEFAULT 'Sin area'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`codigo_actividad`, `rut_responsable`, `tipo`, `cupos`, `direccion`, `nombre_actividad`, `estado_actividad`, `descripción`, `fecha_inicio`, `fecha_termino`, `modalidad`, `requisitos`, `area`) VALUES
(1, '13.231.412-2', 'Taller', 30, 'Av. Cubo Rubik 123', 'Futbol', 'Postulando', 'Esta actividad se realiza con todos los clubes deportivos de quintero', '2022-01-01', '2022-02-02', 'Presencial', 'Tener entusiasmo y zapatillas de football', 'Futbol'),
(2, '14.222.313-3', 'Taller', 30, 'Av. Diputado Vivar 312', 'Basquetbol', 'Postulando', 'Esta actividad se realiza con todos los clubes deportivos de quintero que son de basquetbol', '2022-01-01', '2022-02-02', 'Presencial', 'Tener entusiasmo y balon de basquetbol', 'Basquetbol'),
(3, '17.333.222-2', 'Taller', 40, 'Av. Argleton Bar´s', 'Natacion', 'Postulando', 'Este taller se realiza en el unico lugar deportivo de chile', '2022-03-03', '2022-04-04', 'Presencial', 'Tener gorra de baño, mascarilla y sufles', 'Natacion'),
(4, '13.231.412-2', 'Taller', 30, 'Manuel acevedo 312', 'Beisbolito', 'Postulando', 'Este es el taller de beisbol para menores entre 12 a 15 anios', '2022-05-20', '2022-06-20', 'Presencial', 'Comprarse gorra de beisbol, un bate y tener motivacion', 'Beisbol'),
(5, '13.231.412-2', 'Taller', 30, 'Pruebas', 'Pruebas2', 'Postulando', 'Esta es la prueba del taller', '2022-06-20', '2022-07-20', 'Presencial', 'Pruebas3', 'Pruebas4'),
(6, '13.231.412-2', 'Taller', 30, 'Pruebas5', 'Pruebas6', 'Postulando', 'Esta es la prueba del taller 2', '2022-07-20', '2022-08-20', 'Presencial', 'Pruebas7', 'Pruebas8');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `all_talleres`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `all_talleres` (
`codigo_actividad` int(11)
,`rut_responsable` varchar(13)
,`tipo` enum('Evento','Taller')
,`cupos` int(11)
,`direccion` tinytext
,`nombre_actividad` tinytext
,`estado_actividad` varchar(12)
,`descripción` text
,`fecha_inicio` date
,`fecha_termino` date
,`modalidad` enum('Online','Presencial')
,`requisitos` text
,`area` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `area` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_de_hora`
--

CREATE TABLE `comprobante_de_hora` (
  `id_comprobante` int(11) NOT NULL,
  `respuesta` varchar(150) NOT NULL,
  `id_hora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

CREATE TABLE `correo` (
  `rut` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `correo`
--

INSERT INTO `correo` (`rut`, `correo`) VALUES
('13.231.412-2', 'eugenio.alonso@gmail.com'),
('14.222.313-3', 'sebastian.rodrigo@gmail.com'),
('17.333.222-2', 'mauricio.gonzalo2@gmail.com'),
('17.333.222-2', 'mauricio.gonzalo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `datos_profesor`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `datos_profesor` (
`rut` varchar(13)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`numero_contacto` varchar(12)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `rut` varchar(13) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `poblacion_o_villa` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_multimedia`
--

CREATE TABLE `direccion_multimedia` (
  `codigo_actividad` int(11) NOT NULL,
  `direccion_archivo` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion_multimedia`
--

INSERT INTO `direccion_multimedia` (`codigo_actividad`, `direccion_archivo`) VALUES
(1, '../imagesBD/futlbol.jpg'),
(2, '../imagesBD/basquetbol.jpg'),
(1, '../imagesBD/futbol2.jpg'),
(3, '../imagesBD/natacion.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(30) NOT NULL,
  `id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `codigo_estado` int(11) NOT NULL,
  `glosa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_clinica`
--

CREATE TABLE `ficha_clinica` (
  `historial` varchar(100) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_nutricional`
--

CREATE TABLE `ficha_nutricional` (
  `rut` varchar(13) NOT NULL,
  `fecha` date NOT NULL,
  `actividad_laboral` int(11) NOT NULL,
  `actividad_fisica` varchar(45) NOT NULL,
  `hrs_fisica_semanal` int(11) NOT NULL,
  `consumo_alcohol` tinyint(1) NOT NULL,
  `cant_alcohol_semanal` int(11) NOT NULL,
  `habito_tabaco` tinyint(1) NOT NULL,
  `cant_tabaco_semana` int(11) NOT NULL,
  `antecedentes_morbidos` varchar(45) NOT NULL,
  `otras_patologias` varchar(45) NOT NULL,
  `peso` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `imc` int(11) NOT NULL,
  `pitri` float NOT NULL,
  `pibi` float NOT NULL,
  `pisb` float NOT NULL,
  `pisc` float NOT NULL,
  `porcentaje_grasa` float NOT NULL,
  `gmb` float NOT NULL,
  `tiempo_de_comida` int(11) NOT NULL,
  `peso_ideal` int(11) NOT NULL,
  `alimentos_porciones` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_psicologica`
--

CREATE TABLE `ficha_psicologica` (
  `rut` varchar(13) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `codigo_actividad` int(11) NOT NULL,
  `horario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`codigo_actividad`, `horario`) VALUES
(1, 'Lunes 16:00-18:00'),
(1, 'Lunes 18:00-20:00'),
(2, 'Martes 12:00-14:00'),
(3, 'Miercoles 16:00-18:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora_medica`
--

CREATE TABLE `hora_medica` (
  `id_hora` int(11) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `rut_p` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `rut` varchar(13) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `numero_contacto` varchar(12) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `prevision` varchar(20) DEFAULT 'Sin Previsión',
  `foto` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`rut`, `nombres`, `apellidos`, `numero_contacto`, `fecha_nacimiento`, `prevision`, `foto`) VALUES
('13.231.412-2', 'Eugenio Alonso', 'Vivar Cortes', '+569312412', '1999-01-01', 'FONASA', NULL),
('14.222.313-3', 'Sebastian Rodrigo', 'Yañez Medina', '+5691112233', '1999-02-03', 'ISAPRE', NULL),
('17.333.222-2', 'Mauricio Gonzalo', 'Olivares Soto', '+5694242312', '1972-03-07', 'ISAPRE', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional`
--

CREATE TABLE `profesional` (
  `rut_p` varchar(13) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `fono` varchar(12) NOT NULL,
  `num_sala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_espec`
--

CREATE TABLE `pro_espec` (
  `id_especialidad` int(11) NOT NULL,
  `rut_p` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `num_sala` int(11) NOT NULL,
  `ubicacion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicita`
--

CREATE TABLE `solicita` (
  `motivo` varchar(45) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `id_hora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_deportiva`
--

CREATE TABLE `solicitud_deportiva` (
  `id_solicitud` int(11) NOT NULL,
  `rut_postulante` varchar(13) NOT NULL,
  `codigo_actividad` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `datos_extra` text DEFAULT NULL,
  `obs_medica` text DEFAULT NULL,
  `estado` enum('aceptada','pendiente','rechazada') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_usuario`
--

CREATE TABLE `tipo_de_usuario` (
  `codigo_tip_usa` int(11) NOT NULL,
  `glosa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(100) NOT NULL,
  `rut` varchar(13) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `estado` enum('ACTIVO','SUPRIMIDO','BLOQUEADO','INACTIVO') NOT NULL,
  `codigo_tip_usa` int(11) NOT NULL,
  `codigo_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura para la vista `all_talleres`
--
DROP TABLE IF EXISTS `all_talleres`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_talleres`  AS SELECT `actividades`.`codigo_actividad` AS `codigo_actividad`, `actividades`.`rut_responsable` AS `rut_responsable`, `actividades`.`tipo` AS `tipo`, `actividades`.`cupos` AS `cupos`, `actividades`.`direccion` AS `direccion`, `actividades`.`nombre_actividad` AS `nombre_actividad`, `actividades`.`estado_actividad` AS `estado_actividad`, `actividades`.`descripción` AS `descripción`, `actividades`.`fecha_inicio` AS `fecha_inicio`, `actividades`.`fecha_termino` AS `fecha_termino`, `actividades`.`modalidad` AS `modalidad`, `actividades`.`requisitos` AS `requisitos`, `actividades`.`area` AS `area` FROM `actividades` WHERE `actividades`.`tipo` = 'Taller' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `datos_profesor`
--
DROP TABLE IF EXISTS `datos_profesor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datos_profesor`  AS SELECT `persona`.`rut` AS `rut`, `persona`.`nombres` AS `nombres`, `persona`.`apellidos` AS `apellidos`, `persona`.`numero_contacto` AS `numero_contacto` FROM `persona` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`codigo_actividad`,`rut_responsable`),
  ADD KEY `rut_responsable` (`rut_responsable`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `comprobante_de_hora`
--
ALTER TABLE `comprobante_de_hora`
  ADD PRIMARY KEY (`id_comprobante`),
  ADD KEY `id_hora` (`id_hora`);

--
-- Indices de la tabla `correo`
--
ALTER TABLE `correo`
  ADD PRIMARY KEY (`rut`,`correo`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD KEY `rut` (`rut`);

--
-- Indices de la tabla `direccion_multimedia`
--
ALTER TABLE `direccion_multimedia`
  ADD KEY `codigo_actividad` (`codigo_actividad`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`codigo_estado`);

--
-- Indices de la tabla `ficha_clinica`
--
ALTER TABLE `ficha_clinica`
  ADD PRIMARY KEY (`fecha`),
  ADD KEY `rut` (`rut`);

--
-- Indices de la tabla `ficha_nutricional`
--
ALTER TABLE `ficha_nutricional`
  ADD PRIMARY KEY (`fecha`),
  ADD KEY `rut` (`rut`);

--
-- Indices de la tabla `ficha_psicologica`
--
ALTER TABLE `ficha_psicologica`
  ADD PRIMARY KEY (`fecha`),
  ADD KEY `rut` (`rut`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`codigo_actividad`,`horario`);

--
-- Indices de la tabla `hora_medica`
--
ALTER TABLE `hora_medica`
  ADD PRIMARY KEY (`id_hora`),
  ADD KEY `rut_p` (`rut_p`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD PRIMARY KEY (`rut_p`),
  ADD KEY `num_sala` (`num_sala`);

--
-- Indices de la tabla `pro_espec`
--
ALTER TABLE `pro_espec`
  ADD KEY `rut_p` (`rut_p`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`num_sala`);

--
-- Indices de la tabla `solicita`
--
ALTER TABLE `solicita`
  ADD PRIMARY KEY (`motivo`),
  ADD KEY `rut` (`rut`),
  ADD KEY `id_hora` (`id_hora`);

--
-- Indices de la tabla `solicitud_deportiva`
--
ALTER TABLE `solicitud_deportiva`
  ADD PRIMARY KEY (`id_solicitud`,`rut_postulante`),
  ADD KEY `rut_postulante` (`rut_postulante`),
  ADD KEY `codigo_actividad` (`codigo_actividad`);

--
-- Indices de la tabla `tipo_de_usuario`
--
ALTER TABLE `tipo_de_usuario`
  ADD PRIMARY KEY (`codigo_tip_usa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`),
  ADD KEY `rut` (`rut`),
  ADD KEY `codigo_tip_usa` (`codigo_tip_usa`),
  ADD KEY `codigo_estado` (`codigo_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `codigo_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobante_de_hora`
--
ALTER TABLE `comprobante_de_hora`
  MODIFY `id_comprobante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hora_medica`
--
ALTER TABLE `hora_medica`
  MODIFY `id_hora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud_deportiva`
--
ALTER TABLE `solicitud_deportiva`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`rut_responsable`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprobante_de_hora`
--
ALTER TABLE `comprobante_de_hora`
  ADD CONSTRAINT `comprobante_de_hora_ibfk_1` FOREIGN KEY (`id_hora`) REFERENCES `hora_medica` (`id_hora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `correo`
--
ALTER TABLE `correo`
  ADD CONSTRAINT `correo_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direccion_multimedia`
--
ALTER TABLE `direccion_multimedia`
  ADD CONSTRAINT `direccion_multimedia_ibfk_1` FOREIGN KEY (`codigo_actividad`) REFERENCES `actividades` (`codigo_actividad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `especialidad_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ficha_clinica`
--
ALTER TABLE `ficha_clinica`
  ADD CONSTRAINT `ficha_clinica_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ficha_nutricional`
--
ALTER TABLE `ficha_nutricional`
  ADD CONSTRAINT `ficha_nutricional_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ficha_psicologica`
--
ALTER TABLE `ficha_psicologica`
  ADD CONSTRAINT `ficha_psicologica_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`codigo_actividad`) REFERENCES `actividades` (`codigo_actividad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hora_medica`
--
ALTER TABLE `hora_medica`
  ADD CONSTRAINT `hora_medica_ibfk_1` FOREIGN KEY (`rut_p`) REFERENCES `profesional` (`rut_p`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD CONSTRAINT `profesional_ibfk_1` FOREIGN KEY (`num_sala`) REFERENCES `sala` (`num_sala`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pro_espec`
--
ALTER TABLE `pro_espec`
  ADD CONSTRAINT `pro_espec_ibfk_1` FOREIGN KEY (`rut_p`) REFERENCES `profesional` (`rut_p`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pro_espec_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicita`
--
ALTER TABLE `solicita`
  ADD CONSTRAINT `solicita_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicita_ibfk_2` FOREIGN KEY (`id_hora`) REFERENCES `hora_medica` (`id_hora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud_deportiva`
--
ALTER TABLE `solicitud_deportiva`
  ADD CONSTRAINT `solicitud_deportiva_ibfk_1` FOREIGN KEY (`rut_postulante`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitud_deportiva_ibfk_2` FOREIGN KEY (`codigo_actividad`) REFERENCES `actividades` (`codigo_actividad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rut`) REFERENCES `persona` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`codigo_tip_usa`) REFERENCES `tipo_de_usuario` (`codigo_tip_usa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`codigo_estado`) REFERENCES `estado` (`codigo_estado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
