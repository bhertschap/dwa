-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 20 mars 2026 à 08:36
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
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `ID_categorie` int(11) NOT NULL,
  `nom_cat` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_produit`
--

CREATE TABLE `categorie_produit` (
  `id_produit` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postale` varchar(20) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `email`, `mot_de_passe`, `adresse`, `code_postale`, `ville`) VALUES
(1, 'Client A', 'Prénom A', 'a@mail.com', NULL, NULL, NULL, 'Ville A'),
(2, 'Client B', 'Prénom B', 'b@mail.com', NULL, NULL, NULL, 'Ville B');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `ID_commande` int(11) NOT NULL,
  `ID_client` int(11) NOT NULL,
  `Date_commande` datetime NOT NULL,
  `total_payer_htva` decimal(10,2) NOT NULL,
  `total_payer_tvac` decimal(10,2) NOT NULL,
  `adresse_postale_livraison` varchar(255) NOT NULL,
  `email_contact` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`ID_commande`, `ID_client`, `Date_commande`, `total_payer_htva`, `total_payer_tvac`, `adresse_postale_livraison`, `email_contact`) VALUES
(1, 0, '2026-02-20 10:10:00', 35.00, 42.00, '10 rue Test Bruxelles', 'client@mail.com'),
(2, 0, '2026-02-20 10:20:00', 85.00, 103.00, '20 avenue Demo Liège', 'client2@mail.com');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id_ligne_commande` int(11) NOT NULL,
  `id_produits` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire_htva` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`ID_categorie`);

--
ALTER TABLE `categorie_produit`
  ADD PRIMARY KEY (`id_produit`,`id_categorie`);

-- Contraintes de clés étrangères pour relier les tables
ALTER TABLE `categorie_produit`
  ADD CONSTRAINT `fk_categorie_produit_produit` FOREIGN KEY (`id_produit`) REFERENCES `produits`(`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_categorie_produit_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie`(`ID_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client` FOREIGN KEY (`ID_client`) REFERENCES `client`(`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_produit` FOREIGN KEY (`id_produits`) REFERENCES `produits`(`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ligne_commande_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande`(`ID_commande`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ID_commande`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id_ligne_commande`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `ID_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
