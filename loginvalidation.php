<?php


ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$server="localhost";
$user="iris";
$pass="password";
$db="Login";

$login=$_POST['controlelogin'];
$password =$_POST['controlemdp'];

// cookies d'enregistrement et validation
setcookie('pseudo', htmlspecialchars($_POST['controlelogin']), time() + 24*3600, null, null, false, true);





$connection= new PDO ("mysql:host=$server;dbname=$db", $user,$pass);
$query='SELECT COUNT(*) AS nbr FROM USER WHERE User = "'.$login.'" AND Password="'.$password.'"';
$resultat = $connection->query($query);

foreach ($resultat as $row){
    $nbUser = $row["nbr"];
}

echo $nbUser;

if ($nbUser == 1)
{ echo "féliciation, vous êtes connecté !";
header('Location: madb.php');
}
else 
{ echo "Erreur de Login ou de Mot de passe !";
}




?>
