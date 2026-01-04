<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


if(isset($_POST['save'])){
$name = $_POST['name'];
mysqli_query($conn,"INSERT INTO categories(name) VALUES('$name')");
redirect('category_list.php');
}
?>


<!doctype html>
<html>
<head>
<title>Tambah Kategori</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Tambah Kategori</h3>
<a href="category_list.php" class="btn btn-secondary btn-sm">← Back</a>


<form method="POST" class="card p-3 mt-3">
<label>Nama</label>
<input name="name" class="form-control mb-2" required>
<button class="btn btn-primary" name="save">Simpan</button>
</form>
</div>
</body>
</html>