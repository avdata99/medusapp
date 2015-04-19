-- phpMyAdmin SQL Dump
-- version 4.1.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-04-2015 a las 19:37:44
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pactointegridad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_logs`
--

CREATE TABLE IF NOT EXISTS `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` tinyint(1) NOT NULL,
  `response_code` smallint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Volcado de datos para la tabla `api_logs`
--

INSERT INTO `api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1429321496, 0.589975, 1, 200),
(2, 'api/example/users/format/json', 'get', 'a:1:{s:6:"format";s:4:"json";}', '', '127.0.0.1', 1429321505, 0.376095, 1, 200),
(3, 'api/example/users/format/html', 'get', 'a:1:{s:6:"format";s:4:"html";}', '', '127.0.0.1', 1429321510, 0.443675, 1, 200),
(4, 'api/example/users/formatcsv', 'get', 'a:1:{s:9:"formatcsv";N;}', '', '127.0.0.1', 1429321541, 0.368748, 1, 200),
(5, 'api/example/users/format/csv', 'get', 'a:1:{s:6:"format";s:3:"csv";}', '', '127.0.0.1', 1429321544, 0.47077, 1, 200),
(6, 'api/example/users/format/json', 'get', 'a:1:{s:6:"format";s:4:"json";}', '', '127.0.0.1', 1429321559, 0.383015, 1, 200),
(7, 'api/example/users/format/html', 'get', 'a:1:{s:6:"format";s:4:"html";}', '', '127.0.0.1', 1429321676, 0.442814, 1, 200),
(8, 'api/example/users/format/php', 'get', 'a:1:{s:6:"format";s:3:"php";}', '', '127.0.0.1', 1429321718, 0.404388, 1, 200),
(9, 'api/example/users/format/array', 'get', 'a:1:{s:6:"format";s:5:"array";}', '', '127.0.0.1', 1429321723, 0.402471, 1, 200),
(10, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1429321771, 0.486147, 1, 200),
(11, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1429321772, 0.265714, 1, 200),
(12, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429322157, 0.777183, 1, 0),
(13, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429322173, 0.134183, 1, 0),
(14, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429322253, 0.254704, 1, 0),
(15, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429322273, 0.167818, 1, 200),
(16, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429365861, 0.20875, 1, 200),
(17, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429372374, 0.173571, 1, 200),
(18, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429375378, 0.493474, 1, 200),
(19, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429375426, 0.292835, 1, 200),
(20, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429375485, 0.208628, 1, 200),
(21, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429375589, 0.266657, 1, 200),
(22, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429375997, 0.189668, 1, 200),
(23, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376204, 0.228909, 1, 200),
(24, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376217, 0.22, 1, 200),
(25, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376303, 0.170211, 1, 200),
(26, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376339, 0.2195, 1, 200),
(27, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376690, 0.263094, 1, 200),
(28, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376710, 0.195785, 1, 200),
(29, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429376869, 0.210606, 1, 200),
(30, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387578, 0.251713, 1, 200),
(31, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387785, 0.163116, 1, 200),
(32, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387804, 0.222688, 1, 200),
(33, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387805, 0.269962, 1, 200),
(34, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387805, 0.224628, 1, 200),
(35, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387807, 0.221844, 1, 200),
(36, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429387918, 0.187949, 1, 200),
(37, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429388017, 0.186451, 1, 200),
(38, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429388022, 0.17996, 1, 200),
(39, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429388072, 0.354957, 1, 200),
(40, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429389023, 0.218368, 1, 200),
(41, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429389535, 0.293457, 1, 200),
(42, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429402378, 0.616324, 1, 200),
(43, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429402639, 0.276825, 1, 200),
(44, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429402725, 0.233664, 1, 200),
(45, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429402757, 0.268405, 1, 200),
(46, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429402925, 0.238076, 1, 200),
(47, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403274, 0.232457, 1, 200),
(48, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403293, 0.33606, 1, 200),
(49, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403320, 0.255739, 1, 200),
(50, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403357, 0.259663, 1, 200),
(51, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403554, 0.443743, 1, 200),
(52, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403558, 0.240714, 1, 200),
(53, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429403791, 0.269222, 1, 200),
(54, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429404425, 0.477657, 1, 200),
(55, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429404426, 0.484654, 1, 200),
(56, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429404435, 0.249396, 1, 200),
(57, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405622, 0.269427, 1, 200),
(58, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405641, 0.479725, 1, 200),
(59, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405663, 0.205994, 1, 200),
(60, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405705, 0.311236, 1, 200),
(61, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405767, 0.211087, 1, 200),
(62, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405788, 0.212668, 1, 200),
(63, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405816, 0.20592, 1, 200),
(64, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405842, 0.240383, 1, 200),
(65, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405867, 0.246707, 1, 200),
(66, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429405924, 0.247657, 1, 200),
(67, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429406115, 0.170609, 1, 200),
(68, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429456591, 0.184774, 1, 200),
(69, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429456600, 0.203088, 1, 200),
(70, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429456624, 0.337372, 1, 200),
(71, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429456836, 0.171063, 1, 200),
(72, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480584, 0.275059, 1, 200),
(73, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480645, 0.334424, 1, 200),
(74, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480654, 0.169329, 1, 200),
(75, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480772, 0.268984, 1, 200),
(76, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480782, 0.411141, 1, 200),
(77, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480794, 0.216348, 1, 200),
(78, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480836, 0.222135, 1, 200),
(79, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480846, 0.46343, 1, 200),
(80, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429480985, 0.230581, 1, 200),
(81, 'api/licitaciones', 'get', NULL, '', '127.0.0.1', 1429481958, 0.203288, 1, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE IF NOT EXISTS `ciudadano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`id`, `nombre`) VALUES
(1, 'Ciudadano 001'),
(2, 'ciudadano 002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0676828c606c02711bd06ca313cc709292bb17ba', '127.0.0.1', 1429321772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393332313637363b),
('0a46f502b05235a86929076eaa8a179b83c739b0', '127.0.0.1', 1429482680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393438323631333b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('1356d1d0ac67bbf67e886cff0e58201399a6073d', '127.0.0.1', 1429365861, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393336353836313b),
('1975cff2630eac7e7d445361f87e7a1a0f387b23', '127.0.0.1', 1429481958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393438313935323b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('2302455c862a9f328f32136e6067f5d447759ae0', '127.0.0.1', 1429406116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393430343932303b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('48762e89eebbdab614892805f016b99cef5e3bcd', '127.0.0.1', 1429314221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393331343232303b),
('62bb2ce201948bc0a70b4e5e34f58a764f4e0daf', '127.0.0.1', 1429375976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393337353637383b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('7db09fdb4ae59c20921d8ca06bd6208823e02ffb', '127.0.0.1', 1429269175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393236393130313b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('a4b4d2ac58a9a3a3189cd62fdb78f5c971809da1', '127.0.0.1', 1429320779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393332303737393b),
('a64db565db55f0b25eb5984293fd64dbde7ee284', '127.0.0.1', 1429403791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393430323337383b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('b1031190eadebc3e5d3267571137c0c62253427f', '127.0.0.1', 1429376869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393337353938313b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('bed8a6807d8bb1bcfed6ccae26de3fa7c047c109', '127.0.0.1', 1429404652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393430343336343b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('c68662fcb477ed5c5be3cc5d60f5c9eff8a80bf7', '127.0.0.1', 1429321559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393332313333373b),
('c7668efc1aeb16b4cb151ad66d409e10de4d0dd3', '127.0.0.1', 1429375589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393337323337343b),
('cf97c96bd784b8b7332ce77ea64f2bb69344161b', '127.0.0.1', 1429389535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393338373335373b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('d6bc2f7a72a5407ae43ffef5e14ecfb383cc7a4e', '127.0.0.1', 1429456929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393435363932393b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('e6480be7f03b3091e0f24fa37a33980e2928412c', '127.0.0.1', 1429456836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393435363630323b757365725f6e616d657c733a31343a22416e647265732056617a7175657a223b757365725f6c6f67696e7c733a363a22616e64726573223b757365725f69647c733a313a2231223b726f6c65737c613a313a7b693a303b733a31303a2246554c4c5f41444d494e223b7d7065726d697373696f6e737c613a31303a7b693a303b733a393a22564945575f474f5653223b693a313b733a31353a22564945575f4c494349544143494f4e223b693a323b733a31373a22564945575f4f425345525641444f524553223b693a333b733a31333a22564945575f454d505245534153223b693a343b733a31353a22564945575f434955444144414e4f53223b693a353b733a31333a22564945575f5553554152494f53223b693a363b733a383a224144445f474f5653223b693a373b733a393a22454449545f474f5653223b693a383b733a31343a224144445f4c494349544143494f4e223b693a393b733a31353a22454449545f4c494349544143494f4e223b7d676f76737c613a303a7b7d676f76735f696e7c733a303a22223b),
('eeae1e141d16e6ae5ba8b3713c4dc86ce71992d7', '127.0.0.1', 1429403559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393430333535383b),
('f26e5dfaf33d87db2224ee776ed175fb650c7e22', '127.0.0.1', 1429322273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393332323135373b),
('f8fa519d1eb1d790bc5377bd925fbc6fa534d566', '127.0.0.1', 1429480985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313432393437383533333b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`) VALUES
(1, 'Empresolandia'),
(2, 'Empresa segunda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `errores`
--

CREATE TABLE IF NOT EXISTS `errores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usuario` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `error` text COLLATE utf8_spanish2_ci,
  `fecha` datetime DEFAULT NULL,
  `relevance` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gobierno`
--

CREATE TABLE IF NOT EXISTS `gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `gobierno`
--

INSERT INTO `gobierno` (`id`, `nombre`) VALUES
(1, 'Mendiolaza'),
(2, 'Unquillo'),
(3, 'Villa Allende');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licitacion`
--

CREATE TABLE IF NOT EXISTS `licitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `gobierno_id` int(11) NOT NULL,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  `detalle` longtext CHARACTER SET latin1 NOT NULL,
  `documento` varchar(190) COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` varchar(190) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `website_licitacion_7a0809aa` (`gobierno_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `licitacion`
--

INSERT INTO `licitacion` (`id`, `uid`, `gobierno_id`, `nombre`, `detalle`, `documento`, `imagen`, `fecha_inicio`, `fecha_fin`) VALUES
(2, 'algo-que-vale-mucho', 1, 'Licitacion de algo que vale mucho', '<p>\r\n	Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prueba de algo Prue</p>\r\n', '88a56-license.txt', 'c8113-saqueos.png', '2015-04-25', '2015-04-30'),
(3, 'otra-cosa', 2, 'Probando ando', '<div>\r\n	Llamado a Licitaci&oacute;n para la adquisici&oacute;n de un Cami&oacute;n, con equipo elevador, autocargador, Roll Off Sistema Cable y dos contenedores.</div>\r\n', 'e5d56-llamado-16-12-2014.pdf', 'eb8f5-captura-de-pantalla-de-2014-05-10-20:57:06.png', '2015-04-18', '2015-04-30'),
(4, 'la-cuarta', 3, 'Licita la villa', '<p>\r\n	sdf <strong>ksdfljsdf</strong></p>\r\n', '10475-logo_icda_b.jpg', '9db21-moviles-policiales.jpg', '2015-04-30', '2015-08-19'),
(5, 'la-dos', 2, 'Licita Unquillo 2', '<p>\r\n	aoijdm ad <strong>masd</strong> a</p>\r\n', '77980-logo-hardvard.png', '76710-placeholder-360x200.jpg', '2015-04-01', '2015-04-30'),
(6, 'lictacion-8', 2, 'Lictacion 8', '<p>\r\n	prueba de licitacion</p>\r\n', '', '0b778-saqueos.png', '2015-04-07', '2015-04-23'),
(7, 'licitacion-9', 3, 'Licitacion 9', '<p>\r\n	nksdjsnkdsj djk fsdjk sdf ds&nbsp;</p>\r\n', '', '1a48a-computadoras-nuevas.jpg', '2015-04-01', '2015-04-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observador`
--

CREATE TABLE IF NOT EXISTS `observador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `observador`
--

INSERT INTO `observador` (`id`, `nombre`) VALUES
(1, 'Observador 001'),
(2, 'Observador 002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=11 ;

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
(10, 'EDIT_LICITACION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_rol`
--

CREATE TABLE IF NOT EXISTS `permiso_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_permiso` (`id_permiso`,`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

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
(12, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'FULL_ADMIN'),
(2, 'GOV_ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `textos`
--

CREATE TABLE IF NOT EXISTS `textos` (
  `code` varchar(90) NOT NULL,
  `descripcion` varchar(190) NOT NULL,
  `texto` text NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `textos`
--

INSERT INTO `textos` (`code`, `descripcion`, `texto`) VALUES
('MedusApp-para-Empresas', 'MedusApp para Empresas', '<p>\r\n	Explicaci&oacute;n de <strong>MedusApp</strong> para empresas.</p>\r\n<p>\r\n	Se puede <a href="http://aplicar.com">aplicar</a> formato</p>\r\n'),
('MedusApp-para-Municipios', 'MedusApp para Municipios', '<p>\r\n	Explicaci&oacute;n de&nbsp;<strong>MedusApp</strong> para Municipios.</p>\r\n<p>\r\n	Se pueden usar formatos a gusto</p>\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `login` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(190) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`) VALUES
(1, 'Andres Vazquez', 'andres', '17e16b3561906388389cb18adcfd5b0b'),
(2, 'Mariano Mosquera', 'mariano', '814b87db965e1640a4e82d7cadb8ea92'),
(3, 'Gov Test', 'gov', '552360015f23b99978d5f1a6bd2b9c7d');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_gobierno`
--

CREATE TABLE IF NOT EXISTS `usuario_gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_gobierno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_gobierno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario_gobierno`
--

INSERT INTO `usuario_gobierno` (`id`, `id_usuario`, `id_gobierno`) VALUES
(1, 3, 1),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id`, `id_usuario`, `id_rol`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `licitacion`
--
ALTER TABLE `licitacion`
  ADD CONSTRAINT `licitacion_ibfk_1` FOREIGN KEY (`gobierno_id`) REFERENCES `gobierno` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
