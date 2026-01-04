<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


if(isset($_GET['approve'])){
$id=$_GET['approve'];
mysqli_query($conn,"UPDATE registrations SET status='Approved' WHERE id=$id");
redirect('registrations.php');
}
if(isset($_GET['reject'])){
$id=$_GET['reject'];
mysqli_query($conn,"UPDATE registrations SET status='Rejected' WHERE id=$id");
redirect('registrations.php');
}


$q = mysqli_query($conn,"SELECT registrations.*, users.name, events.title FROM registrations
JOIN users ON registrations.user_id=users.id
JOIN events ON registrations.event_id=events.id
ORDER BY registrations.id DESC");
?>


<!doctype html>
<html>
<head>
<title>Transaksi Pendaftaran</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Transaksi Pendaftaran</h3>
<a href="dashboard.php" class="btn btn-secondary btn-sm">← Dashboard</a>


<table class="table table-bordered mt-3">
<tr><th>No</th><th>User</th><th>Event</th><th>Status</th><th>Tanggal</th><th>Aksi</th></tr>
<?php $no=1; while($r=mysqli_fetch_assoc($q)) { ?>
<tr>
<td><?= $no++ ?></td>
<td><?= $r['name'] ?></td>
<td><?= $r['title'] ?></td>
<td><?= $r['status'] ?></td>
<td><?= $r['created_at'] ?></td>
<td>
<a href="registrations.php?approve=<?= $r['id'] ?>" class="btn btn-success btn-sm">Approve</a>
<a href="registrations.php?reject=<?= $r['id'] ?>" class="btn btn-danger btn-sm">Reject</a>
</td>
</tr>
<?php } ?>
</table>
</div>
</body>
</html>