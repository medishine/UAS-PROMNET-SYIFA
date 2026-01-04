<!doctype html>
<html>
<head>
  <title>About - EventHub</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <link href="assets/pastel.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container">
    <a class="navbar-brand fw-bold d-flex align-items-center gap-2" href="index.php">
      <img src="assets/uploads/favicon.jpg" width="45" style="border-radius:14px;">
      <span>EventHub</span>
    </a>
    <div class="ms-auto">
      <a href="index.php" class="btn btn-outline-dark btn-sm">Home</a>
      <a href="auth/login.php" class="btn btn-pastel btn-sm">Login</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="card card-soft p-5">
    <h1 class="fw-bold">🌸 About EventHub</h1>
    <p class="fs-5 text-muted mt-3">
      EventHub adalah sistem manajemen event berbasis web untuk memudahkan pengunjung mendaftar event,
      dan memudahkan admin mengelola event, kategori, transaksi pendaftaran, serta data user.
    </p>

    <div class="row mt-4">
      <div class="col-md-6">
        <h4 class="fw-bold">✨ Fitur Utama</h4>
        <ul class="fs-5">
          <li>Landing page pastel + kategori filter + pagination</li>
          <li>Admin panel SB Admin 2 (CRUD event & kategori)</li>
          <li>Pendaftaran event + kuota otomatis berkurang</li>
          <li>Transaksi pendaftaran + approve/reject</li>
          <li>Profile user update</li>
        </ul>
      </div>
      <div class="col-md-6">
        <h4 class="fw-bold">🎀 Kenapa EventHub?</h4>
        <p class="fs-5 text-muted">
          UI pastel, rapi, memenuhi semua kriteria tugas: CRUD, transaksi, session, role admin/user, dan profile.
        </p>
        <a href="auth/register.php" class="btn btn-pastel mt-3">Mulai Daftar</a>
      </div>
    </div>
  </div>
</div>

<footer class="text-center mt-5 py-4">
  <p class="mb-0">💖 © <?= date('Y')?> EventHub</p>
</footer>

</body>
</html>
