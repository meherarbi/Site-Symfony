-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 20 avr. 2025 à 17:37
-- Version du serveur : 10.11.10-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u894582922_store`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(1, 1, 'résidence essia mourouj 6', 'Meher', 'Arbi', 'Operam', 'résidence essia mourouj 6', '2047', 'mourouj', 'TN', '58588343'),
(2, 2, 'résidence essia mourouj 6', 'Meher', 'Arbi', 'Operam', 'résidence essia mourouj 6', '2047', 'mourouj', 'TN', '58588343'),
(3, 1, 'ILE DE LA FOLIE', 'Meher', 'yasser', NULL, 'ILE DE LA FOLIE', '75016', 'PARIS', 'FR', '+3333333333');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'La Poste', 'livraison après 3 jours', 0);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Homme', 'Découvrez notre sélection de vêtements et accessoires pour homme sur foryoumer.com. Que vous cherchiez des tenues décontractées pour le week-end, des costumes élégants pour le bureau, ou des accessoires tendance pour compléter votre look, vous trouverez tout ce dont vous avez besoin dans notre catégorie Homme. Profitez de nos offres exclusives et de la livraison rapide pour vous habiller avec style en toutes occasions.'),
(2, 'Femme', 'Découvrez notre collection de vêtements, chaussures et accessoires pour femme, conçus pour répondre aux besoins des fashionistas modernes. Que vous cherchiez des tenues décontractées pour tous les jours ou des robes de soirée élégantes pour les occasions spéciales, nous avons tout ce qu\'il vous faut pour être à la pointe de la mode.'),
(3, 'Accessoire', 'Trouvez l\'accessoire parfait pour compléter votre tenue avec notre sélection de sacs à main, bijoux, chapeaux et plus encore. Nos produits sont fabriqués à partir de matériaux de qualité et sont conçus pour ajouter une touche de style à n\'importe quelle tenue. Avec des prix compétitifs et une livraison rapide, vous ne trouverez pas de meilleure source d\'accessoires tendance en Tunisie.'),
(4, 'Electronique', 'Explorez notre gamme d\'appareils électroniques haut de gamme, allant des smartphones et ordinateurs portables aux télévisions et appareils photo. Nous travaillons avec les marques les plus populaires pour offrir à nos clients les dernières technologies et des produits de qualité supérieure à des prix compétitifs. Avec une garantie de satisfaction et une livraison rapide, vous pouvez acheter en toute confiance chez ForYoumer.com.'),
(5, 'Jouets et enfants', 'Offrez à vos enfants des jouets éducatifs et amusants avec notre sélection de jeux et de jouets pour enfants de tous âges. Nous proposons également des articles de puériculture pour les nouveau-nés et les tout-petits, pour les aider à grandir en bonne santé et en sécurité. Tous nos produits sont testés et approuvés pour leur qualité et leur sécurité.'),
(6, 'Beauté et santé', 'Prenez soin de vous avec notre gamme de produits de beauté et de soins personnels, comprenant des produits pour les cheveux, la peau et le corps. Nous proposons également des produits de santé naturels pour vous aider à rester en forme et en bonne santé. Tous nos produits sont fabriqués à partir d\'ingrédients de qualité supérieure et sont testés pour leur efficacité et leur sécurité.'),
(7, 'Outils et bricolage', 'Nous offrons une large gamme d\'outils et de produits de bricolage pour les amateurs et les professionnels. Que vous cherchiez des outils électriques, des accessoires de plomberie ou des fournitures pour le jardinage, nous avons tout ce dont vous avez besoin pour vos projets de bricolage à domicile. Avec des prix compétitifs et une livraison rapide, nous sommes votre source fiable pour les fournitures de bricolage en Tunisie.'),
(8, 'Protéines & Compléments', 'Protéines naturelles, whey bio, compléments alimentaires, nutrition sportive, fitness & musculation, récupération post-entraînement');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification_counter`
--

