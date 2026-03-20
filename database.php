<?php

$host = "localhost";
$dbname = "urfcudwheb_dwa";
$user = "urfcudwheb_dwa";
$password = 'i:7UQw-"Tu';

try {

$pdo = new PDO(
"mysql:host=$host;dbname=$dbname;charset=utf8",
$user,
$password
);

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

}

catch(PDOException $e){

die("Erreur connexion DB");

}