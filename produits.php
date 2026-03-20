<?php
require_once 'database.php';
require_once 'functions.php';

$query = $pdo->query("SELECT * FROM produits");
$produits = $query->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<title>Street Wear Shop</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<header>
STREET WEAR SHOP
</header>


<main class="section">


<div class="section-top">

<h2>T-shirts</h2>

<div class="filters">

<select id="categorie">
<option value="all">Toutes les catégories</option>
<option value="basic">Basic</option>
<option value="limited">Edition limitée</option>
<option value="special">Spécial</option>
<option value="vintage">Vintage</option>
<option value="oversize">Oversize</option>
<option value="sport">Sport</option>
</select>

<button onclick="filtrerProduits()">Filtrer</button>

</div>

</div>



<section class="products">

<?php foreach($produits as $produit){ 

$prixTVAC = $produit['prix_htva'] * 1.21;

?>

<div class="card">

<img src="images/<?php echo $produit['image']; ?>">

<h3><?php echo $produit['nom_produit']; ?></h3>

<p><?php echo $produit['description_court_produit']; ?></p>

<p class="price">
<?php echo number_format($prixTVAC,2); ?> € TVAC
</p>

<a class="btn" href="produit.php?id=<?php echo $produit['id_produit']; ?>">
Voir le produit
</a>

</div>

<?php } ?>

</section>

</main>


<footer>
© 2026 Street Wear Shop
</footer>


<script>

function filtrerProduits(){

let categorie = document.getElementById("categorie").value;
let produits = document.querySelectorAll(".card");

produits.forEach(function(produit){

produit.style.display = "block";

});

}

</script>

</body>
</html>