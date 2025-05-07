<?php include("includes/header.php"); ?>

<?php

include("db/connection.php");

if (isset($_POST['search_input'])) {

  $search_input = $_POST['search_input'];
  $search_pattern = "%" . $search_input . "%";

  $stmt = $conn->prepare("SELECT * FROM users WHERE username LIKE ? LIMIT 12");
  $stmt->bind_param("s", $search_pattern);
  $stmt->execute();
  $users = $stmt->get_result();
} else {
  //default keyword
  $search_input = "john";

  $search_pattern = "%" . $search_input . "%";

  $stmt = $conn->prepare("SELECT * FROM users WHERE username LIKE ? LIMIT 12");
  $stmt->bind_param("s", $search_pattern);
  $stmt->execute();
  $users = $stmt->get_result();

}


?>


<div class="mt-5 mx-5">
  <form action="search_user.php" method="POST">
    <div class="form-group search-component">
      <input type="text" class="form-control" placeholder="search..." name="search_input" />
      <button type="submit" class="search-btn" name="search_btn">
        search
      </button>
    </div>
  </form>
  <ul class="list-group">
    <?php foreach ($users as $user) { ?>
      <?php if ($user['id'] != $_SESSION['id']) { ?>
        <li class="list-group-item search-result-item">
          <img src="<?php echo "assets/images/" . $user['image']; ?>" alt="" />
          <div style="width: 100%;">
            <p>
              <?php echo $user['username']; ?>
            </p>
            <span>
              <?php echo substr($user['bio'], 0, 8); ?>
            </span>
          </div>
          <div class="search-result-item-btn">
            <form action="other_user_profile.php" method="post">
              <input type="hidden" name="other_user_id" value="<?php echo $user['id']; ?>">
              <button type="submit">Visit Profile</button>
            </form>
          </div>
        </li>
      <?php } ?>
    <?php } ?>
  </ul>
</div>

<!--Script-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>

</html>