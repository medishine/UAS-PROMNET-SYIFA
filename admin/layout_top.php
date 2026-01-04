<?php include '../config/helper.php'; checkAdmin(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Admin - EventHub</title>
  <link href="../assets/sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="../assets/sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">

<div id="wrapper">

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.php">
    <div class="sidebar-brand-icon">
      <i class="fas fa-heart"></i>
    </div>
    <div class="sidebar-brand-text mx-3">EventHub</div>
  </a>

  <hr class="sidebar-divider my-0">

  <li class="nav-item"><a class="nav-link" href="dashboard.php"><i class="fas fa-fw fa-home"></i><span>Dashboard</span></a></li>
  <li class="nav-item"><a class="nav-link" href="event_list.php"><i class="fas fa-fw fa-calendar"></i><span>Event</span></a></li>
  <li class="nav-item"><a class="nav-link" href="category_list.php"><i class="fas fa-fw fa-tags"></i><span>Kategori</span></a></li>
  <li class="nav-item"><a class="nav-link" href="registrations.php"><i class="fas fa-fw fa-receipt"></i><span>Transaksi</span></a></li>
  <li class="nav-item"><a class="nav-link" href="users.php"><i class="fas fa-fw fa-users"></i><span>Users</span></a></li>

  <hr class="sidebar-divider">
  <li class="nav-item"><a class="nav-link" href="../auth/logout.php"><i class="fas fa-fw fa-sign-out-alt"></i><span>Logout</span></a></li>
</ul>

<div id="content-wrapper" class="d-flex flex-column">
<div id="content">
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
  <span class="ml-3 font-weight-bold text-primary">Admin Panel SB Admin 2</span>
</nav>

<div class="container-fluid">
