<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


$eventCount = mysqli_fetch_assoc(mysqli_query($conn,"SELECT COUNT(*) as total FROM events"))['total'];
$userCount = mysqli_fetch_assoc(mysqli_query($conn,"SELECT COUNT(*) as total FROM users WHERE role='user'"))['total'];
$regCount = mysqli_fetch_assoc(mysqli_query($conn,"SELECT COUNT(*) as total FROM registrations"))['total'];
?>


<!doctype html>
<html>
<head>
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
<div class="container">
<a class="navbar-brand" href="#">Admin EventHub</a>
<div class="ms-auto">
<a href="event_list.php" class="btn btn-outline-light btn-sm">Events</a>
<a href="category_list.php" class="btn btn-outline-light btn-sm">Kategori</a>
<a href="registrations.php" class="btn btn-warning btn-sm">Transaksi</a>
<a href="users.php" class="btn btn-outline-light btn-sm">Users</a>
<a href="../auth/logout.php" class="btn btn-danger btn-sm">Logout</a>
</div>
</div>
</nav>


<div class="container mt-4">
<h3>Dashboard</h3>
<div class="row mt-3">
<div class="col-md-4"><div class="card p-3">Total Event: <b><?= $eventCount ?></b></div></div>
<div class="col-md-4"><div class="card p-3">Total User: <b><?= $userCount ?></b></div></div>
<div class="col-md-4"><div class="card p-3">Total Pendaftaran: <b><?= $regCount ?></b></div></div>
</div>
</div>
</body>
</html>