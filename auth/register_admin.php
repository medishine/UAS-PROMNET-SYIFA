<?php
include '../config/db.php';
include '../config/helper.php';

if(isset($_POST['register'])){
  $name = $_POST['name'];
  $email = $_POST['email'];
  $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

  $cek = mysqli_query($conn,"SELECT * FROM users WHERE email='$email'");
  if(mysqli_num_rows($cek)>0){
    $error="Email sudah digunakan!";
  } else {
    mysqli_query($conn,"INSERT INTO users(name,email,password,role) VALUES('$name','$email','$password','admin')");
    $success="Admin berhasil dibuat! Silakan login.";
  }
}
?>

<!doctype html>
<html>
<head>
  <title>Register Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/pastel.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="card card-soft p-4 col-md-6 mx-auto">
    <h3 class="fw-bold">🛡️ Register Admin</h3>
    <p class="text-muted">Buat akun admin baru untuk EventHub</p>

    <?php if(isset($error)) echo "<div class='alert alert-danger'>$error</div>"; ?>
    <?php if(isset($success)) echo "<div class='alert alert-success'>$success</div>"; ?>

    <form method="POST">
      <input class="form-control soft-input mb-2" name="name" placeholder="Nama Admin" required>
      <input class="form-control soft-input mb-2" name="email" type="email" placeholder="Email Admin" required>
      <input class="form-control soft-input mb-2" name="password" type="password" placeholder="Password" required>
      <button class="btn btn-pastel w-100" name="register">Buat Admin</button>

      <div class="text-center mt-3">
        <a href="login.php">← Kembali Login</a>
      </div>
    </form>
  </div>
</div>
</body>
</html>
