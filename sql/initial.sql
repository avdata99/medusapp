INSERT INTO `ciudadano` (`id`, `nombre`) VALUES
(1, 'Ciudadano 001'),
(2, 'ciudadano 002');

INSERT INTO `empresa` (`id`, `nombre`) VALUES
(1, 'Empresa uno'),
(2, 'Empresa segunda');

INSERT INTO `gobierno` (`id`, `nombre`) VALUES
(1, 'Govierno test 1'),
(2, 'Govierno test 2'),
(3, 'Govierno test 3');

INSERT INTO `observador` (`id`, `nombre`) VALUES
(1, 'Observador 001'),
(2, 'Observador 002');

INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('MedusApp-para-Empresas', 'MedusApp para Empresas', '<p>\r\n	Explicaci&oacute;n de <strong>MedusApp</strong> para empresas.</p>\r\n<p>\r\n	Se puede <a href="http://aplicar.com">aplicar</a> formato</p>\r\n'),
('MedusApp-para-Municipios', 'MedusApp para Municipios', '<p>\r\n	Explicaci&oacute;n de&nbsp;<strong>MedusApp</strong> para Municipios.</p>\r\n<p>\r\n	Se pueden usar formatos a gusto</p>\r\n'),
('que-es', '¿Qué es Medusapp?', '<div>\r\n	Medusapp es una app para los gobiernos locales que permite realizar acuerdos pr&aacute;cticos de &ldquo;informaci&oacute;n abierta&rdquo; entre las empresas que se presentan a una licitaci&oacute;n p&uacute;blica.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	De esta forma no s&oacute;lo los gobiernos asumen la responsabilidad de abrir informaci&oacute;n sobre compras p&uacute;blicas sino que, de manera voluntaria y equitativa, tambi&eacute;n las empresas se comprometen con la transparencia.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<div>\r\n		<strong>&iquest;Quienes impulsan Medusapp?</strong></div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		Medusapp es un desarrollo impulsado por el Observatorio de Pol&iacute;ticas P&uacute;blicas de la Universidad Cat&oacute;lica de C&oacute;rdoba y el Centro de &Eacute;tica Edmond J. Safra de la Universidad de Harvard.</div>\r\n	<div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			<strong>Objetivos de Medusapp</strong></div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			1. Promover la responsabilidad de las empresas con la transparencia de los procesos de compras p&uacute;blicas en los que participan</div>\r\n		<div>\r\n			2. Brindar una herramienta voluntaria, que se adapta a diferentes marcos legales municipales</div>\r\n		<div>\r\n			3. Brindar una herramienta equitativa de cooperaci&oacute;n condicional, que fomenta la negociaci&oacute;n y el consenso pr&aacute;ctico sobre la transparencia de las compras p&uacute;blicas.</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n'),
('ventajas', 'Ventajas', '<div>\r\n	<strong>Para los Gobiernos&nbsp;</strong></div>\r\n<div>\r\n	Logra compromiso del sector privado en abrir informaci&oacute;n, fortaleciendo la responsabilidad compartida.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>Para las empresas</strong></div>\r\n<div>\r\n	Adquiere confianza en el proceso de compras p&uacute;blicas, al visualizar compromisos equitativos de las empresas que participan en el proceso.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>Para la Sociedad Civil</strong></div>\r\n<div>\r\n	Puede acceder ycontrolar informaci&oacute;n directamente abierta por empresas.</div>\r\n');

--user admin, pass admin
INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`) VALUES
(1, 'Admin user', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- usuario 1 tiene permisos de full admin
INSERT INTO `usuario_rol` (`id`, `id_usuario`, `id_rol`) VALUES
(1, 1, 1);

