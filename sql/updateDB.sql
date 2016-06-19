
 -- permitir preferencias para las licitaciones

CREATE TABLE `licitacion_preferencias` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `licitacion_id` int(11) NOT NULL,
 `preferencia` varchar(90) NOT NULL,
 `valor` varchar(160) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `licitacion_id` (`licitacion_id`),
 CONSTRAINT `licitacion_preferencias_ibfk_1` FOREIGN KEY (`licitacion_id`) REFERENCES `licitacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

