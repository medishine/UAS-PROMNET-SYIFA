<?php
include '../config/db.php';
include '../config/helper.php';
checkLogin();


$user_id = $_SESSION['user']['id'];
$q = mysqli_query($conn,"SELECT registrations.*, events.title FROM registrations JOIN events ON registrations.event_id=events.id
WHERE registrations.user_id=$user_id ORDER BY registrations.id DESC");
?>


<!doctype html>
<html>
<head>
<title>Pendaftaran Saya</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<a href="index.php" class="btn btn-secondary btn-sm">← Back</a>
<h3 class="mt-3">Pendaftaran Saya</h3>


<table class="table table-bordered mt-3">
<tr><th>No</th><th>Event</th><th>Status</th><th>Tanggal</th></tr>
<?php $no=1; while($r=mysqli_fetch_assoc($q)) { ?>
<tr>
<td><?= $no++ ?></td>
<td><?= $r['title'] ?></td>
<td>
<span class="badge bg-<?= $r['status']=='Approved'?'success':($r['status']=='Rejected'?'danger':'warning') ?>">
<?= $r['status'] ?>
</span>
</td>
<td><?= $r['created_at'] ?></td>
</tr>
<?php } ?>
</table>
</div>
</body>
</html>