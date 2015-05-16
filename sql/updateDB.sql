/* 2015 04 22 (? aprox)
CREATE TABLE IF NOT EXISTS `textos` (
  `code` varchar(90) NOT NULL,
  `descripcion` varchar(190) NOT NULL,
  `texto` text NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('MedusApp-para-Empresas', 'MedusApp para Empresas', '<p>\r\n	Explicaci&oacute;n de <strong>MedusApp</strong> para empresas.</p>\r\n<p>\r\n	Se puede <a href="http://aplicar.com">aplicar</a> formato</p>\r\n'),
('MedusApp-para-Municipios', 'MedusApp para Municipios', '<p>\r\n	Explicaci&oacute;n de&nbsp;<strong>MedusApp</strong> para Municipios.</p>\r\n<p>\r\n	Se pueden usar formatos a gusto</p>\r\n');
*/ 

-- 2015-04-27 (aprox)
INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('invitacion-registro-empresas', 'Registro de empresas', 
	'<p>\r\n	Registrar su empresa en MedusApp la habilita para la presentaci&oacute;n en las licitaciones p&uacute;blicas que este sistema administre.</p>\r\n<p>\r\n	Este registro es obligatorio y requiere una validaci&oacute;n externa a este sistema para la aceptaci&oacute;n formal en este sistema.&nbsp;</p>\r\n');

-- 2015-05-02
ALTER TABLE `empresa` ADD `status` INT(5) NOT NULL , ADD INDEX (`status`) ;

-- 2015-05-03
TRUNCATE TABLE `empresa`; -- prepare for non duplicated keys
ALTER TABLE `empresa`  ADD `cuit` VARCHAR(90) NOT NULL ,  ADD `email` VARCHAR(90) NOT NULL ,  
	ADD `responsable_nombre` VARCHAR(90) NOT NULL ,  
	ADD `responsable_apellido` VARCHAR(90) NOT NULL ,  
	ADD   UNIQUE  (`cuit`, `email`) ;

ALTER TABLE `empresa` ADD `pais` VARCHAR(90) NOT NULL ;

INSERT INTO empresa (nombre, status, cuit, email, responsable_nombre, responsable_apellido, pais) 
	VALUES ('empresa 1', '0', '2387e2387e782', 'jijis@gmail.com', 'juan', 'perez', 'Argentina');

CREATE TABLE `datos_publicar` (`id` int(11) NOT NULL AUTO_INCREMENT,
 `titulo` varchar(120) NOT NULL, `descripcion` text NOT NULL,  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

INSERT INTO `pactointegridad`.`datos_publicar` (`id`, `titulo`, `descripcion`) 
	VALUES 
	(NULL, 'Ultimo balance Anual', 'Fichero adjunto en formato PDF con el ultimo balance aprobado completo'), 
	(NULL, 'Estatuto social', 'Archivo PDF adjunto con los estatutos de la sociedad'),
	(NULL, 'Ultimo informe de auditores', 'Archivo adjunto en PDF con el último informe de auditores'), 
	(NULL, 'Organo de administración', 'Archivo adjunto PDF con la nómina actual de los miembros del órgano de administracion');



