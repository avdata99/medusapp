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

