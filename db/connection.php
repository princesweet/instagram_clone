<?php
// Check if running locally or on Azure
if ($_SERVER['HTTP_HOST'] == 'localhost' || $_SERVER['HTTP_HOST'] == '127.0.0.1') {
    // Local MySQL Workbench Connection
    $host = "localhost";
    $username = "root";
    $password = "admin";
    $database = "instagram";
    $conn = new mysqli($host, $username, $password, $database);
} else {
    // Azure MySQL Connection
    $host = "princeserver.mysql.database.azure.com";
    $username = "albani";
    $password = "Prince4luk";
    $database = "instagram_clone";
    $conn = mysqli_init();
    mysqli_ssl_set($conn, NULL, NULL, "/var/www/html/BaltimoreCyberTrustRoot.crt.pem", NULL, NULL);
    mysqli_real_connect($conn, $host, $username, $password, $database, 3306, NULL, MYSQLI_CLIENT_SSL);
}

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Remove "echo" in production to avoid exposing connection status
// echo "Connected successfully";
?>