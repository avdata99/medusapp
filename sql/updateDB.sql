-- left here new sql quries for update the producction server
-- BE CAREFUL

/* 
CREATE TABLE datos_publicar (`id` int(11) NOT NULL AUTO_INCREMENT,
 `titulo` varchar(120) NOT NULL, `descripcion` text NOT NULL,  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO datos_publicar (`id`, `titulo`, `descripcion`) 
  VALUES 
  (NULL, 'Ultimo balance Anual', 'Fichero adjunto en formato PDF con el ultimo balance aprobado completo'), 
  (NULL, 'Estatuto social', 'Archivo PDF adjunto con los estatutos de la sociedad'),
  (NULL, 'Ultimo informe de auditores', 'Archivo adjunto en PDF con el último informe de auditores'), 
  (NULL, 'Organo de administración', 'Archivo adjunto PDF con la nómina actual de los miembros del órgano de administracion');


CREATE TABLE IF NOT EXISTS `social` (
  `social_name` varchar(90) NOT NULL,
  `social_value` varchar(190) NOT NULL,
  UNIQUE KEY `social_name` (`social_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `social`
--

INSERT INTO social (`social_name`, `social_value`) VALUES
('developed_by_txt', 'el Observatorio de Políticas Públicas de la Universidad Católica de Córdoba'),
('developed_by_url', 'http://www.ucc.edu.ar/portalnuevo/paginaspopup/fichaProyectosSivPublica.php?hash=ba97718297fae089e297ec7f0e6353f4'),
('facebook_account', 'medusaapp'),
('mailchimp_action_url', '//medusapp.us10.list-manage.com/subscribe/post?u=7f72f6878941580f6affb71a0&amp;id=2d22ce24ef'),
('mail_show', 'info@medusapp.org'),
('twitter_account', '@medusapp');

*/

CREATE TABLE `licitacion_datos_pedidos` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_licitacion` int(11) NOT NULL,
 `id_dato_pedido` int(11) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `id_licitacion` (`id_licitacion`,`id_dato_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `licitacion_datos_entregados` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_licitacion` int(11) NOT NULL,
 `id_dato_pedido` int(11) NOT NULL,
 `id_empresa` int(11) NOT NULL,
 `status` int(11) NOT NULL DEFAULT '0',
 `url` varchar(220) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `id_licitacion` (`id_licitacion`,`id_dato_pedido`,`id_empresa`),
 KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE  `licitacion` ADD  `observador_id` INT NOT NULL ,
ADD INDEX (  `observador_id` ) ;

CREATE TABLE IF NOT EXISTS `empresa_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `empresa_status` (`id`, `estado`) VALUES
(1, 'Nueva'),
(2, 'Suspendida'),
(3, 'No aprobada'),
(4, 'Activa');

CREATE TABLE IF NOT EXISTS `licitacion_postulacion_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `licitacion_postulacion_status` (`id`, `estado`) VALUES
(1, 'Solcitado'),
(2, 'Rechazado'),
(3, 'Aceptado');

	
CREATE TABLE `licitacion_postulaciones` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_licitacion` int(11) NOT NULL,
 `id_empresa` int(11) NOT NULL,
 `status` int(11) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `id_licitacion` (`id_licitacion`,`id_empresa`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `licitacion_datos_entregados_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;


INSERT INTO `licitacion_datos_entregados_status` (`id`, `estado`) VALUES
(1, 'Nuevo'),
(2, 'Rechazado'),
(3, 'No aplicable a la empresa'),
(4, 'Aprovado'),
(5, 'En estudio');

INSERT INTO `pactointegridad`.`permiso` (`id`, `nombre`) VALUES 
(NULL, 'VIEW_POSTULACIONES'), (NULL, 'EDIT_POSTULACIONES'), (NULL, 'ADD_POSTULACIONES');

drop table `usuario_gobierno`;

CREATE TABLE IF NOT EXISTS `usuario_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_observador` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_gobiernos`
--

CREATE TABLE IF NOT EXISTS `usuario_gobiernos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_gobierno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_gobierno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

ALTER TABLE `observador` CHANGE `nombre` `nombre` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

INSERT INTO `pactointegridad`.`rol` (`id`, `nombre`) VALUES (NULL, 'OBS_ADMIN'), (NULL, 'EMP_ADMIN');
INSERT INTO `pactointegridad`.`permiso_rol` (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '4', '4');
INSERT INTO `pactointegridad`.`permiso_rol` (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '3', '3');








