<?php
include '../config/db.php';
include '../config/helper.php';

if(isset($_POST['login'])){
  $email = $_POST['email'];
  $password = $_POST['password'];

  $q = mysqli_query($conn,"SELECT * FROM users WHERE email='$email'");
  $user = mysqli_fetch_assoc($q);

  if($user && password_verify($password,$user['password'])){
    $_SESSION['user'] = $user;
    if($user['role']=='admin') redirect('../admin/dashboard.php');
    else redirect('../user/index.php');
  } else $error = "Email / Password salah!";
}
?>

<!doctype html>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <link href="../assets/pastel.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="card card-soft p-4 col-md-6 mx-auto">
    <div class="text-center">
      <img src="../assets/uploads/favicon.jpg" width="90" style="border-radius:18px;">
    </div>
    <h3 class="fw-bold mt-3 text-center">Login EventHub</h3>
    <p class="text-muted text-center">Masuk sebagai user / admin ✨</p>

    <?php if(isset($error)) echo "<div class='alert alert-danger'>$error</div>"; ?>

    <form method="POST">
      <input class="form-control soft-input mb-2" name="email" type="email" placeholder="Email" required>
      <input class="form-control soft-input mb-2" name="password" type="password" placeholder="Password" required>
      <button class="btn btn-pastel w-100" name="login">Login</button>

      <div class="text-center mt-3">
        <a href="register.php">Register User</a> | <a href="register_admin.php">Register Admin</a>
      </div>
      <div class="text-center mt-2">
        <a href="../index.php">← Kembali ke Landing</a>
      </div>
    </form>
  </div>
</div>
</body>
</html>
