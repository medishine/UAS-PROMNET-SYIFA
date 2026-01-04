<?php
include 'config/db.php';

$cat = isset($_GET['cat']) ? $_GET['cat'] : '';
$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';

$categories = mysqli_query($conn,"SELECT * FROM categories");

/* ==========================
   PAGINATION SETTINGS
========================== */
$limit = 3; // tampil 3 event per halaman
$page  = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if($page < 1) $page = 1;
$start = ($page - 1) * $limit;

/* ==========================
   WHERE FILTER
========================== */
$where = "WHERE 1=1";
if($cat){
  $where .= " AND events.category_id='$cat'";
}
if($keyword){
  $where .= " AND events.title LIKE '%$keyword%'";
}

/* ==========================
   COUNT TOTAL DATA
========================== */
$totalData = mysqli_fetch_assoc(mysqli_query($conn,"SELECT COUNT(*) as total FROM events $where"))['total'];
$totalPage = ceil($totalData / $limit);

/* ==========================
   GET EVENT DATA
========================== */
$events = mysqli_query($conn,"SELECT events.*, categories.name as catname FROM events
LEFT JOIN categories ON events.category_id=categories.id
$where ORDER BY events.id DESC LIMIT $start, $limit");
?>

<!doctype html>
<html>
<head>
  <title>EventHub - Pastel Event</title>
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
      <a href="about.php" class="btn btn-outline-dark btn-sm">About</a>
      <a href="auth/login.php" class="btn btn-pastel btn-sm">Login</a>
      <a href="auth/register.php" class="btn btn-outline-dark btn-sm">Register</a>
    </div>
  </div>
</nav>

<div class="container mt-4">

  <!-- HERO -->
  <div class="hero">
    <div class="row align-items-center">
      <div class="col-md-7">
        <h1 class="fw-bold">🌷 EventHub — Event pastel yang lucu & seru!</h1>
        <p class="mt-3 fs-5">
          Sistem manajemen event (seminar, workshop, lomba) dengan fitur pendaftaran + admin panel.
        </p>
        <a href="auth/register.php" class="btn btn-dark rounded-pill px-4">Mulai Daftar</a>
        <a href="about.php" class="btn btn-outline-dark rounded-pill px-4 ms-2">Tentang Kami</a>
      </div>
      <div class="col-md-5 text-center">
        <img src="assets/uploads/img1.jpg" class="img-fluid rounded-4 shadow">
      </div>
    </div>
  </div>

  <!-- SEARCH -->
  <div class="card card-soft mt-4 p-4">
    <h4 class="fw-bold">🔎 Cari Event</h4>
    <form method="GET" class="row g-2 mt-2">
      <div class="col-md-6">
        <input class="form-control soft-input" name="keyword" placeholder="Cari event..." value="<?= e($keyword) ?>">
      </div>
      <div class="col-md-4">
        <select name="cat" class="form-control soft-input">
          <option value="">Semua Kategori</option>
          <?php while($c=mysqli_fetch_assoc($categories)){ ?>
            <option value="<?= $c['id'] ?>" <?= $cat==$c['id'] ? 'selected' : '' ?>>
              <?= $c['name'] ?>
            </option>
          <?php } ?>
        </select>
      </div>
      <div class="col-md-2">
        <button class="btn btn-pastel w-100">Cari</button>
      </div>
    </form>
  </div>

  <!-- EVENT LIST -->
  <h3 class="fw-bold mt-5">🎀 Event Terbaru</h3>
  <p class="text-muted">Menampilkan <b><?= $limit ?></b> event per halaman (pagination)</p>

  <div class="row">
    <?php while($e=mysqli_fetch_assoc($events)){ ?>
    <div class="col-md-4 mt-4">
      <div class="card card-soft h-100">
        <img src="assets/uploads/<?= $e['image'] ?>" style="height:220px; object-fit:cover;">
        <div class="card-body p-4">
          <span class="badge-soft"><?= $e['catname'] ?></span>
          <h5 class="fw-bold mt-2"><?= $e['title'] ?></h5>
          <p class="text-muted"><?= substr($e['description'],0,90) ?>...</p>
          <p class="mb-1">📍 <?= $e['location'] ?></p>
          <p>📅 <?= $e['event_date'] ?> | 👥 Kuota: <?= $e['quota'] ?></p>
          <a href="auth/login.php" class="btn btn-pastel w-100">Lihat Detail</a>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>

  <!-- PAGINATION -->
  <div class="d-flex justify-content-center mt-4">
    <nav>
      <ul class="pagination">

        <!-- Prev -->
        <li class="page-item <?= ($page<=1) ? 'disabled' : '' ?>">
          <a class="page-link" href="?page=<?= $page-1 ?>&cat=<?= $cat ?>&keyword=<?= $keyword ?>">← Prev</a>
        </li>

        <!-- Page Numbers -->
        <?php for($i=1; $i<=$totalPage; $i++){ ?>
          <li class="page-item <?= ($i==$page) ? 'active' : '' ?>">
            <a class="page-link" href="?page=<?= $i ?>&cat=<?= $cat ?>&keyword=<?= $keyword ?>"><?= $i ?></a>
          </li>
        <?php } ?>

        <!-- Next -->
        <li class="page-item <?= ($page>=$totalPage) ? 'disabled' : '' ?>">
          <a class="page-link" href="?page=<?= $page+1 ?>&cat=<?= $cat ?>&keyword=<?= $keyword ?>">Next →</a>
        </li>

      </ul>
    </nav>
  </div>

</div>

<footer class="text-center mt-5 py-4">
  <p class="mb-0">💖 © <?= date('Y')?> EventHub — Pastel Event
