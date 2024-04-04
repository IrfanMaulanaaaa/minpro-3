<?php
// Mulai sesi
session_start();
include 'check_session_expiry.php'; 
// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    // Jika belum, arahkan kembali ke halaman login
    header("Location: login2.php");
    exit;
}
if (isset($_POST['logout'])) {
    // Hapus semua session
    session_destroy();
    // Redirect ke halaman login atau halaman lain yang diinginkan setelah logout
    header("Location: index.php");
    exit;
}

// Include file koneksi ke database
include "config.php";

// Tentukan default sorting
$sorting = "watchlisted";

// Cek apakah parameter sort dikirim melalui metode GET
if (isset($_GET['sort'])) {
    $sorting = $_GET['sort'];
}

// Query untuk mengambil data watchlist user yang sedang login
// Query untuk mengambil data watchlist user yang sedang login
$user_id = $_SESSION['user_id'];

// Sort by: reviewed
// Periksa apakah kunci "sort" telah diatur dalam array $_GET
if (isset($_GET['sort'])) {
    // Sort by: reviewed
    if ($_GET['sort'] == 'reviewed') {
        $sql = "SELECT movies.*
                FROM movies
                INNER JOIN user_review ON movies.id = user_review.id_movie
                WHERE user_review.id_user = $user_id";
    }
    // Sort by: rated
    elseif ($_GET['sort'] == 'rated') {
        $sql = "SELECT movies.*
                FROM movies
                INNER JOIN user_review ON movies.id = user_review.id_movie
                WHERE user_review.id_user = $user_id AND user_review.rating IS NOT NULL";
    }
    // Sort by: watchlisted
    elseif ($_GET['sort'] == 'watchlisted') {
        $sql = "SELECT movies.*
                FROM movies
                INNER JOIN watchlist ON movies.id = watchlist.movie_id
                WHERE watchlist.user_id = $user_id";
    }
    else {
        // Default to showing all movies in watchlist
        $sql = "SELECT movies.*
                FROM movies
                INNER JOIN watchlist ON movies.id = watchlist.movie_id
                WHERE watchlist.user_id = $user_id";
    }
} else {
    // Jika kunci "sort" tidak diatur, default ke menampilkan semua film dalam watchlist
    $sql = "SELECT movies.*
            FROM movies
            INNER JOIN watchlist ON movies.id = watchlist.movie_id
            WHERE watchlist.user_id = $user_id";
}

$result = $conn->query($sql);


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watchlist</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        /* CSS tambahan sesuai kebutuhan */
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">My Watchlist</a>
            <!-- Tombol logout -->
            <form method="post" class="d-flex">
                <button type="submit" name="logout" class="btn btn-primary">Logout</button>
            </form>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row mb-3">
            <div class="col">
                <form action="watchlist.php" method="GET">
                    <div class="input-group">
                        <label class="input-group-text" for="sortSelect">Sort by:</label>
                        <select class="form-select" id="sortSelect" name="sort">
                            <option value="watchlisted" <?php if ($sorting == "watchlisted") echo "selected"; ?>>Watchlisted</option>
                            <option value="reviewed" <?php if ($sorting == "reviewed") echo "selected"; ?>>Reviewed</option>
                            <option value="rated" <?php if ($sorting == "rated") echo "selected"; ?>>Rated</option>
                        </select>
                        <button class="btn btn-primary" type="submit">Sort</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Tampilkan film sesuai dengan sorting yang dipilih -->
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <?php
            // Tampilkan data watchlist sesuai dengan jenis sorting yang dipilih
            if ($result->num_rows > 0) {
                // Data ditemukan, tampilkan informasi watchlist
                while ($row = $result->fetch_assoc()) {
                    // Tampilkan informasi film dalam elemen HTML
            ?>
                    <div class="col">
                        <div class="card text-center" id="<?php echo $row["id"]; ?>">
                            <a href="detail.php?id=<?php echo $row["id"]; ?>">
                                <img src="<?php echo $row["gambar"]; ?>" class="card-img-top" alt="Film">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><?php echo $row["title"]; ?></h5>
                                <p class="card-text">Rating: <?php echo $row["rating"]; ?></p>
                                <a href="<?php echo $row["link_trailer"]; ?>" class="btn btn-primary" target="_blank">Tonton Trailer</a>
                                <!-- Hanya tampilkan tombol Remove from Watchlist untuk sort by: watchlisted -->
                                <?php if ($sorting == "watchlisted") { ?>
                                    <!-- Tombol Remove from Watchlist -->
                                    <form action="remove_from_watchlist.php" method="GET">
                                        <input type="hidden" name="id" value="<?php echo $row["id"]; ?>">
                                        <button type="submit" class="btn btn-danger">Remove from Watchlist</button>
                                    </form>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
            <?php
                }
            } else {
                // Jika watchlist kosong
                echo "<div class='col'>Watchlist Anda kosong.</div>";
            }
            // Tutup koneksi database
            $conn->close();
            ?>
        </div>
    </div>

</body>

</html>
