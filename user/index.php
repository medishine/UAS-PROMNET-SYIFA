<?php
include '../config/db.php';
include '../config/helper.php';
checkLogin();

$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
$cat = isset($_GET['cat']) ? $_GET['cat'] : '';

$categories = mysqli_query($conn,"SELECT * FROM categories");

/* PAGINATION */
$limit = 3;
$page  = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if($page<1) $page=1;
$start = ($page-1)*$limit;

/* FILTER */
$where="WHERE events.title LIKE '%$keyword%'";
if($cat) $where .= " AND events.category_id='$cat'";

/* COUNT */
$totalData = mysqli_fetch_assoc(mysqli_query($conn,"SELECT COUNT(*) as total FROM events $where"))['total'];
$totalPage = ceil($totalData/$limit);

/* GET DATA */
$events = mysqli_query($conn,"SELECT events.*, categories.name as catname FROM events 
LEFT JOIN categories ON events.category_id=categories.id
$where ORDER BY events.id DESC LIMIT $start,$limit");
?>

<!doctype html>
<html>
<head>
  <title>User - EventHub</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <link href="../assets/pastel.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container">
    <a class="navbar-brand fw-bold d-flex align-items-center gap-2" href="index.php">
      <img src="../assets/uploads/favicon.jpg" width="40" style="border-radius:14px;">
      <span>EventHub</span>
    </a>
    <div class="ms-auto">
      <a href="my_registrations.php" class="btn btn-outline-dark btn-sm">Pendaftaran Saya</a>
      <a href="profile.php" class="btn btn-outline-dark btn-sm">Profile</a>
      <a href="../auth/logout.php" class="btn btn-danger btn-sm">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h3 class="fw-bold">Hai, <?= e($_SESSION['user']['name']) ?> 💖</h3>
  <p class="text-muted">Yuk pilih event yang kamu suka ✨</p>

  <form class="row g-2">
    <div class="col-md-6">
      <input class="form-control soft-input" name="keyword" placeholder="Search event..." value="<?= e($keyword) ?>">
    </div>
    <div class="col-md-4">
      <select class="form-control soft-input" name="cat">
        <option value="">Semua Kategori</option>
        <?php while($c=mysqli_fetch_assoc($categories)){ ?>
          <option value="<?= $c['id'] ?>" <?= $cat==$c['id']?'selected':'' ?>>
            <?= $c['name'] ?>
          </option>
        <?php } ?>
      </select>
    </div>
    <div class="col-md-2">
      <button class="btn btn-pastel w-100">Filter</button>
    </div>
  </form>

  <div class="row">
    <?php while($e=mysqli_fetch_assoc($events)){ ?>
    <div class="col-md-4 mt-4">
      <div class="card card-soft h-100">
        <img src="../assets/uploads/<?= $e['image'] ?>" style="height:220px; object-fit:cover;">
        <div class="card-body p-4">
          <span class="badge-soft"><?= $e['catname'] ?></span>
          <h5 class="fw-bold mt-2"><?= $e['title'] ?></h5>
          <p class="text-muted"><?= substr($e['description'],0,90) ?>...</p>
          <p class="mb-1">📍 <?= $e['location'] ?></p>
          <p>📅 <?= $e['event_date'] ?> | 👥 Kuota: <?= $e['quota'] ?></p>
          <a href="event_detail.php?id=<?= $e['id'] ?>" class="btn btn-pastel w-100">Detail</a>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>

  <!-- PAGINATION -->
  <div class="d-flex justify-content-center mt-4">
    <nav>
      <ul class="pagination">

        <li class="page-item <?= ($page<=1)?'disabled':'' ?>">
          <a class="page-link" href="?page=<?= $page-1 ?>&cat=<?= $cat ?>&keyword=<?= $keyword ?>">← Prev</a>
        </li>

        <?php for($i=1;$i<=$totalPage;$i++){ ?>
          <li class="page-item <?= ($i==$page)?'active':'' ?>">
            <a class="page-link" href="?page=<?= $i ?>&cat=<?= $cat ?>&keyword=<?= $keyword ?>"><?= $i ?></a>
          </li>
        <?php } ?>

        <li class="page-item <?= ($page>=$totalPage)?'disabled':'' ?>">
          <a class="page-link" href="?page=<?= $page+1 ?>&cat=<?= $cat ?>&keyword=<?= $keyword ?>">Next →</a>
        </li>

      </ul>
    </nav>
  </div>

</div>

<footer class="text-center mt-5 py-4">
  <p class="mb-0">💖 © <?= date('Y')?> EventHub</p>
</footer>

</body>
</html>
