<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


$id=$_GET['id'];
$c = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * FROM categories WHERE id=$id"));


if(isset($_POST['update'])){
$name=$_POST['name'];
mysqli_query($conn,"UPDATE categories SET name='$name' WHERE id=$id");
redirect('category_list.php');
}
?>


<!doctype html>
<html>
<head>
<title>Edit Kategori</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Edit Kategori</h3>
<a href="category_list.php" class="btn btn-secondary btn-sm">← Back</a>


<form method="POST" class="card p-3 mt-3">
<label>Nama</label>
<input name="name" class="form-control mb-2" value="<?= e($c['name']) ?>" required>
<button class="btn btn-warning" name="update">Update</button>
</form>
</div>
</body>
</html>