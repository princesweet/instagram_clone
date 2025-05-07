<?php

include("db/connection.php");

if (isset($_POST['update_post_btn'])) {
    $post_id = $_POST['post_id'];
    $old_image_name = $_POST['old_image_name'];
    $hashtags = $_POST['hashtags'];
    $caption = $_POST['caption'];
    $new_image = $_FILES['new_image']['tmp_name'];

    if ($new_image != "") {
        $image_name = strval(time()) . ".jpeg";
    } else {
        $image_name = $old_image_name;
    }

    $stmt = $conn->prepare("UPDATE posts SET image = ?, caption = ?, hashtags = ? WHERE id = ?");
    $stmt->bind_param("sssi", $image_name, $caption, $hashtags, $post_id);

    if ($stmt->execute()) {
        if ($new_image != "") {
            //store in folder
            move_uploaded_file($new_image, "assets/images/" . $image_name);
        }
        header("location: profile.php?success_message?post has been updated successfully");
        exit();
    } else {
        header("location: edit_post?error_message?error occured,try again");
        exit();
    }

} else {
    header("location: profile.php?error_message?error occured,try again");
    exit();
}



?>