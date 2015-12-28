 -- 26/12/2015 permitir editar licitaciones a observadores
INSERT INTO `permiso_rol` (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '10', '3');

 -- 26/12/2015 permitir doc de cierre al observador
 ALTER TABLE `licitacion` 
 	ADD `cierre_observador_txt` TEXT NULL 
 	, ADD `cierre_observador_url` VARCHAR(190) NULL ;

 -- 27/12/2015 Crear la tabla de notificaciones
 CREATE TABLE `notificaciones` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `titulo` varchar(120) NOT NULL,
 `descripcion` text NOT NULL,
 `url` varchar(190) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notificaciones` ADD `user_id` INT NOT NULL AFTER `id`, ADD INDEX (`user_id`) ;
ALTER TABLE `notificaciones` ADD FOREIGN KEY (`user_id`) REFERENCES `pactointegridad`.`usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `notificaciones` ADD `status` INT NOT NULL , ADD INDEX (`status`) ;

CREATE TABLE IF NOT EXISTS `notificaciones_status` (
  `id` int(11) NOT NULL,
  `estado` varchar(35) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `notificaciones_status` (`id`, `estado`) VALUES
(1, 'Nueva'), (2, 'Leida'), (3, 'Eliminada'), (4, 'Archivada');

 -- 27/12/2015 agregar uid (slug) para que los gobiernos tengan su URL
ALTER TABLE `gobierno` 
 	ADD `uid` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
 	ADD UNIQUE (`uid`) ;
ALTER TABLE `gobierno` ADD `created_at` DATETIME NOT NULL ;

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL,
  `pais` varchar(120) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pais` (`id`, `pais`) VALUES
(1, 'Argentina'),
(2, 'Chile');

ALTER TABLE `gobierno` ADD `pais_id` INT NOT NULL DEFAULT '1' AFTER `id`, ADD INDEX (`pais_id`) ;

ALTER TABLE `gobierno` ADD `texto_presentacion` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `uid`;
ALTER TABLE `gobierno` ADD `logo` VARCHAR(190) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `texto_presentacion`;


CREATE TABLE `eventos` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `licitacion_id` INT NOT NULL, 
 `titulo` varchar(120) NOT NULL,
 `descripcion` text NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `eventos` ADD INDEX (`licitacion_id`) ;

ALTER TABLE `eventos` 
	ADD FOREIGN KEY (`licitacion_id`) 
	REFERENCES `pactointegridad`.`licitacion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE `eventos` ADD `fecha` DATETIME NOT NULL ;