CREATE TABLE `notification_counter` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notification_counter`
--

INSERT INTO `notification_counter` (`id`, `user_id`, `count`) VALUES
(1, 1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `illustration` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`, `illustration`) VALUES
(1, 2, '2023-02-08 19:48:44', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 1, NULL),
(2, 2, '2023-02-08 20:02:41', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 1, NULL),
(3, 2, '2023-02-08 20:03:39', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(4, 2, '2023-02-08 20:04:27', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(5, 1, '2023-02-10 20:19:36', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(6, 1, '2023-02-10 21:24:29', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(7, 1, '2023-02-10 21:43:03', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(8, 1, '2023-02-10 21:56:11', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(9, 1, '2023-02-10 23:21:33', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(10, 1, '2023-02-11 10:10:20', 'La Poste', 7, 'Meher Arbi<br/>58588343<br/>Operam<br/>résidence essia mourouj 6<br/>2047mourouj<br/>TN', 0, NULL),
(11, 1, '2023-02-12 13:54:29', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(12, 1, '2023-02-12 13:54:48', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(13, 1, '2023-02-12 14:19:43', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(14, 1, '2023-02-12 14:44:18', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(15, 1, '2023-02-12 16:05:27', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(16, 1, '2023-02-12 16:18:48', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(17, 1, '2023-02-12 18:14:39', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(18, 1, '2023-02-12 18:16:40', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, NULL),
(19, 1, '2023-02-12 18:31:06', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, NULL),
(20, 1, '2023-02-12 18:49:13', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(21, 1, '2023-02-13 11:12:39', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(22, 1, '2023-02-13 11:13:00', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, NULL),
(23, 1, '2023-02-13 11:14:31', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, NULL),
(24, 1, '2023-02-13 11:20:25', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, NULL),
(25, 1, '2023-02-13 11:20:32', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, NULL),
(26, 1, '2023-02-13 13:14:12', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '57367179f98da37167338e9fed7488db092555c1.jpg'),
(27, 1, '2023-02-13 13:14:51', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '633a87255b26755c515b68bb19ff135c573d19f0.jpg'),
(28, 1, '2023-02-13 13:18:25', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '633a87255b26755c515b68bb19ff135c573d19f0.jpg'),
(29, 1, '2023-02-13 15:48:42', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '633a87255b26755c515b68bb19ff135c573d19f0.jpg'),
(30, 1, '2023-02-13 15:48:57', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '633a87255b26755c515b68bb19ff135c573d19f0.jpg'),
(31, 1, '2023-02-13 16:29:46', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg'),
(32, 1, '2023-02-13 16:31:16', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg'),
(33, 1, '2023-02-13 16:31:46', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg'),
(34, 1, '2023-02-13 16:32:47', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg'),
(35, 1, '2023-02-13 16:33:21', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg'),
(36, 1, '2023-02-13 22:15:21', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\"]'),
(37, 1, '2023-02-13 22:15:33', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\"]'),
(38, 1, '2023-02-14 08:46:25', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\"]'),
(39, 1, '2023-02-14 10:56:48', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\"]'),
(40, 1, '2023-02-14 11:01:14', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\"]'),
(41, 1, '2023-02-14 11:11:05', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\"]'),
(42, 1, '2023-02-17 18:06:06', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\",\"5b86b9fa55dcc4b5ffeac9b02733ad68f7cda223.jpg\"]'),
(43, 1, '2023-02-17 18:18:54', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg\",\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg\",\"106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg\",\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\",\"8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg\",\"a18ca18b34f20c9bb6712ac8e7e0097932e1dda7.jpg\",\"5b86b9fa55dcc4b5ffeac9b02733ad68f7cda223.jpg\"]'),
(44, 1, '2023-03-29 21:47:22', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(45, 1, '2023-03-29 22:03:18', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(46, 1, '2023-03-29 22:48:30', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(47, 1, '2023-03-31 15:51:48', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\"]'),
(48, 1, '2023-04-02 16:25:07', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(49, 1, '2023-04-02 17:30:26', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(50, 1, '2023-04-02 17:30:44', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(51, 1, '2023-04-02 17:31:31', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(52, 1, '2023-04-02 19:57:30', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(53, 1, '2023-04-02 20:02:50', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(54, 1, '2023-04-02 20:04:29', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(55, 1, '2023-04-02 20:06:17', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(56, 1, '2023-04-02 20:06:32', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(57, 1, '2023-04-02 20:06:53', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(58, 1, '2023-04-02 20:07:45', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(59, 1, '2023-04-02 20:08:02', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(60, 1, '2023-04-02 20:26:06', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(61, 1, '2023-04-02 20:53:12', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\"]'),
(62, 1, '2023-04-02 21:27:13', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\"]'),
(63, 1, '2023-04-02 21:38:00', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\"]'),
(64, 1, '2023-04-02 23:45:39', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(65, 1, '2023-04-03 00:01:07', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(66, 1, '2023-04-04 00:44:08', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(67, 1, '2023-04-04 14:33:22', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\"]'),
(68, 1, '2023-04-04 22:46:47', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(69, 1, '2023-04-04 23:19:48', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(70, 1, '2023-04-04 23:27:21', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(71, 1, '2023-04-05 13:10:24', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\"]'),
(72, 1, '2023-04-12 23:15:11', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\"]'),
(73, 1, '2023-04-21 00:28:42', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(74, 1, '2023-04-21 00:29:28', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(75, 1, '2023-04-21 00:32:05', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(76, 1, '2023-04-21 00:32:56', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(77, 1, '2023-04-21 00:35:08', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(78, 1, '2023-04-21 00:36:04', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(79, 1, '2023-04-21 00:37:10', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(80, 1, '2023-04-21 00:38:06', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(81, 1, '2023-04-21 00:40:17', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(82, 1, '2023-04-21 00:41:43', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(83, 1, '2023-04-21 00:42:14', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(84, 1, '2023-04-21 00:42:42', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(85, 1, '2023-04-21 00:44:21', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(86, 1, '2023-04-21 00:46:00', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(87, 1, '2023-04-21 00:46:43', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(88, 1, '2023-04-21 00:46:59', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(89, 1, '2023-04-21 00:47:08', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(90, 1, '2023-04-21 00:51:35', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(91, 1, '2023-04-21 00:52:48', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(92, 1, '2023-04-21 00:55:18', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(93, 1, '2023-04-21 00:56:16', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(94, 1, '2023-04-21 01:03:36', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(95, 1, '2023-04-21 21:42:52', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(96, 1, '2023-04-21 21:45:14', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(97, 1, '2023-04-21 21:45:42', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(98, 1, '2023-04-21 21:45:56', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(99, 1, '2023-04-21 21:46:29', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(100, 1, '2023-04-21 21:47:03', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(101, 1, '2023-04-21 21:52:12', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(102, 1, '2023-04-21 22:02:07', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(103, 1, '2023-04-21 22:02:41', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(104, 1, '2023-04-21 22:06:27', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(105, 1, '2023-04-21 22:16:02', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(106, 1, '2023-04-21 22:17:30', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(107, 1, '2023-04-21 22:23:37', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(108, 1, '2023-04-21 22:24:24', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(109, 1, '2023-04-21 22:25:38', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(110, 1, '2023-04-21 22:28:06', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(111, 1, '2023-04-21 22:31:55', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(112, 1, '2023-05-01 17:20:01', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(113, 1, '2023-05-01 17:23:26', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(114, 1, '2023-05-01 17:23:57', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(115, 1, '2023-05-01 17:30:56', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(116, 1, '2023-05-01 17:31:31', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(117, 1, '2023-05-01 17:32:03', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(118, 1, '2023-05-01 17:32:21', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(119, 1, '2023-05-01 17:40:47', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(120, 1, '2023-05-01 17:45:25', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(121, 1, '2023-05-01 17:47:56', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(122, 1, '2023-05-01 17:49:24', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(123, 1, '2023-05-01 17:51:31', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(124, 1, '2023-05-01 19:07:21', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"633a87255b26755c515b68bb19ff135c573d19f0.jpg\"]'),
(125, 1, '2023-05-09 22:53:10', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"64688504fefe6a428d92127bb2eec769e74f575e.jpg\",\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(126, 1, '2023-05-13 12:14:25', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(127, 1, '2023-05-13 12:17:17', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(128, 1, '2023-05-13 12:17:51', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(129, 1, '2023-05-13 12:20:54', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(130, 1, '2023-05-13 13:14:22', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(131, 1, '2023-05-13 13:39:12', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"57367179f98da37167338e9fed7488db092555c1.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"4a783083dfef2d6da967d7967b85e669bb652220.jpg\"]'),
(132, 1, '2023-05-13 13:45:26', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(133, 1, '2023-05-14 18:28:36', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(134, 1, '2023-05-14 18:32:19', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(135, 1, '2023-05-14 18:32:53', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(136, 1, '2023-05-14 18:34:06', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(137, 1, '2023-05-14 18:34:53', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(138, 1, '2023-05-14 18:36:16', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(139, 1, '2023-05-14 18:37:30', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(140, 1, '2023-05-14 18:38:42', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(141, 1, '2023-05-14 18:39:33', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(142, 1, '2023-05-14 18:41:00', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(143, 1, '2023-05-14 18:41:10', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(144, 1, '2023-05-14 18:41:49', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(145, 1, '2023-05-14 18:41:58', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(146, 1, '2023-05-14 18:42:11', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(147, 1, '2023-05-14 18:44:02', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(148, 1, '2023-05-14 18:53:58', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(149, 1, '2023-05-14 19:10:00', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(150, 1, '2023-05-14 19:31:37', 'La Poste', 7, 'Meher yasser +3333333333 ILE DE LA FOLIE 75016 PARIS', 0, '[\"7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\"]'),
(151, 1, '2023-05-20 21:05:43', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"b2a442eed79ff381628667c446c08fe9cc882d4b.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(152, 1, '2025-02-13 10:37:48', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(153, 1, '2025-02-13 10:42:22', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(154, 1, '2025-02-13 10:50:46', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(155, 1, '2025-02-13 10:53:49', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(156, 1, '2025-02-13 11:26:12', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(157, 1, '2025-02-13 11:27:09', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(158, 1, '2025-02-13 11:28:29', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(159, 1, '2025-02-13 11:29:07', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(160, 1, '2025-02-13 13:11:52', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"28b5f982c60562a56caac1d42c6804d490e26ca1.jpg\"]'),
(161, 1, '2025-02-13 13:29:31', 'La Poste', 7, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg\"]'),
(162, 1, '2025-02-13 14:22:16', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"2fb1946564e63797ef802e8e725fc84212953cc2.jpg\"]'),
(163, 1, '2025-02-13 14:54:23', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"2fb1946564e63797ef802e8e725fc84212953cc2.jpg\"]'),
(164, 1, '2025-02-13 15:16:24', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"2fb1946564e63797ef802e8e725fc84212953cc2.jpg\"]'),
(165, 1, '2025-02-14 20:01:04', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\"]'),
(166, 1, '2025-02-14 20:23:09', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\"]'),
(167, 1, '2025-02-14 21:42:46', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\"]'),
(168, 1, '2025-02-14 22:10:29', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\"]'),
(169, 1, '2025-02-14 22:23:40', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\"]'),
(170, 1, '2025-02-14 22:24:10', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\"]'),
(171, 1, '2025-02-18 16:22:18', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(172, 1, '2025-02-18 16:26:02', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\"]'),
(173, 1, '2025-02-20 17:32:05', 'La Poste', 0, 'Meher Arbi 58588343 Operam résidence essia mourouj 6 2047 mourouj', 0, '[\"8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg\",\"a41acf684f084329e0aa9953c10a383b665e95dd.jpg\",\"b6608badc05d996f70b6b59209031431e1ba060e.jpg\"]');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `illustration` varchar(255) DEFAULT NULL,
  `sizes_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product_id`, `quantity`, `price`, `total`, `illustration`, `sizes_id`, `created_at`) VALUES
(471, 149, 17, 1, 20000, 20000, '7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg', NULL, NULL),
(472, 149, 1, 3, 1000, 3000, 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', 3, NULL),
(473, 150, 17, 1, 20000, 20000, '7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg', NULL, NULL),
(474, 150, 1, 3, 1000, 3000, 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', 3, NULL),
(475, 150, 6, 1, 1500, 1500, 'b2a442eed79ff381628667c446c08fe9cc882d4b.jpg', 4, NULL),
(476, 151, 6, 3, 1500, 4500, 'b2a442eed79ff381628667c446c08fe9cc882d4b.jpg', NULL, NULL),
(477, 151, 1, 2, 1000, 2000, 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', NULL, NULL),
(478, 152, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(479, 153, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(480, 154, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(481, 155, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(482, 156, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(483, 157, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(484, 158, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(485, 159, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(486, 160, 4, 1, 5000, 5000, '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', NULL, NULL),
(487, 161, 10, 1, 1000, 1000, '17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg', NULL, NULL),
(488, 162, 40, 1, 182, 182, '2fb1946564e63797ef802e8e725fc84212953cc2.jpg', NULL, NULL),
(489, 163, 40, 1, 100, 100, '2fb1946564e63797ef802e8e725fc84212953cc2.jpg', NULL, NULL),
(490, 164, 40, 1, 100, 100, '2fb1946564e63797ef802e8e725fc84212953cc2.jpg', NULL, NULL),
(491, 165, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(492, 166, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(493, 167, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(494, 168, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(495, 169, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(496, 170, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(497, 171, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(498, 171, 1, 2, 1000, 2000, 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', NULL, NULL),
(499, 172, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(500, 172, 1, 2, 1000, 2000, 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', NULL, NULL),
(501, 173, 37, 1, 215, 215, '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', NULL, NULL),
(502, 173, 1, 2, 1000, 2000, 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', NULL, NULL),
(503, 173, 53, 1, 7500, 7500, 'b6608badc05d996f70b6b59209031431e1ba060e.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `price` double NOT NULL,
  `old_price` decimal(10,2) DEFAULT 10.00,
  `on_promotion` tinyint(1) DEFAULT NULL,
  `image_file` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description_image` varchar(255) DEFAULT NULL,
  `is_deal` tinyint(1) DEFAULT NULL,
  `is_on_sale` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `old_price`, `on_promotion`, `image_file`, `img`, `description_image`, `is_deal`, `is_on_sale`, `created_at`) VALUES
(1, 2, 'Survêtements', 'survetements-pour-femmes', 'a41acf684f084329e0aa9953c10a383b665e95dd.jpg', 'Survêtements pour femmes', 'Survêtements pour femmes, ensemble 2 pièces, sweat-shirt à capuche et pantalon noir, tenues décontractées, amour imprimé, automne et printemps', 1000, NULL, 0, NULL, NULL, NULL, 0, 0, NULL),
(2, 2, 'Ensemble de deux pièces pour femmes, survêtement avec fermeture éclair', 'ensemble-de-deux-pieces-pour-femmes-survetement-avec-fermeture-eclair', '7959b7cdafd0edbe8be82576df1fc315343cf65e.jpg', 'Ensemble de deux pièces pour femmes', 'Ensemble de deux pièces pour femmes, survêtement avec fermeture éclair, haut et pantalon, costume de Sport décontracté, Jogging, automne, hiver, vente en gros, 2021', 1200, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
(3, 2, 'Manteau en laine pour femme, col montant, coupe cintrée, simple, automne et hiver 2022', 'manteau-en-laine-pour-femme-col-montant-coupe-cintree-simple-automne-et-hiver-2022', '106f7d6a3bdc6e040742c15bd1ba2e0d9de2385f.jpg', 'Manteau en laine pour femme', 'Manteau en laine pour femme, col montant, coupe cintrée, simple, automne et hiver 2022', 1500, NULL, 0, '', NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Combinaison de Charge imperméable', 'combinaison-de-charge-impermeable', '28b5f982c60562a56caac1d42c6804d490e26ca1.jpg', 'Combinaison de Charge imperméable', 'Combinaison de Charge imperméable en peau de requin, nouvelle collection automne et hiver, peluche épaisse, tactique d\'alpinisme, entraînement, respirant', 5000, 4000.00, 0, '', NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Chemise Oxford en coton à manches longues pour homme', 'chemise-oxford-en-coton-a-manches-longues-pour-homme', '57367179f98da37167338e9fed7488db092555c1.jpg', 'Chemise Oxford', 'Chemise Oxford en coton à manches longues pour homme, chemise décontractée à rayures et à carreaux, avec poche, coupe régulière et boutons', 1000, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
(6, 1, 'CBUM – t-shirt 100% coton, de haute qualité, taille américaine', 'cbum-t-shirt-100-coton-de-haute-qualite-taille-americaine', 'b2a442eed79ff381628667c446c08fe9cc882d4b.jpg', 'CBUM – t-shirt 100% coton', 'CBUM – t-shirt 100% coton, de haute qualité, taille américaine', 1500, NULL, 0, NULL, NULL, NULL, 0, 0, NULL),
(7, 1, 'Blazers Occasionnels pour Hommes - Collection Automne-Printemps (M-5XL)', 'marque-hommes-blazers-occasionnels', '8fb8ab5cea80361e2f6d6a4d370d8186d266cf4e.jpg', 'Élégance et confort pour un style irrésistible', 'Découvrez notre sélection de blazers pour hommes, parfaits pour l\'automne et le printemps. Conçus dans un tissu léger et de haute qualité, nos vestes élégantes offrent un confort inégalé et une coupe mince qui met en valeur la silhouette. Idéals pour un look décontracté ou une soirée chic, ces blazers sont disponibles en tailles M à 5XL. Adoptez un style raffiné avec notre collection exclusive de blazers masculins (réf. AF1415).', 2000, 5500.00, 1, 'e64e2d2dec804c7b271162c3c72d2148684b19df.jpg', NULL, NULL, 0, 0, NULL),
(8, 3, 'OLEVS montre mécanique automatique pour hommes, en acier inoxydable', 'olevs-montre-mecanique-automatique-pour-hommes-en-acier-inoxydable', '41636f505d8ae0da2e8d1bf6fe1c0dd5d251eeaf.webp', 'OLEVS – montre mécanique automatique', 'OLEVS  montre mécanique automatique pour hommes, en acier inoxydable, étanche, lumineuse, marque de luxe, TOP', 7000, 5500.00, 0, '0917a992eb2bef9da9af5a5fc13110277ac2bb3a.jpg', NULL, '1927d386f9feea5f57d249549209fde5dcd45099.jpg', 0, 0, NULL),
(9, 3, 'Breloques Plata De Ley 925 mauvais œil', 'breloques-plata-de-ley-925-mauvais-oeil', 'a18ca18b34f20c9bb6712ac8e7e0097932e1dda7.jpg', 'Breloques Plata', 'Breloques Plata De Ley 925 mauvais œil hibou ballon à Air chaud charmes bleus adaptés à Pandora Bracelet Original fabrication De bijoux à faire soi-même', 800, NULL, 0, '', NULL, NULL, NULL, NULL, NULL),
(10, 3, 'Queenme – bague en Moissanite pour femmes', 'queenme-bague-en-moissanite-pour-femmes', '17a977b6e08f190eb44ea601d15d6eaef33c5d44.jpg', 'Queenme – bague', 'Queenme – bague en Moissanite pour femmes, grande bague en diamant incrusté, taille ronde, Super brillante, en argent Sterling 100%, cadeau à la mode, 3ct, 925', 1000, NULL, 1, '', NULL, NULL, NULL, NULL, NULL),
(11, 4, 'Nouveau micro', 'nouveau-micro-lavalier-sans-fil-portable-pour-enregistrement-audio-video', '5b86b9fa55dcc4b5ffeac9b02733ad68f7cda223.jpg', 'Nouveau micro Lavalier sans fil', 'Nouveau micro Lavalier sans fil, Portable, pour enregistrement Audio vidéo, pour iPhone, Android, diffusion en direct, téléphone de jeu', 2600, NULL, 0, '', NULL, NULL, NULL, NULL, NULL),
(12, 4, 'Microphone', 'microphone-professionnel-a-condensateur-usb-rvb-pour-pc-ps4-ps5-mac-ordinateur-de-jeu-avec-enregistrement-streaming-podcast-youtube', 'e0996f6c7903cddb755f8b8b9261eeeb9fa632b3.jpg', 'Microphone professionnel à condensateur USB rvb', 'Microphone professionnel à condensateur USB rvb, pour PC, PS4, PS5, Mac, ordinateur de jeu, avec enregistrement, Streaming, podcast, YouTube', 6000, NULL, 1, '', NULL, NULL, NULL, NULL, NULL),
(13, 4, 'Caméra', 'camera-de-surveillance-solaire-rechargeable', 'f3d151edbe4439a3e16a02f11f930d2a23b4abe6.jpg', 'Caméra de Surveillance Solaire', 'Caméra de Surveillance Solaire Rechargeable, Vidéo Surveillance Extérieure, Dispositif de Sécurité à Vision Nocturne, WIFI, PTZ, Couleur PIR, 5 MPx, 4G, Caméra Étanche', 32600, NULL, 1, '', NULL, NULL, NULL, NULL, NULL),
(15, 4, 'pc', 'pc', '0bc7034a4d0c976ad6b586178374788defb4d120.jpg', 'pc gamer', 'pc gamer 2023', 509000, NULL, 1, NULL, NULL, NULL, 0, 0, NULL),
(17, 4, 'tel', 'tel', '7daeecf2ec61f80f2c8a6bfbff8a91461d5d3d83.jpg', 'REDMI 10 / 6 GO / 4G / GRIS', 'XIAOMI TELEPHONE PORTABLE REDMI 10 / 6 GO / 4G / GRIS', 20000, NULL, 1, '', NULL, NULL, NULL, NULL, NULL),
(18, 5, 'Barboteuse à manches longues pour nouveau-né fille', 'barboteuse-a-manches-longues-pour-nouveau-ne-fille', '4a783083dfef2d6da967d7967b85e669bb652220.jpg', 'La combinaison idéale pour votre petite fille', 'Cette barboteuse est conçue pour les nouveau-nés filles et est dotée de manches longues pour les garder au chaud et confortables. Elle est fabriquée à partir de matériaux de qualité supérieure et est douce au toucher pour éviter d\'irriter la peau délicate du bébé. Cette barboteuse est un vêtement pratique pour les parents, car elle est facile à enfiler et à enlever, grâce à sa fermeture boutonnée à l\'arrière. Elle convient parfaitement pour une utilisation quotidienne ou pour les occasions spéciales. La couleur rose clair et le motif à pois rendent cette barboteuse très mignonne et adorable pour votre petite princesse.', 2100, 2900.00, 1, '141d2b9368a76f903cc64c4603b5fb8f2679a943.jpg', '31e85a1bfd2782927141ecb82b3b2a72c2d1b08a.jpg', 'b501c3170583b7a6e8b6ae95c1ba7a0dc829d351.jpg', 0, 0, NULL),
(20, 5, 'Combinaisons mignonnes pour tout-petits', 'combinaisons-mignonnes-pour-tout-petits', 'f2b8fa91e235e45a6b7f663103fe2c6684ba9c75.jpg', 'Vêtements d\'été pour nouveau-nés', 'Habillez votre tout-petit avec style cet été avec nos combinaisons mignonnes en coton. Disponibles en manches longues et courtes pour garçons et filles, nos tenues pour bébés sont parfaites pour les journées chaudes. Avec un motif de batterie amusant et le message \"J\'aime maman et papa\", ces combinaisons seront un ajout adorable à la garde-robe de votre enfant.', 1100, 1500.00, 1, '6d252505f22fb361b86494012bf911ffa3027449.jpg', NULL, NULL, NULL, NULL, NULL),
(21, 7, 'Peintures d\'art géométriques abstraites pour une décoration murale moderne et luxueuse', 'peintures-dart-geometriques-abstraites-pour-une-decoration-murale-moderne-et-luxueuse', '483cdb00d88bd2df4dd638d7133063c28766592f.jpg', 'Affiches et impressions pour salon, chambre à coucher et plus', 'Ajoutez une touche de modernité et de luxe à votre décoration intérieure avec ces peintures d\'art géométriques abstraites. Disponibles en affiches et impressions, ces pièces uniques sont parfaites pour habiller les murs de votre salon, chambre à coucher et bien plus encore. Les accents dorés ajoutent une touche de glamour à ces œuvres d\'art contemporaines.', 3400, 5500.00, 0, '2082ed842db383bb771f2a135a0b1ad84c10b445.jpg', NULL, NULL, NULL, NULL, NULL),
(22, 7, 'Tente à bulles gonflable transparente pour camping en plein air', 'sds', 'b54c63975d5d0ecba191b0957c9b5eb7be10b78c.jpg', 'Lodge sous les étoiles', 'Profitez de la beauté de la nature tout en dormant sous les étoiles dans notre tente à bulles gonflable transparente. Parfaite pour le camping en plein air ou pour une nuit dans votre propre jardin, cette tente spacieuse est fournie avec un souffleur gratuit pour une installation facile. Imaginez-vous dormir sous un ciel étoilé breton et vous réveiller avec une vue imprenable sur la nature environnante. Réservez dès maintenant votre séjour dans notre lodge sous les étoiles.', 99800, 120000.00, 0, '61e457501f6567cd8448594f2f24bb3dd1123989.jpg', '9e1147d7cfd816166a31e78831974460dc156b22.jpg', '0594acef270ebb5a2c4218066ac6502affafb331.jpg', NULL, NULL, NULL),
(26, 3, 'Montre-bracelet à quartz Lock Design avec Bluetooth', 'montre-bracelet-a-quartz-lock-design-avec-bluetooth', 'fd858661cf6861130c2b70cc3d58886553600238.jpg', 'Un accessoire de mode pratique et élégant pour les amateurs de technologie.', 'Cette montre-bracelet à quartz est un accessoire de mode pratique et élégant pour les amateurs de technologie. Avec sa conception sans couture et son verrouillage sûr, elle offre une expérience de port confortable. De plus, la connectivité Bluetooth vous permet de rester connecté à votre téléphone portable tout en gardant les mains libres. Disponible en gros, cette montre-bracelet est le choix parfait pour les revendeurs et les propriétaires de magasins de technologie à la recherche d\'un produit tendance et de qualité.', 2000, 3500.00, 0, '3a58544792528527e4f4052fb912ac1699fc0de2.jpg', '5b2f5142c910da51383bc8ef1f86842d118faa23.jpg', '0c45ccd9c71edec7e0f033d04313674191c7265b.jpg', 1, NULL, NULL),
(28, 1, 'Chaussures de running Nike SHOX AVENIVE pour homme - Bleu et Blanc', 'chaussures-de-running-nike-shox-avenive-pour-homme-bleu-et-blanc', '001c3357a4033ee06e2ad2a73093d94f5564f690.jpg', 'Obtenez un confort exceptionnel avec les baskets Nike SHOX AVENIVE', 'Les chaussures de running Nike SHOX AVENIVE pour homme sont conçues pour offrir un confort optimal lors de vos entraînements. La technologie Nike SHOX dans la semelle absorbe les chocs et offre un rebond réactif à chaque pas. La tige en mesh respirant permet une circulation d\'air optimale pour garder vos pieds au frais et au sec pendant vos activités physiques. Les lacets assurent un ajustement parfait, tandis que le logo emblématique de Nike sur le côté ajoute une touche de style. Avec leur design élégant et leur technologie innovante, les chaussures de running Nike SHOX AVENIVE pour homme sont un choix idéal pour les coureurs souhaitant allier performance et style.', 10000, 12000.00, 0, '4257eff98efa94986fd579894a1c92820445571b.webp', NULL, '3393b7038e1147a0e1f8ba4c258f123a5cfd44b4.webp', 1, NULL, NULL),
(29, 4, 'Répéteur WIFI sans fil à distance 300Mbps 802.11N - Amplificateur et Booster', 'repeteur-wifi-sans-fil-a-distance-300mbps-80211n-amplificateur-et-booster', '81bf6939720a5aea208a1b0c52b5803f88a07f73.jpg', 'Obtenez une connexion Internet fiable et rapide avec ce répéteur WIFI sans fil', 'Le répéteur WIFI sans fil à distance est conçu pour améliorer la qualité de votre connexion Internet à la maison ou au bureau. Avec une vitesse de transmission de données allant jusqu\'à 300 Mbps et la norme 802.11N, ce répéteur est capable de fournir une connexion Internet rapide et fiable dans toutes les pièces de votre maison ou de votre bureau. Il est facile à installer et peut être utilisé avec n\'importe quel routeur ou modem existant. L\'amplificateur et le booster intégrés permettent de renforcer le signal WIFI existant et de fournir une couverture WIFI étendue, idéal pour les grandes maisons ou les bureaux. Compact et léger, ce répéteur WIFI peut être facilement transporté et utilisé lors de vos déplacements. Avec ce répéteur WIFI sans fil à distance, vous pouvez maintenant profiter d\'une connexion Internet rapide et stable dans toutes les pièces de votre maison ou de votre bureau.', 800, 1200.00, 0, '8ed8f93365e3cd037732ba90657c4ed2f6621a6b.jpg', 'e2b9d3241a26cc29f16492bc3a5c3dc5b15a332c.jpg', '39fec26a0ba89867cf8dd10e8ed5ad5fbb0f0d03.jpg', 1, NULL, NULL),
(30, 3, 'SIMPRECT - Lunettes de soleil polarisées pour femme - Protection UV - Marque de luxe', 'simprect-lunettes-de-soleil-polarisees-pour-femme-protection-uv-marque-de-luxe', 'b953154da8f70bbf9169e4974da3e87bd70cd409.jpg', 'Lunettes de soleil carrées respirantes avec des nuances de qualité UV400 pour un style et une protection parfaits', 'Les lunettes de soleil SIMPRECT pour femme sont le choix idéal pour ceux qui recherchent à la fois un style et une protection contre les rayons UV nocifs. Avec leur design carré élégant et leur marque de luxe, ces lunettes de soleil sont parfaites pour toutes les occasions. Les lentilles polarisées réduisent les reflets et offrent une clarté de vision exceptionnelle pour une expérience de port confortable. Les nuances de qualité UV400 protègent les yeux des rayons UV nocifs du soleil, vous permettant de profiter du plein air en toute sécurité. De plus, la construction respirante des lunettes de soleil garantit un port confortable tout au long de la journée, même lors de températures élevées. Avec leur style élégant et leur protection solaire exceptionnelle, les lunettes de soleil SIMPRECT pour femme sont un excellent choix pour tous ceux qui cherchent à allier mode et protection solaire de qualité supérieure.', 1000, 1500.00, 0, '1ef016e83bd8a6d9c54f503e347d84705fdba514.jpg', '284a3d10c88cb7516ae8604899d0c2cf44555934.jpg', '0a719eb154b3f542ee997f6483b14b76053f350e.jpg', 0, 1, NULL),
(31, 7, 'Mini ventilateur de cou portable sans lame - Refroidisseur d\'air rechargeable - Ventilateurs de sport d\'été', 'mini-ventilateur-de-cou-portable-sans-lame-refroidisseur-dair-rechargeable-ventilateurs-de-sport-dete', '103ac8297f94ca1fe864bb416a0cbad405ab5eb6.jpg', 'Restez au frais avec le mini ventilateur de cou portable sans lame à 3 vitesses et 600mAh', 'Le mini ventilateur de cou portable sans lame est un accessoire de refroidissement idéal pour les activités en plein air, les voyages ou tout simplement pour rester au frais à la maison. Avec sa conception unique sans lame, ce ventilateur est sûr et facile à utiliser, même pour les enfants. Il est rechargeable avec une batterie intégrée de 600mAh, et peut être utilisé pendant plusieurs heures avec une seule charge. Avec ses 3 vitesses réglables, vous pouvez facilement ajuster la vitesse du ventilateur en fonction de vos besoins. La construction légère et portable vous permet de l\'emporter partout avec vous, et son design de collier vous permet de l\'ajuster confortablement autour de votre cou. Ce mini ventilateur de cou est parfait pour les activités sportives en été ou pour vous rafraîchir à la maison ou au bureau. Avec sa capacité de refroidissement efficace et sa conception pratique, le mini ventilateur de cou portable sans lame est un excellent choix pour rester au frais et confortable pendant les chaudes journées d\'été.', 1200, 1800.00, 0, '68c1e59c90337f3e1bb7004cb01e7523ebfb2b8b.jpg', '49fdf782715e0a79ce6164a946f82c58cec37e37.jpg', '030c157c6e3c5273e4f8432bcc3cea5903e85ff3.jpg', 0, 1, NULL),
(32, 2, 'Sac messager en cuir verni atmosphérique pour femme - Sac à main à bandoulière initié de haute qualité', 'sac-messager-en-cuir-verni-atmospherique-pour-femme-sac-a-main-a-bandouliere-initie-de-haute-qualite', 'bc8fc9aa13844105200d4e73c64f7f02d8cec345.jpg', 'Un sac à main à bandoulière en cuir verni de qualité supérieure pour toutes les occasions décontractées ou festives', 'Le sac messager en cuir verni atmosphérique pour femme est un sac à main à bandoulière élégant et pratique pour toutes les occasions. Fabriqué à partir de cuir verni de haute qualité, ce sac est durable et résistant à l\'usure tout en étant facile à nettoyer. Le design initié du sac à main en fait un choix parfait pour les femmes qui veulent être à la fois tendance et élégantes. Le sac messager a une bandoulière réglable pour un ajustement personnalisé, et sa taille moyenne en fait un sac fourre-tout décontracté et pratique pour transporter tous vos essentiels. Le sac est idéal pour les fêtes, les événements décontractés, ou tout simplement comme un accessoire de tous les jours pour une touche de sophistication. Avec son design élégant et sa qualité supérieure, le sac messager en cuir verni atmosphérique pour femme est un excellent choix pour toutes les femmes à la recherche d\'un sac à main à la fois pratique et tendance.', 5500, 7200.00, 0, '170883d6578b7cd0589d4eafdf01d36dc9163bf6.jpg', '5a2a9169071f529c58283ef2098f05d314a92b80.jpg', '7256c44ee0c58d6b31a6c216681df74a5ff78aa0.jpg', 0, 1, NULL),
(33, 4, 'Drone professionnel 8K 5G GPS 4K HD - Photographie aérienne haute résolution et évitement d\'obstacles', 'drone-professionnel-8k-5g-gps-4k-hd-photographie-aerienne-haute-resolution-et-evitement-dobstacles', 'fbf82179ea712f711c4f4a63eb606d779efac8da.jpg', 'Découvrez le potentiel du vol avec ce drone professionnel à quatre rotors et distance de contrôle de 5000m', 'Le drone professionnel 8K 5G GPS 4K HD est le choix idéal pour les photographes aériens et les cinéastes à la recherche d\'un drone de qualité supérieure. Avec sa caméra haute résolution 8K et 4K HD, vous pouvez capturer des images et des vidéos époustouflantes de vos vols aériens. Le drone est équipé de la dernière technologie d\'évitement d\'obstacles, ce qui vous permet de voler en toute sécurité sans endommager le drone. Il est également équipé de quatre rotors pour une stabilité accrue en vol, ce qui vous permet de capturer des images nettes même en cas de vents forts. Le GPS intégré vous permet de contrôler le drone à distance de 5000m, vous donnant la liberté d\'explorer et de capturer des images dans des endroits reculés. Le drone professionnel 8K 5G GPS 4K HD est parfait pour les professionnels de la photographie aérienne, les cinéastes et les explorateurs à la recherche d\'un drone fiable et de qualité supérieure. Avec son potentiel de vol impressionnant, sa technologie d\'évitement d\'obstacles et sa caméra haute résolution, ce drone est un choix excellent pour tous les amoureux du vol.', 5000, 7500.00, 0, 'c0ad86e577a0516a840254470743b286217eb7b4.jpg', 'da0e2a5cc01c506c5882e27ca98e0c4fc898ef3d.jpg', '215c8fabdc00590f764803a4ceddd86ff3950686.jpg', 0, 1, NULL),
(34, 3, 'Montre de luxe à quartz pour homme', 'montre-de-luxe-a-quartz-pour-homme', '4433099bacff6baefde7adefc4903efea12687d3.jpg', 'Montre de luxe', 'Une montre de luxe à quartz pour homme est un accessoire de mode élégant et fonctionnel qui combine la précision du mouvement à quartz avec un design luxueux et des matériaux de haute qualité', 3228, 4900.00, 1, 'be7c160c3044838d7b5a928aff44c2e876732fbf.jpg', '134c258f40de73b65c5b2a651954b7412a258938.jpg', '137429cd56261d11193b969817bb09441f2e11ad.jpg', 0, 0, NULL),
(35, 6, 'Rouge à lèvres liquide brillant velours longue durée, maquillage femme beauté', 'rouge-a-levres-liquide-brillant-velours-longue-duree-maquillage-femme-beaute', '64688504fefe6a428d92127bb2eec769e74f575e.jpg', 'Rouge à lèvres liquide brillant velours longue durée', 'Le rouge à lèvres liquide brillant velours longue durée est un produit de maquillage pour les lèvres qui combine la texture veloutée et la pigmentation intense d\'un rouge à lèvres traditionnel avec la facilité d\'application et la brillance d\'un gloss', 300, NULL, 0, '678c64e838f2e131ceecff76da1f99e8ba41c25a.jpg', 'c337e2c9526be2dd669d19d2ddcdb28590e761a7.jpg', '36735c2b3c288b473acfb95ee3dc50ecd080d968.jpg', 1, 0, NULL),
(36, 6, 'Ensemble de 13 pinceaux de maquillage', 'ensemble-de-13-pinceaux-de-maquillage', 'b9fa57f40783c2c4d7acb55b91626a271091d8fe.jpg', 'Ensemble de 13 pinceaux de maquillage', 'Un ensemble de 13 pinceaux de maquillage est une collection polyvalente d\'outils conçus pour appliquer différents types de produits de maquillage sur le visage et les yeux. Ces ensembles sont parfaits pour les débutants ainsi que pour les maquilleurs professionnels, car ils offrent une variété de pinceaux pour créer différents looks et techniques.', 385, NULL, 0, '18ebafd87aba1cbb9b8b375544fec529207cf0c4.jpg', '7d66c927407ed4fe4110a35714d0e90c5a80e1b9.jpg', '068c53db37797e7f2a5a188db6f45c82e34afbc9.jpg', 1, 0, NULL),
(37, 6, 'aux cercueil mi-long avec poignées amovibles', 'aux-cercueil-mi-long-avec-poignees-amovibles', '8af137ad46a9be4adc37bb9de85da32fa34cded7.jpg', 'aux cercueil mi-long avec poignées amovibles', 'Faux cercueil mi-long avec poignées amovibles, outil de manucure bricolage, style Halloween, impression N64.Patch, N64.Art, 24 pièces', 215, NULL, 0, 'e0ea9debc2e8ab9f8e2ecf0138c369d4a89fbe86.jpg', '1d14b9321e088b52ae4108cf4d89ca5a9b06c2e5.jpg', 'b91c30476f614ed42ce81ca26909dabcff033887.jpg', 0, 1, NULL),
(38, 6, 'masque anti-acné pour femmes,', 'masque-anti-acne-pour-femmes', '0b6f4d5e9e1e6383fc197c4a1d010eaf3c0314d0.jpg', 'masque anti-acné pour femmes,', 'Un masque anti-acné pour femmes est un produit de soin de la peau spécialement formulé pour traiter et prévenir l\'acné chez les femmes. Les masques anti-acné sont conçus pour cibler les problèmes spécifiques liés à l\'acné, tels que l\'excès de sébum, les bactéries, les inflammations et les cellules mortes de la peau.', 600, 1200.00, 1, 'fd8d352dc0ecb7e91e4a702f701f469a029239e5.jpg', 'f0438fe9733f5b70eb0a86f919c087ac0e81bce7.jpg', '4075ac6789a676f6d7687ad310570fd2706f053f.jpg', 0, 0, NULL),
(39, 6, 'Kit de sérum anti-déformable en or 24 carats pour femme', 'kit-de-serum-anti-deformable-en-or-24-carats-pour-femme', 'b6e8d364cbe1113877177686c5eeae0afda953c3.jpg', 'Kit de sérum anti-déformable en or 24 carats pour femme', 'Un kit de sérum anti-déformable en or 24 carats pour femmes est un produit de soin de la peau de luxe qui contient des particules d\'or 24 carats et d\'autres ingrédients de haute qualité pour aider à améliorer la texture, la fermeté et l\'éclat de la peau', 1030, NULL, 0, 'd85ec8329437fd4bb556af4fb54dbde5550a03a0.jpg', 'ceef64cb1b0a6b403efffcfc73819673fd02e002.jpg', '1348e50de1ede3ff2ab581475bd573fc2878e55c.jpg', 0, 0, NULL),
(40, 6, 'Crème de masque facial anti-points noirs pour femmes', 'creme-de-masque-facial-anti-points-noirs-pour-femmes', '2fb1946564e63797ef802e8e725fc84212953cc2.jpg', 'Crème de masque facial anti-points noirs pour femmes', 'Une crème de masque facial anti-points noirs pour femmes est un produit de soin de la peau spécifiquement conçu pour aider à éliminer et prévenir les points noirs. Les points noirs sont de petits bouchons de sébum et de cellules mortes de la peau qui obstruent les pores', 100, NULL, 0, '32054ab8888855a7d87f3e5072fff3bc2c1d7536.jpg', '1c39f89c6a7611cff64e8e05ab90da45be0d1a82.jpg', 'c7a8899cb3fc05cc483c176529d331028ecea7f7.jpg', 0, 0, NULL),
(41, 6, 'Palette de fards à paupières, 36 couleurs', 'palette-de-fards-a-paupieres-36-couleurs', '05f3cbb7b7688a88b3bb4ce721db5f9ce5e14b63.jpg', 'Palette de fards à paupières, 36 couleurs', 'Une palette de fards à paupières de 36 couleurs est un produit de maquillage polyvalent qui vous permet de créer une variété de looks pour les yeux, des plus naturels aux plus audacieux.', 1200, NULL, 0, '076ccbd3b2924238ce01db1918a2ac560fef80f6.jpg', 'b236255173d854ef985775133813fada553fc36c.jpg', 'be9b6ded865220745b61bb633b136ab36d83e765.jpg', 0, 0, NULL),
(42, 6, 'Fond de teint à coussin d\'air pour la tête de la pièce,', 'fond-de-teint-a-coussin-dair-pour-la-tete-de-la-piece', 'eb51d0e2cf309f1bf3173c8a563fedbe7ec50ad6.jpg', 'Fond de teint à coussin d\'air pour la tête de la pièce,', 'Fond de teint hydratant naturel, correcteur, blanchissant, éclaircissant, imperméable, contrôle de l\'huile', 500, NULL, 0, '21ccbec8b237ea902bd38de80a672ccffa065715.jpg', '55e33d1cb743a313e2f1e2c65a7719d24af5a183.jpg', '8923ab0977d544fab6da7462c9a956655713eadd.jpg', 1, 0, NULL),
(43, 6, 'Palette de maquillage pour les yeux', 'palette-de-maquillage-pour-les-yeux', '7fa846c686d78b72da275cb35a60042e97c23584.jpg', 'Palette de maquillage pour les yeux', 'Une palette de maquillage pour les yeux est un ensemble de fards à paupières regroupés dans un seul boîtier, offrant un large éventail de couleurs et de finitions pour créer une variété de looks. Les palettes de maquillage pour les yeux peuvent être très utiles pour ceux qui aiment expérimenter avec différentes couleurs et styles de maquillage des yeux.', 1021, NULL, 0, 'c84b427dee9a260daae65c8b0c32ae5e4d6a07d7.jpg', '541ead4caa64ba8e86333edb5614bdee22500383.jpg', '4c12e467fe75585f97003c86fc62caca28254956.jpg', 0, 1, NULL),
(44, 2, 'Chemise habillée à manches longues pour femmes', 'chemise-habillee-a-manches-longues-pour-femmes', 'caf92698b68f47420b5125a074654fe1027ac36f.jpg', 'Chemise habillée à manches longues pour femmes', 'Une chemise habillée à manches longues pour femmes est un vêtement polyvalent et élégant qui peut être porté dans diverses occasions formelles ou décontractées. Voici quelques caractéristiques et conseils pour choisir et porter une chemise habillée à manches longues pour femmes :', 1122, NULL, 0, 'd22c4078f909b902df998252e11f4b144c450e46.jpg', '9a3acaba0bafdf999cca9fc59aca48995eae7e7e.jpg', 'de8175299752c23c1cb8941babce3b268b2586ae.jpg', 1, 0, NULL),
(45, 5, 'Une robe d\'été pour petites filles', 'une-robe-dete-pour-petites-filles', '01afa66ad8d9ce811953bb9889b2353a452ab78a.jpg', 'Une robe d\'été pour petites filles', 'Une robe d\'été pour petites filles est un vêtement léger et confortable, idéal pour les journées chaudes et ensoleillées.', 360, NULL, 0, '9655f920feac63daec1ab09c1b0010e7342cfa9f.jpg', 'e11b0a0eca273b67db5f3dad6a5ee54ded2b3ff6.jpg', 'd390504418c5c48b76d607781342e804f3a4af84.jpg', 0, 1, NULL),
(46, 2, 'Sac à main polyvalent Mother\'s One Initiated 2022 - Luxe et style pour femmes modernes', 'sac-a-main-pour-femme', '2b5072a2a2c1d33966bf10f3110d4e5fe3b2045e.jpg', 'Un sac à main de luxe au design élégant pour toutes vos occasions', 'Découvrez le sac à main polyvalent Mother\'s One Initiated, conçu pour les femmes modernes à la recherche d\'un accessoire de luxe et tendance pour compléter leur garde-robe en 2022. Ce sac à main de qualité supérieure allie fonctionnalité et style, offrant ainsi un design raffiné et une organisation optimale pour toutes vos affaires personnelles.', 1000, NULL, 0, '2b984ad83c6b420f10db904de8ffc70aa4aa02a0.jpg', 'd285bea0fbea5482ee906e83770bb97ddfd78999.jpg', '93bb3427b27ba2d3ae11f80929ab9449d61af032.jpg', 0, 0, NULL),
(47, 2, 'Ensemble de montre magnétique à quartz pour femme', 'ensemble-de-montre-magnetique-a-quartz-pour-femme', 'd1b263636c3db308a264796dc9febfc5777bacda.jpg', 'Ensemble de montre magnétique à quartz pour femme', 'Découvrez notre ensemble de montre magnétique à quartz pour femme, une combinaison parfaite d\'élégance et de fonctionnalité. Conçu pour les femmes modernes qui apprécient à la fois la mode et la praticité, cet ensemble de montre est le choix idéal pour ajouter une touche de sophistication à votre poignet.', 526, NULL, 0, 'bbaab0c4eea00bd60dccc924c4c3fd22e539338c.jpg', 'dea4781744b76621a8125841800412480e1894fd.jpg', '39450bd57921f98ee7a1fb0439a2e2cdb8574705.jpg', 0, 0, NULL),
(48, 2, 'Ensemble de 6 boucles d\'oreilles géométriques rétro - Style Hepburn pour un look occidental chic', 'boucles-doreilles-creatives', 'de01be6eb45c03250c74d91c36b65a03c36fd38f.jpg', 'Des boucles d\'oreilles uniques pour ajouter une touche d\'élégance à votre style quotidien', 'Offrez-vous cet ensemble de 6 boucles d\'oreilles géométriques créatives inspirées du style rétro Hepburn, parfait pour apporter une touche d\'originalité et d\'élégance à votre look. Chaque paire de boucles d\'oreilles est ornée de perles délicates et présente un design géométrique unique pour un look occidental chic et intemporel.', 1505, 2000.00, 1, 'bedbf8962bad6eff5f28a15ae00b278c7c6d7e3c.jpg', '1b680a06ca42b325e64c94ff1a32cec969a790f0.jpg', '7a02df75eb02b47f0e52476864ada61d4f784b0d.jpg', 0, 0, NULL),
(49, 7, 'Machine électrique automatique à glissière en acier inoxydable', 'machine-electrique-automatique-a-glissiere-en-acier-inoxydable', '2019c5c16276037fe82e8dd419116dd0845dc3b0.jpg', 'Machine électrique automatique à glissière en acier inoxydable', 'Découvrez notre machine électrique automatique à glissière en acier inoxydable, conçue pour offrir une performance fiable et une précision exceptionnelle pour tous vos projets nécessitant des mouvements linéaires. Construite avec des matériaux de qualité supérieure, cette machine est idéale pour une variété d\'applications industrielles et de bricolage.', 5000, NULL, 0, '7744d1cc5a1fa658625191edfaed179385678474.jpg', 'd42a79fa351dca9410279302e69f6651add3091c.jpg', 'de5bbe36994afe2f2886c7d2bcba6267470df75f.jpg', 0, 0, NULL),
(50, 6, 'Faux cils en vison 3D', 'faux-cils-en-vison-3d', 'b79eca3f710ff9c145ee66c5bde88cdeeae3b49b.jpg', 'Faux cils en vison 3D', 'Rehaussez la beauté de vos yeux avec notre collection de faux cils en vison 3D. Ces cils luxueux sont conçus pour offrir un effet naturel et volumineux, tout en étant confortables et faciles à appliquer. Parfaits pour toutes les occasions, nos faux cils en vison 3D vous permettront de captiver les regards et de sublimer votre maquillage.', 303, 500.00, 1, '842f115e9a2596823e54386930b5e212ddf8f841.jpg', '4e6c0b813ef7b9d31535f9bee190b3371029cceb.jpg', '5e7c962f60210cec6b3425774deea4aaea6e5df8.jpg', 0, 0, NULL),
(51, 7, 'Batteur à œufs semi-automatique à pression manuelle Z40 - Un outil de cuisine en acier inoxydable pratique et efficace', 'batteur-a-oeufs-semi-automatique-a-pression-manuelle', '6c492ecc987811de343c52a65454d3ea7fe1ae83.jpg', 'Un fouet à crème auto-tournant pour faciliter vos préparations culinaires', 'le batteur à œufs semi-automatique à pression manuelle Z40, un accessoire de cuisine indispensable pour faciliter vos préparations culinaires. Ce fouet à crème auto-tournant en acier inoxydable est conçu pour mélanger et battre les œufs, la crème et d\'autres ingrédients en un tour de main.', 1300, NULL, 0, '92638b62bd14b48b284dfeeb0fef237eac93ec5e.jpg', '7c3c6596c14d15b8b040929602c87e4d5ec4b7c5.jpg', 'e1e480b21700119c5d6ba734d6ea95f7c91ab41d.jpg', 0, 0, NULL),
(52, 7, 'grille-pain électrique de maison', 'grille-pain-electrique-de-maison', 'dcb95fb50b8786c301c360b30b3cf415620bde5f.jpg', 'grille-pain électrique de maison', 'Savourez de délicieux toasts dorés à la perfection avec notre grille-pain électrique de maison. Conçu pour offrir une performance fiable et constante, ce grille-pain est l\'appareil idéal pour préparer facilement des petits-déjeuners ou des collations rapides.', 6400, 8400.00, 1, '49cc337ce05beff1d3de70ddeb85672d9cdde40b.jpg', '68222127a7d2157e0916cd404c35af73b8264ded.jpg', 'a131484c46da6a744db2e8e175547c36ce1e353b.jpg', 0, 1, NULL),
(53, 8, 'Protéine Naturelle Bio & Riche en BCAA', 'proteine-naturelle-bio-riche-en-bcaa', 'b6608badc05d996f70b6b59209031431e1ba060e.jpg', '100% Naturelle, Sans Additifs, Haute Digestibilité – Idéale pour Musculation & Fitness', 'Boostez votre performance avec Naturo Boost, la protéine naturelle idéale pour les sportifs et les amateurs de nutrition saine ! 🔥\r\n\r\n💪 25g de protéines par portion pour une construction musculaire optimale\r\n🌿 100% naturelle & sans additifs – Pas de produits chimiques ni d’OGM\r\n⚡ Riche en BCAA & Acides aminés essentiels – Accélère la récupération musculaire\r\n🥛 Se mélange parfaitement avec de l’eau, du lait ou dans un smoothie\r\n👌 Digestion facile & Absorption rapide\r\n✨ Idéal pour : Musculation, fitness, CrossFit, récupération post-entraînement, sèche et prise de masse.\r\n\r\n📦 Format disponible : 1kg \r\n\r\n🚀 Disponible dès maintenant avec livraison rapide !', 7500, 12000.00, 1, NULL, NULL, 'ed8636fa42b5da28fe0aa2019ff4576353c15228.jpg', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `imagess` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_size`
--

CREATE TABLE `product_size` (
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_size`
--

INSERT INTO `product_size` (`product_id`, `size_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(18, 1),
(18, 2),
(18, 3),
(40, 1);

-- --------------------------------------------------------

--
-- Structure de la table `recently_viewed_product`
--

CREATE TABLE `recently_viewed_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `viewed_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recently_viewed_product`
--

INSERT INTO `recently_viewed_product` (`id`, `product_id`, `user_id`, `viewed_at`) VALUES
(267, 4, 1, NULL),
(268, 5, 1, NULL),
(269, 6, 1, NULL),
(270, 7, 1, NULL),
(271, 4, 1, '2023-04-03 21:34:54'),
(272, 5, 1, '2023-04-03 21:34:54'),
(273, 6, 1, '2023-04-03 21:34:54'),
(274, 7, 1, '2023-04-03 21:34:54'),
(275, 4, 1, '2023-04-03 21:39:20'),
(276, 5, 1, '2023-04-03 21:39:20'),
(277, 6, 1, '2023-04-03 21:39:20'),
(278, 7, 1, '2023-04-03 21:39:20'),
(279, 1, 1, '2023-04-03 21:49:15'),
(280, 2, 1, '2023-04-03 21:49:15'),
(281, 3, 1, '2023-04-03 21:49:15'),
(282, 1, 1, '2023-04-03 21:49:31'),
(283, 2, 1, '2023-04-03 21:49:31'),
(284, 3, 1, '2023-04-03 21:49:31'),
(285, 4, 1, '2023-04-03 21:50:41'),
(286, 5, 1, '2023-04-03 21:50:41'),
(287, 6, 1, '2023-04-03 21:50:41'),
(288, 7, 1, '2023-04-03 21:50:41'),
(289, 8, 1, '2023-04-03 21:52:03'),
(290, 9, 1, '2023-04-03 21:52:03'),
(291, 10, 1, '2023-04-03 21:52:03'),
(292, 15, 1, '2023-04-03 21:52:03'),
(293, 8, 1, '2023-04-03 21:52:34'),
(294, 9, 1, '2023-04-03 21:52:34'),
(295, 10, 1, '2023-04-03 21:52:34'),
(296, 15, 1, '2023-04-03 21:52:34'),
(297, 8, 1, '2023-04-03 21:52:50'),
(298, 9, 1, '2023-04-03 21:52:50'),
(299, 10, 1, '2023-04-03 21:52:50'),
(300, 15, 1, '2023-04-03 21:52:50'),
(301, 8, 1, '2023-04-03 21:53:14'),
(302, 9, 1, '2023-04-03 21:53:14'),
(303, 10, 1, '2023-04-03 21:53:14'),
(304, 15, 1, '2023-04-03 21:53:14'),
(305, 11, 1, '2023-04-03 22:18:26'),
(306, 12, 1, '2023-04-03 22:18:26'),
(307, 13, 1, '2023-04-03 22:18:26'),
(308, 17, 1, '2023-04-03 22:18:26'),
(309, 4, 1, '2023-04-03 22:18:58'),
(310, 5, 1, '2023-04-03 22:18:58'),
(311, 6, 1, '2023-04-03 22:18:58'),
(312, 7, 1, '2023-04-03 22:18:58'),
(313, 4, 1, '2023-04-03 22:19:38'),
(314, 5, 1, '2023-04-03 22:19:38'),
(315, 6, 1, '2023-04-03 22:19:38'),
(316, 7, 1, '2023-04-03 22:19:38'),
(317, 4, 1, '2023-04-03 22:21:32'),
(318, 5, 1, '2023-04-03 22:21:32'),
(319, 6, 1, '2023-04-03 22:21:32'),
(320, 7, 1, '2023-04-03 22:21:32'),
(321, 4, 1, '2023-04-03 22:24:05'),
(322, 5, 1, '2023-04-03 22:24:05'),
(323, 6, 1, '2023-04-03 22:24:05'),
(324, 7, 1, '2023-04-03 22:24:05'),
(325, 8, 1, '2023-04-03 22:24:13'),
(326, 9, 1, '2023-04-03 22:24:13'),
(327, 10, 1, '2023-04-03 22:24:13'),
(328, 15, 1, '2023-04-03 22:24:13'),
(329, 10, 1, '2023-04-03 22:31:12'),
(330, 3, 1, '2023-04-03 22:33:31'),
(331, 12, 1, '2023-04-03 22:45:24'),
(332, 13, 1, '2023-04-03 22:45:50'),
(333, 1, 1, '2023-04-03 22:50:26'),
(334, 2, 1, '2023-04-03 23:52:29'),
(335, 3, 1, '2023-04-03 23:52:49'),
(336, 17, 1, '2023-04-03 23:55:52'),
(337, 17, 1, '2023-04-03 23:56:00'),
(338, 17, 1, '2023-04-03 23:56:07'),
(339, 6, 1, '2023-04-03 23:57:41'),
(340, 1, 1, '2023-04-03 23:59:14'),
(341, 1, 1, '2023-04-04 00:05:55'),
(342, 1, 1, '2023-04-04 00:08:30'),
(343, 1, 1, '2023-04-04 00:43:35'),
(344, 1, 1, '2023-04-04 00:46:17'),
(345, 2, 1, '2023-04-04 00:46:29'),
(346, 1, 1, '2023-04-04 00:47:13'),
(347, 1, 1, '2023-04-04 00:51:43'),
(348, 12, 1, '2023-04-04 00:52:09'),
(349, 12, 1, '2023-04-04 00:53:57'),
(350, 12, 1, '2023-04-04 00:54:43'),
(351, 13, 1, '2023-04-04 00:55:10'),
(352, 13, 1, '2023-04-04 00:56:35'),
(353, 1, 1, '2023-04-04 00:57:34'),
(354, 1, 1, '2023-04-04 01:03:31'),
(355, 1, 1, '2023-04-04 01:04:08'),
(356, 1, 1, '2023-04-04 01:04:51'),
(357, 1, 1, '2023-04-04 01:19:58'),
(358, 12, 1, '2023-04-04 01:20:29'),
(359, 12, 1, '2023-04-04 14:35:53'),
(360, 9, 1, '2023-04-04 17:19:18'),
(361, 7, 1, '2023-04-04 17:19:49'),
(362, 6, 1, '2023-04-04 17:29:10'),
(363, 6, 1, '2023-04-04 17:33:39'),
(364, 1, 1, '2023-04-04 17:48:03'),
(365, 2, 1, '2023-04-04 19:45:27'),
(366, 2, 1, '2023-04-04 19:59:54'),
(367, 2, 1, '2023-04-04 21:29:07'),
(368, 1, 1, '2023-04-04 22:34:37'),
(369, 1, 1, '2023-04-04 22:36:24'),
(370, 2, 1, '2023-04-04 22:47:33'),
(371, 6, 1, '2023-04-04 22:47:56'),
(372, 3, 1, '2023-04-04 22:59:34'),
(373, 1, 1, '2023-04-04 22:59:53'),
(374, 5, 1, '2023-04-04 23:02:06'),
(375, 6, 1, '2023-04-04 23:03:53'),
(376, 4, 1, '2023-04-04 23:06:01'),
(377, 1, 1, '2023-04-04 23:19:06'),
(378, 2, 1, '2023-04-04 23:32:34'),
(379, 2, 1, '2023-04-04 23:34:25'),
(380, 3, 1, '2023-04-04 23:39:32'),
(381, 1, 1, '2023-04-04 23:39:58'),
(382, 7, 1, '2023-04-04 23:40:34'),
(383, 5, 1, '2023-04-04 23:41:13'),
(384, 2, 1, '2023-04-04 23:45:50'),
(385, 1, 1, '2023-04-04 23:48:50'),
(386, 6, 1, '2023-04-04 23:49:13'),
(387, 7, 1, '2023-04-04 23:49:31'),
(388, 3, 1, '2023-04-04 23:52:23'),
(389, 5, 1, '2023-04-04 23:52:45'),
(390, 2, 1, '2023-04-04 23:57:48'),
(391, 6, 1, '2023-04-05 00:00:35'),
(392, 7, 1, '2023-04-05 00:04:34'),
(393, 4, 1, '2023-04-05 00:05:06'),
(394, 17, 1, '2023-04-05 00:31:40'),
(395, 1, 1, '2023-04-12 23:16:35'),
(396, 3, 1, '2023-04-12 23:17:04'),
(397, 6, 1, '2023-04-12 23:17:37'),
(398, 20, 1, '2023-04-12 23:59:55'),
(399, 20, 1, '2023-04-13 00:00:55'),
(400, 22, 1, '2023-04-13 01:13:40'),
(401, 22, 1, '2023-04-13 01:36:09'),
(402, 8, 1, '2023-04-13 01:37:03'),
(403, 18, 1, '2023-04-13 01:37:38'),
(404, 18, 1, '2023-04-13 01:39:52'),
(405, 8, 1, '2023-04-13 10:52:07'),
(406, 8, 1, '2023-04-13 10:53:06'),
(407, 1, 1, '2023-04-20 20:39:27'),
(408, 1, 1, '2023-04-20 22:21:41'),
(409, 1, 1, '2023-04-20 22:30:53'),
(410, 1, 1, '2023-04-20 22:31:50'),
(411, 2, 1, '2023-04-20 23:32:44'),
(412, 1, 1, '2023-04-20 23:43:25'),
(413, 6, 1, '2023-04-21 00:28:14'),
(414, 18, 1, '2023-04-21 00:59:22'),
(415, 4, 1, '2023-04-21 01:02:21'),
(416, 4, 1, '2023-04-21 11:28:19'),
(417, 1, 1, '2023-04-21 21:31:10'),
(418, 1, 1, '2023-04-21 21:42:16'),
(419, 4, 1, '2023-04-22 19:05:39'),
(420, 8, 1, '2023-04-22 20:18:38'),
(421, 4, 1, '2023-04-23 13:16:39'),
(422, 22, 1, '2023-04-23 13:17:28'),
(423, 29, 1, '2023-04-23 22:17:27'),
(424, 29, 1, '2023-04-24 22:30:08'),
(425, 30, 1, '2023-04-26 13:02:13'),
(426, 4, 1, '2023-04-26 13:11:14'),
(427, 1, 1, '2023-04-26 19:39:12'),
(428, 12, 1, '2023-04-26 19:39:50'),
(429, 18, 1, '2023-04-26 19:40:04'),
(430, 18, 1, '2023-04-26 19:40:34'),
(431, 5, 1, '2023-04-26 22:07:57'),
(432, 6, 1, '2023-05-01 11:30:22'),
(433, 6, 1, '2023-05-01 11:30:46'),
(434, 1, 1, '2023-05-01 17:15:18'),
(435, 1, 1, '2023-05-01 17:16:01'),
(436, 1, 1, '2023-05-01 19:06:14'),
(437, 8, 1, '2023-05-01 19:06:34'),
(438, 1, 1, '2023-05-01 19:21:35'),
(439, 8, 1, '2023-05-04 15:52:32'),
(440, 7, 1, '2023-05-06 11:55:13'),
(441, 51, 1, '2023-05-06 11:57:14'),
(442, 7, 1, '2023-05-06 11:58:18'),
(443, 7, 1, '2023-05-06 11:58:25'),
(444, 7, 1, '2023-05-06 12:00:28'),
(445, 7, 1, '2023-05-06 12:00:59'),
(446, 3, 1, '2023-05-07 12:10:27'),
(447, 2, 1, '2023-05-07 12:10:40'),
(448, 3, 1, '2023-05-07 12:10:46'),
(449, 5, 1, '2023-05-07 12:11:00'),
(450, 1, 1, '2023-05-07 12:14:15'),
(451, 2, 1, '2023-05-07 12:20:17'),
(452, 1, 1, '2023-05-07 12:20:27'),
(453, 6, 1, '2023-05-07 12:26:17'),
(454, 4, 1, '2023-05-08 14:49:57'),
(455, 4, 1, '2023-05-08 14:50:06'),
(456, 1, 1, '2023-05-08 14:50:19'),
(457, 1, 1, '2023-05-08 14:59:59'),
(458, 1, 1, '2023-05-08 15:46:09'),
(459, 1, 1, '2023-05-09 19:34:47'),
(460, 1, 1, '2023-05-09 19:44:03'),
(461, 1, 1, '2023-05-09 22:02:35'),
(462, 1, 1, '2023-05-09 22:02:36'),
(463, 1, 1, '2023-05-09 22:03:42'),
(464, 35, 1, '2023-05-09 22:52:14'),
(465, 4, 1, '2023-05-09 22:52:39'),
(466, 7, 1, '2023-05-10 12:49:48'),
(467, 1, 1, '2023-05-10 12:57:35'),
(468, 18, 1, '2023-05-10 12:57:42'),
(469, 3, 1, '2023-05-10 12:58:08'),
(470, 6, 1, '2023-05-10 13:10:14'),
(471, 1, 1, '2023-05-10 13:32:38'),
(472, 2, 1, '2023-05-10 14:42:54'),
(473, 6, 1, '2023-05-10 15:19:41'),
(474, 2, 1, '2023-05-13 12:20:13'),
(475, 6, 1, '2023-05-13 12:20:32'),
(476, 18, 1, '2023-05-13 13:15:21'),
(477, 18, 1, '2023-05-13 13:15:35'),
(478, 18, 1, '2023-05-13 13:16:26'),
(479, 35, 1, '2023-05-13 13:16:49'),
(480, 35, 1, '2023-05-13 13:17:16'),
(481, 35, 1, '2023-05-13 13:17:22'),
(482, 35, 1, '2023-05-13 13:25:21'),
(483, 35, 1, '2023-05-13 13:27:43'),
(484, 35, 1, '2023-05-13 13:28:54'),
(485, 39, 1, '2023-05-13 13:29:58'),
(486, 18, 1, '2023-05-13 13:35:29'),
(487, 4, 1, '2023-05-13 13:40:38'),
(488, 1, 1, '2023-05-13 13:42:09'),
(489, 2, 1, '2023-05-13 13:42:55'),
(490, 3, 1, '2023-05-13 13:43:14'),
(491, 44, 1, '2023-05-13 13:43:42'),
(492, 6, 1, '2023-05-13 13:43:52'),
(493, 17, 1, '2023-05-14 18:02:05'),
(494, 1, 1, '2023-05-14 18:02:40'),
(495, 1, 1, '2023-05-14 19:08:59'),
(496, 1, 1, '2023-05-14 19:17:43'),
(497, 1, 1, '2023-05-14 19:19:17'),
(498, 1, 1, '2023-05-14 19:21:04'),
(499, 1, 1, '2023-05-14 19:21:33'),
(500, 1, 1, '2023-05-14 19:22:10'),
(501, 1, 1, '2023-05-14 19:23:02'),
(502, 1, 1, '2023-05-14 19:23:20'),
(503, 8, 1, '2023-05-14 19:23:41'),
(504, 1, 1, '2023-05-14 19:23:56'),
(505, 1, 1, '2023-05-14 19:24:48'),
(506, 1, 1, '2023-05-14 19:25:11'),
(507, 8, 1, '2023-05-14 19:25:33'),
(508, 8, 1, '2023-05-14 19:28:39'),
(509, 8, 1, '2023-05-14 19:29:51'),
(510, 1, 1, '2023-05-14 19:30:06'),
(511, 1, 1, '2023-05-14 19:30:32'),
(512, 6, 1, '2023-05-14 19:30:52'),
(513, 1, 1, '2023-05-14 19:34:26'),
(514, 1, 1, '2023-05-14 19:44:05'),
(515, 1, 1, '2023-05-14 19:49:45'),
(516, 1, 1, '2023-05-14 20:28:18'),
(517, 1, 1, '2023-05-14 20:29:11'),
(518, 1, 1, '2023-05-14 20:29:30'),
(519, 1, 1, '2023-05-14 20:33:52'),
(520, 1, 1, '2023-05-14 20:35:56'),
(521, 1, 1, '2023-05-14 20:36:24'),
(522, 1, 1, '2023-05-14 20:37:22'),
(523, 1, 1, '2023-05-14 20:39:42'),
(524, 1, 1, '2023-05-14 20:41:50'),
(525, 1, 1, '2023-05-14 20:42:24'),
(526, 1, 1, '2023-05-14 20:43:42'),
(527, 1, 1, '2023-05-14 20:45:23'),
(528, 1, 1, '2023-05-14 20:50:41'),
(529, 1, 1, '2023-05-14 20:55:26'),
(530, 6, 1, '2023-05-14 20:58:18'),
(531, 6, 1, '2023-05-14 21:04:51'),
(532, 1, 1, '2023-05-14 21:07:47'),
(533, 1, 1, '2023-05-14 21:11:38'),
(534, 1, 1, '2023-05-14 21:14:27'),
(535, 1, 1, '2023-05-14 21:17:29'),
(536, 1, 1, '2023-05-14 21:22:25'),
(537, 1, 1, '2023-05-14 21:24:59'),
(538, 1, 1, '2023-05-14 21:27:29'),
(539, 1, 1, '2023-05-14 21:28:09'),
(540, 1, 1, '2023-05-14 21:28:38'),
(541, 1, 1, '2023-05-14 21:33:06'),
(542, 5, 1, '2023-05-14 21:37:52'),
(543, 5, 1, '2023-05-14 21:41:05'),
(544, 18, 1, '2023-05-14 21:41:42'),
(545, 18, 1, '2023-05-14 21:43:45'),
(546, 8, 1, '2023-05-14 21:44:16'),
(547, 18, 1, '2023-05-14 21:45:06'),
(548, 4, 1, '2023-05-14 21:54:23'),
(549, 1, 1, '2023-05-15 08:45:36'),
(550, 4, 1, '2023-05-15 08:46:11'),
(551, 1, 1, '2023-05-20 21:39:41'),
(552, 6, 1, '2023-05-21 10:46:04'),
(553, 18, 1, '2023-05-21 10:46:25'),
(554, 1, 1, '2023-05-21 10:47:25'),
(555, 10, 1, '2025-02-13 13:28:06'),
(556, 40, 1, '2025-02-13 13:47:06'),
(557, 40, 1, '2025-02-13 15:10:55'),
(558, 40, 1, '2025-02-13 15:15:43'),
(559, 40, 1, '2025-02-14 19:59:22'),
(560, 37, 1, '2025-02-14 20:00:42'),
(561, 37, 1, '2025-02-14 21:42:09'),
(562, 4, 1, '2025-02-18 15:42:35'),
(563, 4, 1, '2025-02-18 15:43:04'),
(564, 53, 1, '2025-02-18 21:10:01'),
(565, 53, 1, '2025-02-18 21:14:40'),
(566, 53, 1, '2025-02-18 21:17:00'),
(567, 2, 1, '2025-02-18 21:17:33'),
(568, 53, 1, '2025-02-18 21:59:35'),
(569, 53, 1, '2025-02-18 22:01:24'),
(570, 53, 1, '2025-02-18 22:02:38'),
(571, 53, 1, '2025-02-18 22:15:07'),
(572, 53, 1, '2025-02-18 22:15:41'),
(573, 53, 1, '2025-02-18 22:15:54'),
(574, 53, 1, '2025-02-18 22:15:58'),
(575, 53, 1, '2025-02-18 22:20:22'),
(576, 53, 1, '2025-02-19 22:01:58'),
(577, 53, 1, '2025-02-20 14:48:33'),
(578, 53, 1, '2025-02-20 14:49:41'),
(579, 53, 1, '2025-02-20 16:23:19'),
(580, 53, 1, '2025-02-20 16:25:06'),
(581, 53, 1, '2025-02-20 16:35:21'),
(582, 53, 1, '2025-02-20 16:40:19'),
(583, 53, 1, '2025-02-20 16:41:35'),
(584, 53, 1, '2025-02-20 16:50:44'),
(585, 53, 1, '2025-02-20 17:07:20'),
(586, 1, 1, '2025-02-20 22:50:18'),
(587, 4, 1, '2025-02-20 22:50:48'),
(588, 53, 1, '2025-02-20 22:52:29');

-- --------------------------------------------------------

--
-- Structure de la table `search_product`
--

CREATE TABLE `search_product` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `size`
--

INSERT INTO `size` (`id`, `name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, 'XXL'),
(6, 'XXXL');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_token_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `reset_password_token`, `reset_password_token_expires_at`) VALUES
(1, 'meher.arbi@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$gqBxngaBC5FpkEZUfYgN2Olii2IuvW.ZMYmYzhrUvGyeu3sEBi5mO', 'Meher', 'Arbi', NULL, NULL),
(2, 'user@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Zm9RR3dFdmVmeFV2ZWVPVw$TMcfwd8HGy5RGxnLCPm2cWNq4Es9fe6gD4/uxtbsCec', 'user', 'user', NULL, NULL),
(3, 'ka@gmail.com', '[]', '$2y$13$m/AeYWLDRodogFhZs9lbwucNlxX6WWaNlnedGuVyUsO0cnC.XfeXO', 'kia', 'kola', NULL, NULL),
(4, 'my@gmail.com', '[]', '$2y$13$UWyG8YbPRfSuGCGTmm.sPeGSQl65s08WaZZlF2t5gzL3VA.rPBV.2', 'my', 'mo', NULL, NULL),
(5, 'meharbi@gmail.com', '[]', '$2y$13$qF/N0b94YEkCb/JSwg6T.O7qgrkhRIb5OWpB45QPXK9eZnI7QVUla', 'dzed', 'dzdz', NULL, NULL),
(7, 'az@gmail.com', '[]', '$2y$13$GNFjXsFKCuZ5NQBTH4U5tOkEHSdHmkgYIA3Xouzm5CzsuoNnaWOVG', 'dzed', 'dzdz', NULL, NULL),
(8, 'yasser@gmail.com', '[]', '$2y$13$JdCF3I4UG8z95Ei.hTjeaOYtOaZUs7HyFPP4eo0pFD1daFLXF4dPe', 'Meher', 'yasser', NULL, NULL),
(9, 'msi@gmail.com', '[]', '$2y$13$XCpAXVZQTdocaMhhqtWD9OnuZSGXles5OXbdHYuYUsPXoNc7SFyTu', 'q', 's', NULL, NULL),
(10, 'emna.tanitoss@gmail.com', '[]', 'abc123', 'emna', 'boudh', 'abcd123', '2023-04-11 09:21:00'),
(15, 'meher.symfony@gmail.com', '[]', '$2y$13$vCmOW6qQD54YitRMdWIYFecvTjBDkK3k71NKm4uWXIwkJYDqpjQdq', 'Meher', 'Arbi', NULL, NULL),
(16, 'meher.france@gmail.com', '[]', '$2y$13$AVo1oETWozeH1zNRAD7FhuhJbb4b/Z5Y2RPfK8IdVoNhM9tJG1D1y', 'ZYko', 'Arbi', NULL, NULL),
(17, 'meher.a@gmail.com', '[]', '$2y$13$54drXDkraHzG/adx/cOVS.u8G/wfC/z3blmMat3biIKADUGASMqh.', 'Meher', 'Arbi', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `notification_counter`
--
ALTER TABLE `notification_counter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D43C1ECFA76ED395` (`user_id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`),
  ADD KEY `IDX_845CA2C14584665A` (`product_id`),
  ADD KEY `IDX_845CA2C1423285E6` (`sizes_id`);

--
-- Index pour la table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `IDX_2530ADE68D9F6D38` (`order_id`),
  ADD KEY `IDX_2530ADE64584665A` (`product_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64617F034584665A` (`product_id`);

--
-- Index pour la table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`product_id`,`size_id`),
  ADD KEY `IDX_7A2806CB4584665A` (`product_id`),
  ADD KEY `IDX_7A2806CB498DA827` (`size_id`);

--
-- Index pour la table `recently_viewed_product`
--
ALTER TABLE `recently_viewed_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8708D39E4584665A` (`product_id`),
  ADD KEY `IDX_8708D39EA76ED395` (`user_id`);

--
-- Index pour la table `search_product`
--
ALTER TABLE `search_product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `notification_counter`
--
ALTER TABLE `notification_counter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recently_viewed_product`
--
ALTER TABLE `recently_viewed_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT pour la table `search_product`
--
ALTER TABLE `search_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `notification_counter`
--
ALTER TABLE `notification_counter`
  ADD CONSTRAINT `FK_D43C1ECFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1423285E6` FOREIGN KEY (`sizes_id`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `FK_845CA2C14584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FK_2530ADE64584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2530ADE68D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `FK_7A2806CB4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7A2806CB498DA827` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recently_viewed_product`
--
ALTER TABLE `recently_viewed_product`
  ADD CONSTRAINT `FK_8708D39E4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_8708D39EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
