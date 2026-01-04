<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


$id = $_GET['id'];
mysqli_query($conn,"DELETE FROM events WHERE id=$id");
redirect('event_list.php');
?>