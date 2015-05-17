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
('MedusApp-para-Municipios', 'MedusApp para Municipios', '<p>\r\n	Explicaci&oacute;n de&nbsp;<strong>MedusApp</strong> para Municipios.</p>\r\n<p>\r\n	Se pueden usar formatos a gusto</p>\r\n');

--user admin, pass admin
INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`) VALUES
(1, 'Admin user', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- usuario 1 tiene permisos de full admin
INSERT INTO `usuario_rol` (`id`, `id_usuario`, `id_rol`) VALUES
(1, 1, 1);

