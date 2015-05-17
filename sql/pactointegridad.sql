-- phpMyAdmin SQL Dump
-- version 4.1.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-04-2015 a las 19:37:44
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pactointegridad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_logs`
--

CREATE TABLE IF NOT EXISTS `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` tinyint(1) NOT NULL,
  `response_code` smallint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE IF NOT EXISTS `ciudadano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
 `status` int(5) NOT NULL,
 `cuit` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
 `email` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
 `responsable_nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
 `responsable_apellido` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
 `pais` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `cuit` (`cuit`,`email`),
 KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gobierno`
--

CREATE TABLE IF NOT EXISTS `gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion`
--

CREATE TABLE IF NOT EXISTS `licitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `gobierno_id` int(11) NOT NULL,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  `detalle` longtext CHARACTER SET latin1 NOT NULL,
  `documento` varchar(190) COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` varchar(190) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `website_licitacion_7a0809aa` (`gobierno_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observador`
--

CREATE TABLE IF NOT EXISTS `observador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id`, `nombre`) VALUES
(1, 'VIEW_GOVS'),
(2, 'VIEW_LICITACION'),
(3, 'VIEW_OBSERVADORES'),
(4, 'VIEW_EMPRESAS'),
(5, 'VIEW_CIUDADANOS'),
(6, 'VIEW_USUARIOS'),
(7, 'ADD_GOVS'),
(8, 'EDIT_GOVS'),
(9, 'ADD_LICITACION'),
(10, 'EDIT_LICITACION');

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
-- Estructura de tabla para la tabla `textos`
--

CREATE TABLE IF NOT EXISTS `textos` (
  `code` varchar(90) NOT NULL,
  `descripcion` varchar(190) NOT NULL,
  `texto` text NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_gobierno`
--

CREATE TABLE IF NOT EXISTS `usuario_gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_gobierno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_gobierno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;
--
-- Filtros para la tabla `licitacion`
--
ALTER TABLE `licitacion`
  ADD CONSTRAINT `licitacion_ibfk_1` FOREIGN KEY (`gobierno_id`) REFERENCES `gobierno` (`id`);

CREATE TABLE `datos_publicar` (`id` int(11) NOT NULL AUTO_INCREMENT,
 `titulo` varchar(120) NOT NULL, `descripcion` text NOT NULL,  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

INSERT INTO `pactointegridad`.`datos_publicar` (`id`, `titulo`, `descripcion`) 
  VALUES 
  (NULL, 'Ultimo balance Anual', 'Fichero adjunto en formato PDF con el ultimo balance aprobado completo'), 
  (NULL, 'Estatuto social', 'Archivo PDF adjunto con los estatutos de la sociedad'),
  (NULL, 'Ultimo informe de auditores', 'Archivo adjunto en PDF con el último informe de auditores'), 
  (NULL, 'Organo de administración', 'Archivo adjunto PDF con la nómina actual de los miembros del órgano de administracion');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
