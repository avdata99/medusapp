CREATE TABLE IF NOT EXISTS `licitacion_salas` (
  `id` int(11) NOT NULL,
  `licitacion_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `licitacion_sala_chat` (
  `id` int(11) NOT NULL,
  `licitacion_salas_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `perfil_tipo` varchar(30) NOT NULL,
  `perfil_nombre` int(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `licitacion_salas`
  ADD PRIMARY KEY (`id`), ADD KEY `licitacion_id` (`licitacion_id`);

ALTER TABLE `licitacion_sala_chat`
  ADD PRIMARY KEY (`id`), ADD KEY `licitacion_salas_id` (`licitacion_salas_id`), ADD KEY `user_id` (`user_id`);

ALTER TABLE `licitacion_salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `licitacion_sala_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `licitacion_salas`
ADD CONSTRAINT `licitacion_salas_ibfk_1` FOREIGN KEY (`licitacion_id`) REFERENCES `licitacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `licitacion_sala_chat`
ADD CONSTRAINT `licitacion_sala_chat_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`),
ADD CONSTRAINT `licitacion_sala_chat_ibfk_1` FOREIGN KEY (`licitacion_salas_id`) REFERENCES `licitacion_salas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `licitacion_sala_chat` ADD `momento` DATETIME NOT NULL ;

ALTER TABLE `licitacion_sala_chat` CHANGE `perfil_nombre` `perfil_nombre` VARCHAR(190) NOT NULL;


 -- 19/12/2015
 -- permitir a los gobiernos ver las postulaciones

INSERT INTO permiso_rol (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '11', '2');

 -- permitir a los gobiernos editar las postulaciones
INSERT INTO permiso_rol (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '12', '2');

 -- permitir a los observadores ver las licitaciones
INSERT INTO permiso_rol (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '2', '3');

 -- 2015-12-20 permitir descripcion y documento a los observadores

 ALTER TABLE `observador` 
    ADD `descripcion` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL , 
    ADD `documento_url` VARCHAR(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL ;