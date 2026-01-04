<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
$q = mysqli_query($conn,"SELECT events.*, categories.name as cat FROM events LEFT JOIN categories ON events.category_id=categories.id
WHERE title LIKE '%$keyword%' ORDER BY id DESC");
?>


<!doctype html>
<html>
<head>
<title>Admin - Event</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Data Event</h3>
<a href="dashboard.php" class="btn btn-secondary btn-sm">← Dashboard</a>
<a href="event_add.php" class="btn btn-primary btn-sm">+ Tambah Event</a>


<form class="d-flex mt-3" method="GET">
<input class="form-control" name="keyword" placeholder="Search" value="<?= e($keyword) ?>">
<button class="btn btn-success ms-2">Cari</button>
</form>


<table class="table table-bordered mt-3">
<tr>
<th>No</th><th>Gambar</th><th>Judul</th><th>Kategori</th><th>Tanggal</th><th>Kuota</th><th>Aksi</th>
</tr>
<?php $no=1; while($e=mysqli_fetch_assoc($q)) { ?>
<tr>
<td><?= $no++ ?></td>
<td><img src="../assets/uploads/<?= $e['image'] ?>" width="80"></td>
<td><?= $e['title'] ?></td>
<td><?= $e['cat'] ?></td>
<td><?= $e['event_date'] ?></td>
<td><?= $e['quota'] ?></td>
<td>
<a href="event_edit.php?id=<?= $e['id'] ?>" class="btn btn-warning btn-sm">Edit</a>
<a href="event_delete.php?id=<?= $e['id'] ?>" onclick="return confirm('Hapus?')" class="btn btn-danger btn-sm">Hapus</a>
</td>
</tr>
<?php } ?>
</table>
</div>
</body>
</html>