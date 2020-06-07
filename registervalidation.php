<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$server="localhost";
$user="iris";
$pass="password";
$db="Login";

try{
    $connection= new PDO ("mysql:host=$server;dbname=$db", $user,$pass);
    print_r($_POST);
    print_r($_POST['formlogin']);
    $query='INSERT INTO USER (User, Password, Email ) VALUES ("'.$_POST["formlogin"].'","'.$_POST["formmdp"].'","'.$_POST["formemail"].'")';
    echo $query;
    $connection->query($query);
    echo  "Chouette! Tu es enregistré.";
    }
    catch (Exception $e){
        echo "Connectionerror:".$e;
        die();
    }
?>
 