 -- 26/12/2015 permitir editar licitaciones a observadores
INSERT INTO `permiso_rol` (`id`, `id_permiso`, `id_rol`) VALUES (NULL, '10', '3');

 -- 26/12/2015 permitir doc de cierre al observador
 ALTER TABLE `licitacion` 
 	ADD `cierre_observador_txt` TEXT NULL 
 	, ADD `cierre_observador_url` VARCHAR(190) NULL ;
