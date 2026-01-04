<?php
?>


<!doctype html>
<html>
<head>
<title>Edit Event</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Edit Event</h3>
<a href="event_list.php" class="btn btn-secondary btn-sm">← Back</a>


<form method="POST" enctype="multipart/form-data" class="card p-3 mt-3">
<label>Kategori</label>
<select name="category_id" class="form-control mb-2" required>
<?php while($c=mysqli_fetch_assoc($cats)) { ?>
<option value="<?= $c['id'] ?>" <?= $event['category_id']==$c['id']?'selected':'' ?>>
<?= $c['name'] ?>
</option>
<?php } ?>
</select>


<label>Judul</label>
<input name="title" class="form-control mb-2" value="<?= e($event['title']) ?>" required>


<label>Deskripsi</label>
<textarea name="description" class="form-control mb-2" required><?= e($event['description']) ?></textarea>


<label>Lokasi</label>
<input name="location" class="form-control mb-2" value="<?= e($event['location']) ?>" required>


<label>Tanggal</label>
<input name="event_date" type="date" class="form-control mb-2" value="<?= $event['event_date'] ?>" required>


<label>Kuota</label>
<input name="quota" type="number" class="form-control mb-2" value="<?= $event['quota'] ?>" required>


<label>Gambar (opsional)</label>
<input name="image" type="file" class="form-control mb-2">


<button class="btn btn-warning" name="update">Update</button>
</form>
</div>
</body>
</html>