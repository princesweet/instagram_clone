<?php

include("db/connection.php");

$user_id = $_SESSION['id'];

//create the post

$stmt = $conn->prepare("SELECT * FROM posts WHERE user_id = ? ORDER BY id DESC");
$stmt->bind_param("i", $user_id);

if ($stmt->execute()) {
    $posts = $stmt->get_result();
} else {
    $posts = [];
}



?>