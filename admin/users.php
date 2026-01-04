<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


$q = mysqli_query($conn,"SELECT * FROM users ORDER BY id DESC");
?>


<!doctype html>
<html>
<head>
<title>Data User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Data User</h3>
<a href="dashboard.php" class="btn btn-secondary btn-sm">← Dashboard</a>


<table class="table table-bordered mt-3">
<tr><th>No</th><th>Nama</th><th>Email</th><th>Role</th><th>Telepon</th></tr>
<?php $no=1; while($u=mysqli_fetch_assoc($q)) { ?>
<tr>
<td><?= $no++ ?></td>
<td><?= e($u['name']) ?></td>
<td><?= e($u['email']) ?></td>
<td><?= $u['role'] ?></td>
<td><?= e($u['phone']) ?></td>
</tr>
<?php } ?>
</table>
</div>
</body>
</html>