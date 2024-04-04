<?php
session_start();
include 'check_session_expiry.php'; 
// Lakukan koneksi ke database di sini
include "config.php";

if(isset($_POST['search'])) {
    // Sanitasi input dari karakter khusus
    $search_query = mysqli_real_escape_string($conn, $_POST['search']);
    
    // Lakukan pencarian di database
    if(!empty($search_query)) {
        $sql = "SELECT * FROM movies WHERE title LIKE '%$search_query%'";
        $result = mysqli_query($conn, $sql);
    } else {
    }
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<?php
// Tampilkan navbar sesuai dengan status login pengguna
if (isset($_SESSION['user_id'])) {
    // Jika sudah login, tampilkan navbar untuk pengguna yang sudah login
    echo '
    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">ImdB</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <span class="navbar-text m-3">' . $_SESSION['username'] . '!</span>
                    </li>
                    <li>
                        <a href="watchlist.php" class="btn btn-primary">Watchlist</a>
                    </li>
                </ul>
                <form class="d-flex" action="search.php" method="POST">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>';

    // Tampilkan container film dengan tambahan untuk watchlist
    echo '
    <div class="container mt-4">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">';
    if (isset($result) && $result->num_rows > 0) {
        // Output data dari setiap baris
        while($row = $result->fetch_assoc()) {
            $filmID = $row["id"];
            // Periksa apakah ID film sudah ada di watchlist pengguna
            $isAdded = false; // Default: belum ditambahkan
            if(isset($_SESSION['user_id'])) {
                $userID = $_SESSION['user_id'];
                // Lakukan query ke database untuk memeriksa apakah film sudah ditambahkan ke watchlist
                $query = "SELECT * FROM watchlist WHERE user_id = $userID AND movie_id = $filmID";
                $resultWatchlist = $conn->query($query);
                if($resultWatchlist && $resultWatchlist->num_rows > 0) {
                    $isAdded = true; // Sudah ditambahkan
                }
            }
            // Tampilkan card film
            echo '
            <div class="col">
                <div class="card text-center" id="' . $row["id"] . '">
                    <a href="detail.php?id=' . $row["id"] . '"> 
                        <img src="' . $row["gambar"] . '" class="card-img-top" alt="Film">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">' . $row["title"] . '</h5>
                        <p class="card-text">Rating: ' . $row["rating"] . '</p>
                        <a href="' . $row["link_trailer"] . '" class="btn btn-primary m-1" target="_blank">Tonton Trailer</a>';
            // Tampilkan tombol + Watchlist jika belum ditambahkan dan sudah login
            if ($isAdded) {
                echo '<a href="remove_from_watchlist.php?id=' . $row["id"] . '" class="btn btn-success m-1">Added to watchlist</a>';
            } else {
                echo '<a href="add_to_watchlist.php?id=' . $row["id"] . '" class="btn btn-primary m-1">+ Watchlist</a>';
            }
            echo '
                    </div>
                </div>
            </div>';
        }
    } else {
        // Tampilkan pesan jika tidak ada hasil pencarian
        echo "<p>No results found.</p>";
    }
    echo '
        </div>
    </div>';
} else {
    // Jika belum login, tampilkan container film standar
    echo '
    <div class="container">
        <div class="row">';
    // Tampilkan hasil pencarian jika ada
    if (isset($result) && mysqli_num_rows($result) > 0) {
        echo "<h2>Search Results:</h2>";
        while($row = mysqli_fetch_assoc($result)) {
            echo '
            <div class="col-md-4 mb-4">
                <div class="card text-center">
                    <a href="detail.php?id=' . $row["id"] . '"> 
                        <img src="' . $row["gambar"] . '" class="card-img-top" alt="Film">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">' . $row["title"] . '</h5>
                        <p class="card-text">Rating: ' . $row["rating"] . '</p>
                        <a href="' . $row["link_trailer"] . '" class="btn btn-primary" target="_blank">Tonton Trailer</a>
                    </div>
                </div>
            </div>';
        }
    } else {
        // Tampilkan pesan jika tidak ada hasil pencarian
        echo "<p>No results found.</p>";
    }
    echo '
        </div>
    </div>';
}
?>
</body>
</html>
