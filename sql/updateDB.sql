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

INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('invitacion-registro-empresas', 'Registro de empresas', 
	'<p>\r\n	Registrar su empresa en MedusApp la habilita para la presentaci&oacute;n en las licitaciones p&uacute;blicas que este sistema administre.</p>\r\n<p>\r\n	Este registro es obligatorio y requiere una validaci&oacute;n externa a este sistema para la aceptaci&oacute;n formal en este sistema.&nbsp;</p>\r\n');
