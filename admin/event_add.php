<?php
include '../config/db.php';
include '../config/helper.php';
checkAdmin();


$cats = mysqli_query($conn,"SELECT * FROM categories");


if(isset($_POST['save'])){
$category_id = $_POST['category_id'];
$title = $_POST['title'];
$description = $_POST['description'];
$location = $_POST['location'];
$event_date = $_POST['event_date'];
$quota = $_POST['quota'];


$imgName = $_FILES['image']['name'];
$tmp = $_FILES['image']['tmp_name'];
$newName = time()."_".$imgName;
move_uploaded_file($tmp, "../assets/uploads/".$newName);


mysqli_query($conn,"INSERT INTO events(category_id,title,description,location,event_date,quota,image)
VALUES('$category_id','$title','$description','$location','$event_date','$quota','$newName')");


redirect('event_list.php');
}
?>


<!doctype html>
<html>
<head>
<title>Tambah Event</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<h3>Tambah Event</h3>
<a href="event_list.php" class="btn btn-secondary btn-sm">← Back</a>


<form method="POST" enctype="multipart/form-data" class="card p-3 mt-3">
<label>Kategori</label>
<select name="category_id" class="form-control mb-2" required>
<option value="">-- pilih --</option>
<?php while($c=mysqli_fetch_assoc($cats)) { ?>
<option value="<?= $c['id'] ?>"><?= $c['name'] ?></option>
<?php } ?>
</select>


<label>Judul</label>
<input name="title" class="form-control mb-2" required>


<label>Deskripsi</label>
<textarea name="description" class="form-control mb-2" required></textarea>


<label>Lokasi</label>
<input name="location" class="form-control mb-2" required>


<label>Tanggal</label>
<input name="event_date" type="date" class="form-control mb-2" required>


<label>Kuota</label>
<input name="quota" type="number" class="form-control mb-2" required>


<label>Gambar</label>
<input name="image" type="file" class="form-control mb-2" required>


<button class="btn btn-primary" name="save">Simpan</button>
</form>
</div>
</body>
</html>