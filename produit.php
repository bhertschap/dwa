<?php

require_once "database.php";
require_once 'functions.php'; 

define("TVA",0.21);

$id = $_GET["id"] ?? 0;

$sql = "SELECT * FROM produits WHERE id_produit = :id";

$stmt = $pdo->prepare($sql);

$stmt->execute(["id"=>$id]);

$product = $stmt->fetch(PDO::FETCH_ASSOC);

if(!$product){

echo "Produit introuvable";
exit;

}

$prix_htva = $product["prix_htva"];
$prix_tvac = $prix_htva*(1+TVA);

?>

<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<title><?php echo $product["nom_produit"]; ?></title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<header>
STREET WEAR SHOP
</header>

<main class="section">

<article class="product-detail">

<img src="images/<?php echo $product["image"]; ?>">

<section class="product-info">

<h1><?php echo $product["nom_produit"]; ?></h1>

<p><?php echo $product["description_court_produit"]; ?></p>

<p><strong>Prix HTVA :</strong> <?php echo $prix_htva; ?> €</p>

<p><strong>Prix TVAC :</strong> <?php echo number_format($prix_tvac,2); ?> €</p>

<p class="stock">
✔ En stock : <?php echo $product["disponibilité"]; ?> pièces
</p>

<p>Quantité :</p>

<select>
<option>1</option>
<option>2</option>
<option>3</option>
</select>

<br><br>

<button class="btn-panier">
Ajouter au panier
</button>

</section>

</article>

</main>

</body>
</html>