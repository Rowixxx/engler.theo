-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour engler_theo_info1b_shoes_164_2023
DROP DATABASE IF EXISTS `engler_theo_info1b_shoes_164_2023`;
CREATE DATABASE IF NOT EXISTS `engler_theo_info1b_shoes_164_2023` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `engler_theo_info1b_shoes_164_2023`;

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_adresse
DROP TABLE IF EXISTS `t_adresse`;
CREATE TABLE IF NOT EXISTS `t_adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `numero_rue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fk_pays` int DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `fk_pays` (`fk_pays`),
  CONSTRAINT `fk_t_adresse_t_pays` FOREIGN KEY (`fk_pays`) REFERENCES `t_pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_adresse : ~10 rows (environ)
DELETE FROM `t_adresse`;
INSERT INTO `t_adresse` (`id_adresse`, `ville`, `rue`, `numero_rue`, `fk_pays`) VALUES
	(1, 'Lausanne', 'Route de Morrens', '10a', 1),
	(2, 'Berne', 'Avenue du bonheur', '11b', 2),
	(3, 'Lugano', 'Chemin du sanglier', '12c', 3),
	(4, 'Neuchatel', 'Route de Berne', '13d', 4),
	(5, 'Genève', 'Avenue de la Harpe', '14e', 5),
	(6, 'Glaris', 'Chemin de la loutre', '15f', 6),
	(7, 'Morge', 'Route de la clochette', '16g', 7),
	(8, 'Aigle', 'Avenue de Longmale', '17h', 8),
	(9, 'Vevey', 'Chemin du lion', '18i', 9),
	(10, 'Montreux', 'Route de la gloire', '18j', 10);

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_chaussure
DROP TABLE IF EXISTS `t_chaussure`;
CREATE TABLE IF NOT EXISTS `t_chaussure` (
  `id_chaussure` int NOT NULL AUTO_INCREMENT,
  `model` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `prix` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `taille` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_chaussure`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_chaussure : ~10 rows (environ)
DELETE FROM `t_chaussure`;
INSERT INTO `t_chaussure` (`id_chaussure`, `model`, `prix`, `taille`) VALUES
	(1, 'Adidas Yeezy Boost 350 V2 Zebra', '3', '4'),
	(2, 'Nike Air Jordan 1 Retro High Off-White Chicago', '100', '38'),
	(3, 'Gucci Ace Low Top Sneaker', '200', '39'),
	(4, 'Balenciaga Triple S Sneaker', '300', '40'),
	(5, 'Christian Louboutin Louis Strass Men\'s Flat', '400', '41'),
	(6, 'Maison Margiela Future High Top Sneaker', '500', '42'),
	(7, 'Saint Laurent Court Classic SL/06 Sneaker', '600', '43'),
	(8, 'Off-White x Nike Air Max 90 Black', '700', '44'),
	(9, 'Rick Owens Geobasket High Top Sneaker', '800', '45'),
	(10, 'Prada Cloudbust Thunder Sneaker', '900', '46');

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_mail
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE IF NOT EXISTS `t_mail` (
  `id_mail` int NOT NULL AUTO_INCREMENT,
  `adresse_mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_mail : ~10 rows (environ)
DELETE FROM `t_mail`;
INSERT INTO `t_mail` (`id_mail`, `adresse_mail`) VALUES
	(1, 'Theo@gmail.com'),
	(2, 'Wheo@gmail.com'),
	(3, 'Rheo@gmail.com'),
	(4, 'Lheo@gmail.com'),
	(5, 'Kheo@gmail.com'),
	(6, 'Pheo@gmail.com'),
	(7, 'Gheo@gmail.com'),
	(8, 'Jheo@gmail.com'),
	(9, 'Nheo@gmail.com'),
	(10, 'Vheo@gmail.com');

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_pays
DROP TABLE IF EXISTS `t_pays`;
CREATE TABLE IF NOT EXISTS `t_pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_pays : ~10 rows (environ)
DELETE FROM `t_pays`;
INSERT INTO `t_pays` (`id_pays`, `nom_pays`) VALUES
	(1, 'Suisse'),
	(2, 'Allemangne'),
	(3, 'Angleter'),
	(4, 'Belgique'),
	(5, 'Russie'),
	(6, 'Italie'),
	(7, 'Portugal'),
	(8, 'Espagne'),
	(9, 'Congo'),
	(10, 'Pologne');

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_personne
DROP TABLE IF EXISTS `t_personne`;
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_perso` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nationalité` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_perso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_personne : ~10 rows (environ)
DELETE FROM `t_personne`;
INSERT INTO `t_personne` (`id_perso`, `prenom`, `nom`, `date_naissance`, `sexe`, `nationalité`) VALUES
	(1, 'Théo', 'Engler', '2011-01-12', 'masculin', 'Suisse'),
	(2, 'Théa', 'Angler', '2011-01-13', 'féminin', 'Allemand'),
	(3, 'Théi', 'Ingler', '2011-01-14', 'féminin', 'Anglais'),
	(4, 'Théy', 'Yngler', '2011-01-15', 'masculin', 'Belge'),
	(5, 'Théu', 'Ungler', '2011-01-16', 'féminin', 'Russe'),
	(6, 'Ohéo', 'Englor', '2011-01-17', 'masculin', 'Italien'),
	(7, 'Ihéo', 'Englir', '2011-01-18', 'féminin', 'Portugais'),
	(8, 'Ahéo', 'Englar', '2011-01-19', 'masculin', 'Espagnole'),
	(9, 'Yhéo', 'Englyr', '2011-01-20', 'féminin', 'Congolais'),
	(10, 'Uhéo', 'Englur', '2011-01-21', 'masculin', 'Polonais');

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_pers_acheter_chaussure
DROP TABLE IF EXISTS `t_pers_acheter_chaussure`;
CREATE TABLE IF NOT EXISTS `t_pers_acheter_chaussure` (
  `id_perso_acheter_chaussure` int NOT NULL AUTO_INCREMENT,
  `fk_pers_id` int DEFAULT NULL,
  `fk_chaussure_id` int DEFAULT NULL,
  `date_achat` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_perso_acheter_chaussure`),
  KEY `fk_pers_id` (`fk_pers_id`),
  KEY `fk_chaussure_id` (`fk_chaussure_id`),
  CONSTRAINT `fk_t_pers_acheter_chaussure_t_chaussure` FOREIGN KEY (`fk_chaussure_id`) REFERENCES `t_chaussure` (`id_chaussure`),
  CONSTRAINT `fk_t_pers_acheter_chaussure_t_personne` FOREIGN KEY (`fk_pers_id`) REFERENCES `t_personne` (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_pers_acheter_chaussure : ~0 rows (environ)
DELETE FROM `t_pers_acheter_chaussure`;

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_pers_avoir_adresse
DROP TABLE IF EXISTS `t_pers_avoir_adresse`;
CREATE TABLE IF NOT EXISTS `t_pers_avoir_adresse` (
  `id_pers_avoir_adresse` int NOT NULL AUTO_INCREMENT,
  `fk_pers_id` int DEFAULT NULL,
  `fk_adresse_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pers_avoir_adresse`),
  KEY `fk_pers_id` (`fk_pers_id`),
  KEY `fk_mail_id` (`fk_adresse_id`),
  CONSTRAINT `fk_t_pers_avoir_adresse_t_adresse` FOREIGN KEY (`fk_adresse_id`) REFERENCES `t_adresse` (`id_adresse`),
  CONSTRAINT `fk_t_pers_avoir_adresse_t_personne` FOREIGN KEY (`fk_pers_id`) REFERENCES `t_personne` (`id_perso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_pers_avoir_adresse : ~10 rows (environ)
DELETE FROM `t_pers_avoir_adresse`;
INSERT INTO `t_pers_avoir_adresse` (`id_pers_avoir_adresse`, `fk_pers_id`, `fk_adresse_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8),
	(9, 9, 9),
	(10, 10, 10);

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_pers_avoir_mail
DROP TABLE IF EXISTS `t_pers_avoir_mail`;
CREATE TABLE IF NOT EXISTS `t_pers_avoir_mail` (
  `id_pers_avoir_mail` int NOT NULL AUTO_INCREMENT,
  `fk_pers_id` int DEFAULT NULL,
  `fk_mail_id` int DEFAULT NULL,
  `date_mail` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pers_avoir_mail`),
  KEY `fk_t_pers_avoir_mail_t_mail` (`fk_mail_id`),
  KEY `fk_t_pers_avoir_mail_t_personne` (`fk_pers_id`),
  CONSTRAINT `fk_t_pers_avoir_mail_t_mail` FOREIGN KEY (`fk_mail_id`) REFERENCES `t_mail` (`id_mail`),
  CONSTRAINT `fk_t_pers_avoir_mail_t_personne` FOREIGN KEY (`fk_pers_id`) REFERENCES `t_personne` (`id_perso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_pers_avoir_mail : ~10 rows (environ)
DELETE FROM `t_pers_avoir_mail`;
INSERT INTO `t_pers_avoir_mail` (`id_pers_avoir_mail`, `fk_pers_id`, `fk_mail_id`, `date_mail`) VALUES
	(1, 1, 1, '2023-01-19 09:55:21'),
	(2, 2, 2, '2023-01-19 09:55:38'),
	(3, 3, 3, '2023-01-19 09:56:01'),
	(4, 4, 4, '2023-01-19 09:56:06'),
	(5, 5, 5, '2023-01-19 09:56:14'),
	(6, 6, 6, '2023-01-19 09:56:22'),
	(7, 7, 7, '2023-01-19 09:56:32'),
	(8, 8, 8, '2023-01-19 09:56:42'),
	(9, 9, 9, '2023-01-19 09:56:48'),
	(10, 10, 10, '2023-01-19 09:56:57');

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_pers_avoir_telephone
DROP TABLE IF EXISTS `t_pers_avoir_telephone`;
CREATE TABLE IF NOT EXISTS `t_pers_avoir_telephone` (
  `id_pers_avoir_telephone` int NOT NULL AUTO_INCREMENT,
  `fk_pers_id` int DEFAULT NULL,
  `fk_telepone_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pers_avoir_telephone`),
  KEY `fk_pers_id` (`fk_pers_id`),
  KEY `fk_telepone_id` (`fk_telepone_id`),
  CONSTRAINT `fk_t_pers_avoir_telephone_t_personne` FOREIGN KEY (`fk_pers_id`) REFERENCES `t_personne` (`id_perso`),
  CONSTRAINT `fk_t_pers_avoir_telephone_t_telephone` FOREIGN KEY (`fk_telepone_id`) REFERENCES `t_telephone` (`id_telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_pers_avoir_telephone : ~10 rows (environ)
DELETE FROM `t_pers_avoir_telephone`;
INSERT INTO `t_pers_avoir_telephone` (`id_pers_avoir_telephone`, `fk_pers_id`, `fk_telepone_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8),
	(9, 9, 9),
	(10, 10, 10);

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_pers_avoir_travail
DROP TABLE IF EXISTS `t_pers_avoir_travail`;
CREATE TABLE IF NOT EXISTS `t_pers_avoir_travail` (
  `id_pers_avoir_travail` int NOT NULL AUTO_INCREMENT,
  `fk_pers_id` int DEFAULT NULL,
  `fk_travail_id` int DEFAULT NULL,
  PRIMARY KEY (`id_pers_avoir_travail`),
  KEY `fk_pers_id` (`fk_pers_id`),
  KEY `fk_mail_id` (`fk_travail_id`),
  CONSTRAINT `fk_t_pers_avoir_travail_t_personne` FOREIGN KEY (`fk_pers_id`) REFERENCES `t_personne` (`id_perso`),
  CONSTRAINT `fk_t_pers_avoir_travail_t_travail` FOREIGN KEY (`fk_travail_id`) REFERENCES `t_travail` (`id_travail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_pers_avoir_travail : ~10 rows (environ)
DELETE FROM `t_pers_avoir_travail`;
INSERT INTO `t_pers_avoir_travail` (`id_pers_avoir_travail`, `fk_pers_id`, `fk_travail_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8),
	(9, 9, 9),
	(10, 10, 10);

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_telephone
DROP TABLE IF EXISTS `t_telephone`;
CREATE TABLE IF NOT EXISTS `t_telephone` (
  `id_telephone` int NOT NULL AUTO_INCREMENT,
  `numero_telephone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_telephone : ~10 rows (environ)
DELETE FROM `t_telephone`;
INSERT INTO `t_telephone` (`id_telephone`, `numero_telephone`) VALUES
	(1, '078 000 01 02'),
	(2, '178 000 01 02'),
	(3, '278 000 01 02'),
	(4, '378 000 01 02'),
	(5, '478 000 01 02'),
	(6, '578 000 01 02'),
	(7, '678 000 01 02'),
	(8, '778 000 01 02'),
	(9, '878 000 01 02'),
	(10, '978 000 01 02');

-- Listage de la structure de table engler_theo_info1b_shoes_164_2023. t_travail
DROP TABLE IF EXISTS `t_travail`;
CREATE TABLE IF NOT EXISTS `t_travail` (
  `id_travail` int NOT NULL AUTO_INCREMENT,
  `profession` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `entreprise` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `salaire` float DEFAULT NULL,
  PRIMARY KEY (`id_travail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table engler_theo_info1b_shoes_164_2023.t_travail : ~10 rows (environ)
DELETE FROM `t_travail`;
INSERT INTO `t_travail` (`id_travail`, `profession`, `entreprise`, `salaire`) VALUES
	(1, 'Pompier', 'Swissborg', 1000),
	(2, 'Policier', 'McDonald\'s', 2000),
	(3, 'Gendarme', 'Nike', 3000),
	(4, 'Médecin', 'Coca-Cola', 4000),
	(5, 'Prof', 'Tesla', 5000),
	(6, 'Agriculteur', 'Facebook', 6000),
	(7, 'Ingénieur', 'Amazon', 7000),
	(8, 'Mécanicien', 'Microsoft', 8000),
	(9, 'Musicien', 'Google', 9000),
	(10, 'Dentiste', 'Apple', 10000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
