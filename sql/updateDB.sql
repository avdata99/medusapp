-- left here new sql quries for update the producction server
-- BE CAREFUL

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
('developed_by_url', 'http://www.ucc.edu.ar/portalnuevo/paginaspopup/fichaProyectosSivPublica.php?hash=ba97718297fae089e297ec7f0e6353f4'),
('facebook_account', 'medusaapp'),
('mailchimp_action_url', '//medusapp.us10.list-manage.com/subscribe/post?u=7f72f6878941580f6affb71a0&amp;id=2d22ce24ef'),
('mail_show', 'info@medusapp.org'),
('twitter_account', '@medusapp');
