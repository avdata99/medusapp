--
-- Volcado de datos para la tabla `datos_publicar`
--

INSERT INTO `datos_publicar` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Ultimo balance Anual', 'Fichero adjunto en formato PDF con el ultimo balance aprobado completo'),
(2, 'Estatuto social', 'Archivo PDF adjunto con los estatutos de la sociedad'),
(3, 'Ultimo informe de auditores', 'Archivo adjunto en PDF con el último informe de auditores'),
(4, 'Organo de administración', 'Archivo adjunto PDF con la nómina actual de los miembros del órgano de administracion'),
(5, 'Antecedentes en el rubro', 'Documento con antecedentes de la empresa en el rubro de esta licitación.');

--
-- Volcado de datos para la tabla `empresa_status`
--

INSERT INTO `empresa_status` (`id`, `estado`) VALUES
(1, 'Nueva'),
(2, 'Suspendida'),
(3, 'No aprobada'),
(4, 'Activa');

--
-- Volcado de datos para la tabla `licitacion_datos_entregados_status`
--

INSERT INTO `licitacion_datos_entregados_status` (`id`, `estado`) VALUES
(1, 'No entregado'),
(2, 'Esperando aprobacion'),
(3, 'En analisis'),
(4, 'Rechazado'),
(5, 'Aprobado');

--
-- Volcado de datos para la tabla `licitacion_postulacion_status`
--

INSERT INTO `licitacion_postulacion_status` (`id`, `estado`) VALUES
(1, 'Solcitado'),
(2, 'Rechazado'),
(3, 'Aceptado');

--
-- Volcado de datos para la tabla `notificaciones_status`
--

INSERT INTO `notificaciones_status` (`id`, `estado`) VALUES
(1, 'Nueva'),
(2, 'Leida'),
(3, 'Eliminada'),
(4, 'Archivada');

--
-- Volcado de datos para la tabla `observador_status`
--

INSERT INTO `observador_status` (`id`, `estado`) VALUES
(1, 'Nuevo'),
(2, 'Suspendido'),
(3, 'No aprobado'),
(4, 'Activo');

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `pais`) VALUES
(1, 'Argentina'),
(2, 'Chile');

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

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'FULL_ADMIN'),
(2, 'GOV_ADMIN'),
(3, 'OBS_ADMIN'),
(4, 'EMP_ADMIN');

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
(27, 2, 3),
(28, 10, 3),
(29, 10, 3);

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

--
-- Volcado de datos para la tabla `textos`
--

INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('MedusApp-para-Empresas', 'MedusApp para Empresas', '<p>\r\n Explicaci&oacute;n de <strong>MedusApp</strong> para empresas.</p>\r\n<p>\r\n Se puede <a href="http://aplicar.com">aplicar</a> formato</p>\r\n'),
('MedusApp-para-Municipios', 'MedusApp para Municipios', '<p>\r\n Explicaci&oacute;n de&nbsp;<strong>MedusApp</strong> para Municipios.</p>\r\n<p>\r\n  Se pueden usar formatos a gusto</p>\r\n'),
('que-es', '¿Qué es Medusapp?', '<div>\r\n  Medusapp es una app para los gobiernos locales que permite realizar acuerdos pr&aacute;cticos de &ldquo;informaci&oacute;n abierta&rdquo; entre las empresas que se presentan a una licitaci&oacute;n p&uacute;blica.</div>\r\n<div>\r\n  &nbsp;</div>\r\n<div>\r\n De esta forma no s&oacute;lo los gobiernos asumen la responsabilidad de abrir informaci&oacute;n sobre compras p&uacute;blicas sino que, de manera voluntaria y equitativa, tambi&eacute;n las empresas se comprometen con la transparencia.</div>\r\n<div>\r\n &nbsp;</div>\r\n<div>\r\n <div>\r\n   <strong>&iquest;Quienes impulsan Medusapp?</strong></div>\r\n <div>\r\n   &nbsp;</div>\r\n  <div>\r\n   Medusapp es un desarrollo impulsado por el Observatorio de Pol&iacute;ticas P&uacute;blicas de la Universidad Cat&oacute;lica de C&oacute;rdoba y el Centro de &Eacute;tica Edmond J. Safra de la Universidad de Harvard.</div>\r\n <div>\r\n   <div>\r\n     &nbsp;</div>\r\n    <div>\r\n     <strong>Objetivos de Medusapp</strong></div>\r\n    <div>\r\n     &nbsp;</div>\r\n    <div>\r\n     1. Promover la responsabilidad de las empresas con la transparencia de los procesos de compras p&uacute;blicas en los que participan</div>\r\n    <div>\r\n     2. Brindar una herramienta voluntaria, que se adapta a diferentes marcos legales municipales</div>\r\n    <div>\r\n     3. Brindar una herramienta equitativa de cooperaci&oacute;n condicional, que fomenta la negociaci&oacute;n y el consenso pr&aacute;ctico sobre la transparencia de las compras p&uacute;blicas.</div>\r\n </div>\r\n</div>\r\n<p>\r\n &nbsp;</p>\r\n'),
('ventajas', 'Ventajas', '<div>\r\n <strong>Para los Gobiernos&nbsp;</strong></div>\r\n<div>\r\n  Logra compromiso del sector privado en abrir informaci&oacute;n, fortaleciendo la responsabilidad compartida.</div>\r\n<div>\r\n  &nbsp;</div>\r\n<div>\r\n <strong>Para las empresas</strong></div>\r\n<div>\r\n Adquiere confianza en el proceso de compras p&uacute;blicas, al visualizar compromisos equitativos de las empresas que participan en el proceso.</div>\r\n<div>\r\n &nbsp;</div>\r\n<div>\r\n <strong>Para la Sociedad Civil</strong></div>\r\n<div>\r\n  Puede acceder ycontrolar informaci&oacute;n directamente abierta por empresas.</div>\r\n');

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`) VALUES
(1, 'Admin user', 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Restricciones para tablas volcadas
--

INSERT INTO `usuario_rol` (`id`, `id_usuario`, `id_rol`) VALUES (NULL, '1', '1');
