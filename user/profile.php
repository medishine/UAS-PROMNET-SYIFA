<?php
include '../config/db.php';
include '../config/helper.php';
checkLogin();


$id = $_SESSION['user']['id'];
$user = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * FROM users WHERE id=$id"));


if(isset($_POST['update'])){
$name = $_POST['name'];
$phone = $_POST['phone'];
$address = $_POST['address'];


mysqli_query($conn,"UPDATE users SET name='$name', phone='$phone', address='$address' WHERE id=$id");
$_SESSION['user'] = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * FROM users WHERE id=$id"));
$success = "Profile berhasil diupdate";
}
?>


<!doctype html>
<html>
<head>
<title>Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<a href="index.php" class="btn btn-secondary btn-sm">← Back</a>
<h3 class="mt-3">Profile Saya</h3>
<?php if(isset($success)) echo "<div class='alert alert-success'>$success</div>"; ?>


<form method="POST" class="card p-3 mt-3">
<label>Nama</label>
<input name="name" class="form-control mb-2" value="<?= e($user['name']) ?>" required>
<label>Telepon</label>
<input name="phone" class="form-control mb-2" value="<?= e($user['phone']) ?>">
<label>Alamat</label>
<textarea name="address" class="form-control mb-2"><?= e($user['address']) ?></textarea>
<button class="btn btn-primary" name="update">Update Profile</button>
</form>
</div>
</body>
</html>