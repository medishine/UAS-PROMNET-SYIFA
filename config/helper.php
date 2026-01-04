<?php
session_start();

function redirect($url){
  header("Location: $url");
  exit;
}

function checkLogin(){
  if(!isset($_SESSION['user'])) redirect('../auth/login.php');
}

function checkAdmin(){
  if(!isset($_SESSION['user']) || $_SESSION['user']['role']!='admin') redirect('../auth/login.php');
}

function e($str){
  return htmlspecialchars($str);
}
?>
