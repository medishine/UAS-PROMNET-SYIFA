<?php
include '../config/db.php';
include '../config/helper.php';
checkLogin();


$event_id = $_GET['id'];
$user_id = $_SESSION['user']['id'];


$event = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * FROM events WHERE id=$event_id"));


if($event['quota']<=0){
die("Kuota habis!");
}


$cek = mysqli_query($conn,"SELECT * FROM registrations WHERE user_id=$user_id AND event_id=$event_id");
if(mysqli_num_rows($cek)>0){
die("Anda sudah terdaftar pada event ini.");
}


mysqli_query($conn,"INSERT INTO registrations(user_id,event_id,status) VALUES($user_id,$event_id,'Pending')");
mysqli_query($conn,"UPDATE events SET quota = quota - 1 WHERE id=$event_id");


redirect('my_registrations.php');
?>