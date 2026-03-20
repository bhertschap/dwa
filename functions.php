<?php

function retrieveBuyableProducts($pdo){

$sql = "SELECT * FROM produits WHERE disponibilité > 0";

$stmt = $pdo->query($sql);

return $stmt->fetchAll(PDO::FETCH_ASSOC);

}

function retrieveProductById($pdo,$id){

$sql = "SELECT * FROM produits WHERE id_produit = :id";

$stmt = $pdo->prepare($sql);

$stmt->execute(["id"=>$id]);

return $stmt->fetch(PDO::FETCH_ASSOC);

}