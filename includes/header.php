<?php

session_start();

//if user id is not in session then they are not logged in

if (!isset($_SESSION['id'])) {

    header("location: login.php");
    exit();


}



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Instagram-Clone</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
</head>

<body>
    <!-- navigation -->
    <nav class="navbar">
        <div class="nav-wrapper">
            <img class="brand-img" src="assets/images/logo.png" />

            <form action="search_post.php" method="post" class="search-form">
                <input type="text" class="search-box" placeholder="search.." name="search_input" />
            </form>


            <div class="nav-items">
                <a href="index.php" style="color: #000;"><i class="icon fas fa-home"></i></a>
                <a href="discover.php" style="color: #000;"><i class="icon fas fa-plus"></i></a>
                <a href="liked_post.php" style="color: #000;"><i class="icon fas fa-heart"></i></a>

                <div class="icon user-profile">
                    <a href="profile.php" style="color: #000;"><i class="fas fa-user"></i></a>
                </div>
            </div>
        </div>
    </nav>