-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-03-2015 a las 18:03:54
-- Versión del servidor: 5.5.42-cll
-- Versión de PHP: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pin2_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE IF NOT EXISTS `ciudadano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`id`, `nombre`) VALUES
(1, 'Ciudadano 001'),
(2, 'ciudadano 002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`) VALUES
(1, 'Empresolandia'),
(2, 'Empresa segunda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `errores`
--

CREATE TABLE IF NOT EXISTS `errores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usuario` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `error` text COLLATE utf8_spanish2_ci,
  `fecha` datetime DEFAULT NULL,
  `relevance` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `errores`
--

INSERT INTO `errores` (`id`, `seccion`, `usuario`, `error`, `fecha`, `relevance`) VALUES
(17, 'User_model.login', '0', 'Error de acceso [root] [junar] [081dd48dc628a7683c2603863f19f97a]', '2014-12-14 17:47:02', 5),
(18, 'User_model.login', '0', 'Error de acceso [root] [junar] [081dd48dc628a7683c2603863f19f97a]', '2014-12-14 17:47:36', 5),
(19, 'User_model.login', '0', 'Error de acceso [root] [junar] [081dd48dc628a7683c2603863f19f97a]', '2014-12-14 18:00:00', 5),
(20, 'User_model.login', '0', 'Error de acceso [andres] [sddsdf] [dd0971b5de0b07a46a050811c7b6f8ed]', '2014-12-15 21:11:10', 5),
(21, 'User_model.login', '0', 'Error de acceso [andres] [4lanaL16] [2a5e46a3c4366ac7f95f33c12ce740b2]', '2014-12-15 21:33:38', 5),
(22, 'User_model.login', '0', 'Error de acceso [] [] [d41d8cd98f00b204e9800998ecf8427e]', '2015-01-04 22:36:57', 5),
(23, 'User_model.login', '0', 'Error de acceso [] [] [d41d8cd98f00b204e9800998ecf8427e]', '2015-01-23 10:27:12', 5),
(24, 'User_model.login', '0', 'Error de acceso [negu.a@htmail.es] [ 38caa986] [9d885ee53136159d79e405fa1e5fb2d2]', '2015-01-23 10:27:12', 5),
(25, 'User_model.login', '0', 'Error de acceso [negu.a@hotmail.es] [ 38caa986] [9d885ee53136159d79e405fa1e5fb2d2]', '2015-01-23 10:27:52', 5),
(26, 'User_model.login', '0', 'Error de acceso [negu.a@hotmail.es] [ 38caa986] [9d885ee53136159d79e405fa1e5fb2d2]', '2015-01-23 10:28:56', 5),
(27, 'User_model.login', '0', 'Error de acceso [negu.a@hotmail.es] [odrinar007] [dfd24a4f87be7a1a7f98c181378c52c8]', '2015-01-24 05:54:02', 5),
(28, 'User_model.login', '0', 'Error de acceso [negu.a@hotmail.es] [odrinar007] [dfd24a4f87be7a1a7f98c181378c52c8]', '2015-01-24 05:54:23', 5),
(29, 'User_model.login', '0', 'Error de acceso [negu.a@hotmail.es] [odrinar007] [dfd24a4f87be7a1a7f98c181378c52c8]', '2015-01-24 05:54:25', 5),
(30, 'User_model.login', '0', 'Error de acceso [pin2] [pin*2_99] [673e53aff5d2a4da7bfba9010a791baf]', '2015-03-13 10:17:28', 5),
(31, 'User_model.login', '0', 'Error de acceso [pin2] [pin*2_99] [673e53aff5d2a4da7bfba9010a791baf]', '2015-03-13 10:47:55', 5),
(32, 'User_model.login', '0', 'Error de acceso [pin2] [pin*2_99] [673e53aff5d2a4da7bfba9010a791baf]', '2015-03-13 10:48:26', 5),
(33, 'User_model.login', '0', 'Error de acceso [mariano] [mosq_era*] [814b87db965e1640a4e82d7cadb8ea92]', '2015-03-24 17:13:24', 5),
(34, 'User_model.login', '0', 'Error de acceso [mariano] [mosq_era*] [814b87db965e1640a4e82d7cadb8ea92]', '2015-03-24 17:13:31', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gobierno`
--

CREATE TABLE IF NOT EXISTS `gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `gobierno`
--

INSERT INTO `gobierno` (`id`, `nombre`) VALUES
(1, 'Mendiolaza'),
(2, 'Unquillo'),
(3, 'Villa Allende');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion`
--

CREATE TABLE IF NOT EXISTS `licitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gobierno_id` int(11) NOT NULL,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  `detalle` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_licitacion_7a0809aa` (`gobierno_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `licitacion`
--

INSERT INTO `licitacion` (`id`, `gobierno_id`, `nombre`, `detalle`) VALUES
(2, 1, 'Licitacion de algo que vale mucho', '<p>\n	Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba dewe jo 98e ww we9f wjefj wej w9ejf 9w efjwefjwefueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo</p>\n'),
(3, 2, 'Probando ando', '<p>\n	asd asd asd <strong>asd</strong> asd</p>\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observador`
--

CREATE TABLE IF NOT EXISTS `observador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `observador`
--

INSERT INTO `observador` (`id`, `nombre`) VALUES
(1, 'Observador 001'),
(2, 'Observador 002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id`, `nombre`) VALUES
(1, 'VIEW_GOVS'),
(2, 'VIEW_LICITACION'),
(3, 'VIEW_OBSERVADORES'),
(4, 'VIEW_EMPRESAS'),
(5, 'VIEW_CIUDADANOS'),
(6, 'VIEW_USUARIOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_rol`
--

CREATE TABLE IF NOT EXISTS `permiso_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_permiso` (`id_permiso`,`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `permiso_rol`
--

INSERT INTO `permiso_rol` (`id`, `id_permiso`, `id_rol`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 1, 1),
(4, 2, 1),
(5, 3, 1),
(6, 4, 1),
(7, 5, 1),
(8, 6, 1),
(9, 7, 1),
(10, 8, 1),
(11, 9, 1),
(12, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'FULL_ADMIN'),
(2, 'GOV_ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `login` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(190) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`) VALUES
(1, 'Andres Vazquez', 'andres', '17e16b3561906388389cb18adcfd5b0b'),
(2, 'Mariano Mosquera', 'mariano', '814b87db965e1640a4e82d7cadb8ea92');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id`, `id_usuario`, `id_rol`) VALUES
(1, 1, 1),
(2, 2, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `licitacion`
--
ALTER TABLE `licitacion`
  ADD CONSTRAINT `licitacion_ibfk_1` FOREIGN KEY (`gobierno_id`) REFERENCES `gobierno` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
