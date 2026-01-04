<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();
$q = mysqli_query($conn,"SELECT * FROM categories ORDER BY id DESC");
?>


<!doctype html>
<html>
<head>
<title>Kategori</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Data Kategori</h3>
<a href="dashboard.php" class="btn btn-secondary btn-sm">← Dashboard</a>
<a href="category_add.php" class="btn btn-primary btn-sm">+ Tambah</a>


<table class="table table-bordered mt-3">
<tr><th>No</th><th>Nama</th><th>Aksi</th></tr>
<?php $no=1; while($c=mysqli_fetch_assoc($q)) { ?>
<tr>
<td><?= $no++ ?></td>
<td><?= $c['name'] ?></td>
<td>
<a href="category_edit.php?id=<?= $c['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
<a href="category_delete.php?id=<?= $c['id'] ?>" onclick="return confirm('Hapus?')" class="btn btn-danger btn-sm">Hapus</a>
</td>
</tr>
<?php } ?>
</table>
</div>
</body>
</html>