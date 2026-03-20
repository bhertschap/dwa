-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 20 mars 2026 à 08:33
-- Version du serveur : 10.6.21-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `urfcudwheb_dwa`
--

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(100) NOT NULL,
  `description_court_produit` varchar(255) NOT NULL,
  `prix_htva` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `disponibilité` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `description_longue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `description_court_produit`, `prix_htva`, `stock`, `disponibilité`, `image`, `description_longue`) VALUES
(1, 'T-shirt Basic Blanc', 'T-shirt basique en coton bio.', 12.00, 0, '20', 'TshirtBlancCoton.jpg', NULL),
(3, 'T-shirt Logo Gold', 'T-shirt streetwear édition limitée avec logo doré.', 25.00, 0, '8', 'TshirtGold.jpg', NULL),
(4, 'T-shirt Été Florale', 'T-shirt avec motif floral exotique.', 20.00, 0, '12', 'TshirtMotifFleur.jpg', NULL),
(5, 'T-shirt Vintage Rock', 'T-shirt rock vintage avec design audacieux.', 33.00, 0, '6', 'TshirtRock.jpg', NULL),
(6, 'T-shirt Oversize', 'T-shirt oversize confortable couleur kaki.', 20.00, 0, '14', 'TshirtOversize.jpg', NULL),
(7, 'T-shirt Sport Bleu', 'T-shirt sportif respirant couleur bleu.', 18.00, 0, '16', 'TshirtSport.jpg', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
