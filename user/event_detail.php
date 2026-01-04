<?php
include '../config/db.php';
include '../config/helper.php';
checkLogin();


$id = $_GET['id'];
$e = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * FROM events WHERE id=$id"));
?>


<!doctype html>
<html>
<head>
<title>Detail Event</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<a href="index.php" class="btn btn-secondary btn-sm">← Back</a>
<div class="card mt-3">
<img src="../assets/uploads/<?= $e['image'] ?>" style="height:300px; object-fit:cover;">
<div class="card-body">
<h3><?= $e['title'] ?></h3>
<p><?= $e['description'] ?></p>
<p>📍 <?= $e['location'] ?> | 📅 <?= $e['event_date'] ?></p>
<h5>Kuota tersisa: <?= $e['quota'] ?></h5>


<?php if($e['quota']>0){ ?>
<a href="daftar_event.php?id=<?= $e['id'] ?>" class="btn btn-success">Daftar Event</a>
<?php } else { ?>
<button class="btn btn-danger" disabled>Kuota Habis</button>
<?php } ?>
</div>
</div>
</div>
</body>
</html>