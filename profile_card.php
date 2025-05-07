<div class="profile-card">
    <div class="profile-pic">
        <img src="<?php echo "assets/images/" . $_SESSION['image']; ?>" alt="" />
    </div>
    <div>
        <p class="username">
            <?php echo $_SESSION['username']; ?>
        </p>
        <p class="sub-text">
            <?php echo substr($_SESSION['bio'], 0, 15); ?>
        </p>
    </div>
    <form action="logout.php" method="get">
        <button class="logout-btn">logout</button>
    </form>
</div>