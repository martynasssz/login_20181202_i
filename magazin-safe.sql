-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.36-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for magazin
CREATE DATABASE IF NOT EXISTS `magazin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `magazin`;

-- Dumping structure for table magazin.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(254) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table magazin.log: ~16 rows (approximately)
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`id`, `time`, `message`) VALUES
	(1, '2018-11-26 18:58:57', 'Start'),
	(2, '2018-11-26 19:47:10', 'I am storing some data here.'),
	(3, '2018-11-26 19:53:12', 'I am storing some other data here.'),
	(4, '2018-11-26 19:53:54', 'I am storing some other data here.'),
	(5, '2018-11-26 19:54:29', 'I am storing some other data here.'),
	(6, '2018-11-26 19:57:02', 'I am storing some other data here.'),
	(7, '2018-11-26 19:57:15', 'I am storing some other data here.'),
	(8, '2018-11-26 19:57:29', 'I am storing some other data here.'),
	(9, '2018-11-26 20:33:49', 'I am storing some other data here.'),
	(10, '2018-11-26 20:44:28', 'I am storing some other data here.'),
	(11, '2018-11-26 20:44:45', 'I am storing some other data here.'),
	(12, '2018-11-26 20:45:29', 'I am storing some other data here.'),
	(13, '2018-11-26 20:45:56', 'I am storing some other data here.'),
	(14, '2018-11-26 20:50:30', 'I am storing some other data here.'),
	(15, '2018-11-26 20:52:52', 'I am storing some other data here.'),
	(16, '2018-11-26 20:58:55', 'I am storing some other data here.');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

-- Dumping structure for table magazin.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `price` decimal(8,2) DEFAULT NULL,
  `image` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table magazin.products: ~9 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `title`, `description`, `price`, `image`) VALUES
	(1, 'Milk', 'Fat milk, 2L', 3.00, NULL),
	(3, 'Water', '3L', 1.50, NULL),
	(4, 'Duona', 'Skani', 88.00, NULL),
	(5, 'asdfasdf', 'asdfasdf', 0.00, NULL),
	(6, 'Cool game', 'awesome', 99.00, NULL),
	(7, 'Cool game', 'awesome', 99.00, NULL),
	(8, 't', 'd', 44.00, NULL),
	(9, 't', 'd', 44.00, 'circarrow.png'),
	(10, 't', 'd', 44.00, 'circarrow.png'),
	(11, 't', 'd', 44.00, '1542043329_circarrow.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table magazin.product_list
CREATE TABLE IF NOT EXISTS `product_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `title` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `price` decimal(6,2) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table magazin.product_list: ~2 rows (approximately)
/*!40000 ALTER TABLE `product_list` DISABLE KEYS */;
INSERT INTO `product_list` (`id`, `image`, `title`, `description`, `price`) VALUES
	(1, 'fonas.jpg', 'Pienas', 'gardus labai', 5.00),
	(2, 'fuotelis.jpg', 'Alus', 'asdfasdf', 21.00);
/*!40000 ALTER TABLE `product_list` ENABLE KEYS */;

-- Dumping structure for table magazin.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `parameter` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table magazin.settings: ~2 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`parameter`, `value`) VALUES
	('app_name', 'Mano eshop'),
	('default_template', 'view_new');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table magazin.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password_hash` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `registered_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table magazin.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password_hash`, `email`, `registered_on`, `last_login`) VALUES
	(2, 'Ignas', '$2y$10$USG709t7yPs9eG3S01NfGexRa3QAIUbPI5UwQU0KTNiDFEwxcQ/wa', 'ignas@lietuva.lt', '2018-11-30 21:03:46', '2018-11-30 21:03:46'),
	(3, 'Jonas', '$2y$10$/GsR6bt66u6luA4.UtByseiEHxhbipEk1vJ5bLYXKZhNEiI6mO2MW', 'jonas@lietuva.lt', '2018-11-30 21:17:55', '2018-11-30 21:17:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
