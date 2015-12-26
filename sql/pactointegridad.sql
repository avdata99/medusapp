-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-12-2015 a las 19:35:32
-- Versión del servidor: 5.5.46-cll
-- Versión de PHP: 5.4.31

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE IF NOT EXISTS `ciudadano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_publicar`
--

CREATE TABLE IF NOT EXISTS `datos_publicar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titulo` (`titulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `datos_publicar`
--

INSERT INTO `datos_publicar` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Ultimo balance Anual', 'Fichero adjunto en formato PDF con el ultimo balance aprobado completo'),
(2, 'Estatuto social', 'Archivo PDF adjunto con los estatutos de la sociedad'),
(3, 'Ultimo informe de auditores', 'Archivo adjunto en PDF con el último informe de auditores'),
(4, 'Organo de administración', 'Archivo adjunto PDF con la nómina actual de los miembros del órgano de administracion'),
(5, 'Antecedentes en el rubro', 'Documento con antecedentes de la empresa en el rubro de esta licitación.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_status`
--

CREATE TABLE IF NOT EXISTS `empresa_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `empresa_status`
--

INSERT INTO `empresa_status` (`id`, `estado`) VALUES
(1, 'Nueva'),
(2, 'Suspendida'),
(3, 'No aprobada'),
(4, 'Activa');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gobierno`
--

CREATE TABLE IF NOT EXISTS `gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

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
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `observador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `website_licitacion_7a0809aa` (`gobierno_id`),
  KEY `observador_id` (`observador_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_datos_entregados`
--

CREATE TABLE IF NOT EXISTS `licitacion_datos_entregados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_licitacion_dato_pedido` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `url` varchar(220) NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `duplik` (`id_licitacion_dato_pedido`,`id_empresa`),
  KEY `status` (`status`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_datos_entregados_status`
--

CREATE TABLE IF NOT EXISTS `licitacion_datos_entregados_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `licitacion_datos_entregados_status`
--

INSERT INTO `licitacion_datos_entregados_status` (`id`, `estado`) VALUES
(1, 'No entregado'),
(2, 'Esperando aprobacion'),
(3, 'En analisis'),
(4, 'Rechazado'),
(5, 'Aprobado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_datos_pedidos`
--

CREATE TABLE IF NOT EXISTS `licitacion_datos_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_licitacion` int(11) NOT NULL,
  `id_dato_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idpuk_902` (`id_dato_pedido`,`id_licitacion`),
  KEY `id_licitacion` (`id_licitacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_postulaciones`
--

CREATE TABLE IF NOT EXISTS `licitacion_postulaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_licitacion` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_licitacion_2` (`id_licitacion`,`id_empresa`),
  KEY `status` (`status`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_postulacion_status`
--

CREATE TABLE IF NOT EXISTS `licitacion_postulacion_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `licitacion_postulacion_status`
--

INSERT INTO `licitacion_postulacion_status` (`id`, `estado`) VALUES
(1, 'Solcitado'),
(2, 'Rechazado'),
(3, 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_salas`
--

CREATE TABLE IF NOT EXISTS `licitacion_salas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licitacion_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `licitacion_id` (`licitacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion_sala_chat`
--

CREATE TABLE IF NOT EXISTS `licitacion_sala_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licitacion_salas_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `perfil_tipo` varchar(30) NOT NULL,
  `perfil_nombre` varchar(190) NOT NULL,
  `momento` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `licitacion_salas_id` (`licitacion_salas_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observador`
--

CREATE TABLE IF NOT EXISTS `observador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `descripcion` text CHARACTER SET utf8,
  `documento_url` varchar(190) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observador_status`
--

CREATE TABLE IF NOT EXISTS `observador_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `observador_status`
--

INSERT INTO `observador_status` (`id`, `estado`) VALUES
(1, 'Nuevo'),
(2, 'Suspendido'),
(3, 'No aprobado'),
(4, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=18 ;

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
(10, 'EDIT_LICITACION'),
(11, 'VIEW_POSTULACIONES'),
(12, 'EDIT_POSTULACIONES'),
(13, 'ADD_POSTULACIONES'),
(14, 'ADD_EMPS'),
(15, 'EDIT_EMPS'),
(16, 'ADD_OBSS'),
(17, 'EDIT_OBSS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_rol`
--

CREATE TABLE IF NOT EXISTS `permiso_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_permiso_2` (`id_permiso`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

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
(12, 10, 1),
(13, 4, 4),
(14, 3, 3),
(15, 17, 3),
(16, 15, 4),
(17, 8, 2),
(18, 9, 2),
(19, 10, 2),
(20, 2, 4),
(21, 13, 4),
(22, 11, 4),
(23, 11, 2),
(24, 12, 2),
(25, 11, 2),
(26, 12, 2),
(27, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'FULL_ADMIN'),
(2, 'GOV_ADMIN'),
(3, 'OBS_ADMIN'),
(4, 'EMP_ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social`
--

CREATE TABLE IF NOT EXISTS `social` (
  `social_name` varchar(90) NOT NULL,
  `social_value` varchar(190) NOT NULL,
  UNIQUE KEY `social_name` (`social_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `social`
--

INSERT INTO `social` (`social_name`, `social_value`) VALUES
('developed_by_txt', 'el Observatorio de Políticas Públicas de la Universidad Católica de Córdoba'),
('developed_by_url', 'http://www.uccor.edu.ar/portalnuevo/paginaspopup/fichaProyectosSivPublica.php?hash=ba97718297fae089e297ec7f0e6353f4'),
('facebook_account', 'medusaapp'),
('mailchimp_action_url', '//medusapp.us10.list-manage.com/subscribe/post?u=7f72f6878941580f6affb71a0&amp;id=2d22ce24ef'),
('mail_show', 'info@medusapp.org'),
('twitter_account', '@medusapp');

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

--
-- Volcado de datos para la tabla `textos`
--

INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('MedusApp-para-Empresas', 'MedusApp para Empresas', '<p>\r\n	Explicaci&oacute;n de <strong>MedusApp</strong> para empresas.</p>\r\n<p>\r\n	Se puede <a href="http://aplicar.com">aplicar</a> formato</p>\r\n'),
('MedusApp-para-Municipios', 'MedusApp para Municipios', '<p>\r\n	Explicaci&oacute;n de&nbsp;<strong>MedusApp</strong> para Municipios.</p>\r\n<p>\r\n	Se pueden usar formatos a gusto</p>\r\n'),
('que-es', '¿Qué es Medusapp?', '<div>\r\n	Medusapp es una app para los gobiernos locales que permite realizar acuerdos pr&aacute;cticos de &ldquo;informaci&oacute;n abierta&rdquo; entre las empresas que se presentan a una licitaci&oacute;n p&uacute;blica.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	De esta forma no s&oacute;lo los gobiernos asumen la responsabilidad de abrir informaci&oacute;n sobre compras p&uacute;blicas sino que, de manera voluntaria y equitativa, tambi&eacute;n las empresas se comprometen con la transparencia.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<div>\r\n		<strong>&iquest;Quienes impulsan Medusapp?</strong></div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		Medusapp es un desarrollo impulsado por el Observatorio de Pol&iacute;ticas P&uacute;blicas de la Universidad Cat&oacute;lica de C&oacute;rdoba y el Centro de &Eacute;tica Edmond J. Safra de la Universidad de Harvard.</div>\r\n	<div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<strong>Objetivos de Medusapp</strong></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			1. Promover la responsabilidad de las empresas con la transparencia de los procesos de compras p&uacute;blicas en los que participan</div>\r\n		<div>\r\n			2. Brindar una herramienta voluntaria, que se adapta a diferentes marcos legales municipales</div>\r\n		<div>\r\n			3. Brindar una herramienta equitativa de cooperaci&oacute;n condicional, que fomenta la negociaci&oacute;n y el consenso pr&aacute;ctico sobre la transparencia de las compras p&uacute;blicas.</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n'),
('ventajas', 'Ventajas', '<div>\r\n	<strong>Para los Gobiernos&nbsp;</strong></div>\r\n<div>\r\n	Logra compromiso del sector privado en abrir informaci&oacute;n, fortaleciendo la responsabilidad compartida.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>Para las empresas</strong></div>\r\n<div>\r\n	Adquiere confianza en el proceso de compras p&uacute;blicas, al visualizar compromisos equitativos de las empresas que participan en el proceso.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>Para la Sociedad Civil</strong></div>\r\n<div>\r\n	Puede acceder ycontrolar informaci&oacute;n directamente abierta por empresas.</div>\r\n');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`) VALUES
(1, 'Admin user', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empresas`
--

CREATE TABLE IF NOT EXISTS `usuario_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_observador` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_gobiernos`
--

CREATE TABLE IF NOT EXISTS `usuario_gobiernos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_gobierno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gobierno` (`id_gobierno`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_observadores`
--

CREATE TABLE IF NOT EXISTS `usuario_observadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_observador` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_observador` (`id_observador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

INSERT INTO `usuario_rol` (`id`, `id_usuario`, `id_rol`) VALUES (NULL, '1', '1');

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`status`) REFERENCES `empresa_status` (`id`);

--
-- Filtros para la tabla `licitacion`
--
ALTER TABLE `licitacion`
  ADD CONSTRAINT `licitacion_ibfk_1` FOREIGN KEY (`gobierno_id`) REFERENCES `gobierno` (`id`),
  ADD CONSTRAINT `licitacion_ibfk_225` FOREIGN KEY (`observador_id`) REFERENCES `observador` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `licitacion_datos_entregados`
--
ALTER TABLE `licitacion_datos_entregados`
  ADD CONSTRAINT `licitacion_datos_entregados_ibfk_6` FOREIGN KEY (`id_licitacion_dato_pedido`) REFERENCES `licitacion_datos_pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `licitacion_datos_entregados_ibfk_7` FOREIGN KEY (`status`) REFERENCES `licitacion_datos_entregados_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `licitacion_datos_entregados_ibfk_8` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `licitacion_datos_pedidos`
--
ALTER TABLE `licitacion_datos_pedidos`
  ADD CONSTRAINT `licitacion_datos_pedidos_ibfk_2` FOREIGN KEY (`id_dato_pedido`) REFERENCES `datos_publicar` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `licitacion_datos_pedidos_ibfk_3` FOREIGN KEY (`id_licitacion`) REFERENCES `licitacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `licitacion_postulaciones`
--
ALTER TABLE `licitacion_postulaciones`
  ADD CONSTRAINT `licitacion_postulaciones_ibfk_1` FOREIGN KEY (`id_licitacion`) REFERENCES `licitacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `licitacion_postulaciones_ibfk_3` FOREIGN KEY (`status`) REFERENCES `licitacion_postulacion_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `licitacion_postulaciones_ibfk_4` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `licitacion_salas`
--
ALTER TABLE `licitacion_salas`
  ADD CONSTRAINT `licitacion_salas_ibfk_1` FOREIGN KEY (`licitacion_id`) REFERENCES `licitacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `licitacion_sala_chat`
--
ALTER TABLE `licitacion_sala_chat`
  ADD CONSTRAINT `licitacion_sala_chat_ibfk_1` FOREIGN KEY (`licitacion_salas_id`) REFERENCES `licitacion_salas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `licitacion_sala_chat_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `observador`
--
ALTER TABLE `observador`
  ADD CONSTRAINT `observador_ibfk_1` FOREIGN KEY (`status`) REFERENCES `observador_status` (`id`);

--
-- Filtros para la tabla `permiso_rol`
--
ALTER TABLE `permiso_rol`
  ADD CONSTRAINT `permiso_rol_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permiso_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_empresas`
--
ALTER TABLE `usuario_empresas`
  ADD CONSTRAINT `usuario_empresas_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_empresas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_gobiernos`
--
ALTER TABLE `usuario_gobiernos`
  ADD CONSTRAINT `usuario_gobiernos_ibfk_2` FOREIGN KEY (`id_gobierno`) REFERENCES `gobierno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_gobiernos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_observadores`
--
ALTER TABLE `usuario_observadores`
  ADD CONSTRAINT `usuario_observadores_ibfk_2` FOREIGN KEY (`id_observador`) REFERENCES `observador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_observadores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `usuario_rol_ibfk_23` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_13` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
