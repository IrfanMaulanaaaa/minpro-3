<?php
session_start();
include 'check_session_expiry.php'; 
// Periksa apakah pengguna sudah login
// if(isset($_SESSION['user_id'])) {
//     // Tampilkan konten beranda untuk pengguna yang sudah login
//     echo "Selamat datang, " . $_SESSION['username'] . "!";
    
// } else {
//     // Jika belum login, kembalikan ke halaman login
//     header("Location: login2.php");
//     exit;
// }
if(isset($_POST['login'])) {
    // Hapus semua session
    // Redirect ke halaman login atau halaman lain yang diinginkan setelah logout
    header("Location: login2.php");
    exit;
  }
if(isset($_POST['logout'])) {
  // Hapus semua session
  session_destroy();
  // Redirect ke halaman login atau halaman lain yang diinginkan setelah logout
  header("Location: index.php");
  exit;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Film</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .movie-details {
            margin-top: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .movie-details img {
            max-width: 100%;
            border-radius: 10px;
        }
        .movie-info {
            margin-top: 20px;
        }
        .movie-info p {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
        <?php
        // Periksa apakah pengguna sudah login
        if (isset($_SESSION['user_id'])) {
            // Jika sudah login, arahkan tombol ke beranda
            echo '<a class="navbar-brand" href="index.php">ImdB</a>';
            // Tampilkan tombol logout
            echo '
            <form method="post" class="d-flex">
                <button type="submit" name="logout" class="btn btn-primary">Logout</button>
            </form>';
        } else {
            // Jika belum login, arahkan tombol ke halaman login
            echo '<a class="navbar-brand" href="index.php">ImdB</a>';
            // Tampilkan tombol login dengan margin samping
            echo '
            <form method="post" class="d-flex me-2">
                <button type="submit" name="login" class="btn btn-primary me-2">Login</button>
            </form>';
            // Tampilkan tombol register dengan margin samping
            echo '
            <a href="register.php" class="btn btn-primary me-2">Register</a>';
        }
        ?>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <?php
                    // Periksa apakah pengguna sudah login
                    if (isset($_SESSION['username'])) {
                        // Tampilkan nama pengguna
                        echo '<span class="navbar-text m-3">' . $_SESSION['username'] . '!</span>';
                    }
                    ?>
                </li>
                <?php
        if (isset($_SESSION['user_id'])) {
            echo '<li>
            <a href="watchlist.php" class="btn btn-primary">Watchlist</a>
        </li>';
        } else {
            
        }
        ?>
            
            </ul>
            <form class="d-flex" action="search.php" method="POST">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>



<div class="container">
    <div class="row">
        <div class="col">
            <div class="movie-details mt-0">

                <?php
                include "config.php";
                if(isset($_GET['id'])) {
                    $id = $_GET['id'];

                    $sql = "SELECT * FROM movies WHERE id = $id";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo '<div class="row">';
                            echo '<div class="col-md-4">';
                            echo '<img src="'.$row["gambar"].'" class="card-img-top" alt="Film">';
                            echo '</div>';
                            echo '<div class="col-md-8">';
                            echo "<div class='movie-info'>";
                            echo "<h2>" . $row["title"] . "</h2>";
                            echo "<p>Description: " . $row["description"] . "</p>";
                            echo "<p>Year: " . $row["year"] . "</p>";
                            echo "<p>Genre: " . $row["genre"] . "</p>";
                            echo "<p>Duration: " . $row["duration"] . " menit</p>";
                            echo "<p>Sutradara: " . $row["sutradara"] . "</p>";
                            echo "<p>Producer: " . $row["producer"] . "</p>";
                            echo "<p>Penulis: " . $row["penulis"] . "</p>";
                            echo "<p>Produksi: " . $row["produksi"] . "</p>";
                            echo "<p>Casts: " . $row["casts"] . "</p><br>";
                            echo '<div class="text-center">';
                            echo "<a href='" . $row["link_trailer"] . "' class='btn btn-primary' role='button' target='_blank'>Watch Trailer</a>";
                            echo '</div>';


                            echo '<form action="submit_review.php" method="POST">';
                            echo '<div class="form-group mt-3">';
                            echo '<label for="review">Your Review:</label>';
                            echo '<textarea class="form-control" id="review" name="review" rows="3" required></textarea>'; // Tambahkan atribut required di sini
                            echo '</div>';
                            echo '<div class="form-group">';
                            echo '<label for="rating">Rating (0.0 - 5.0):</label>';
                            echo '<input type="number" class="form-control" id="rating" name="rating" step="0.1" min="0" max="5" required>'; // Tambahkan atribut required di sini
                            echo '</div>';
                            echo '<input type="hidden" name="movie_id" value="' . $row["id"] . '">';
                            echo '<div class="text-center mt-3">';
                            echo '<button type="submit" class="btn btn-primary">Submit Review</button>';
                            echo '</div>';
                            
                            echo '</form>';
                            

                            
echo '<div class="d-flex justify-content-center mt-3">';
if(isset($_SESSION['user_id'])) {
    $filmID = $row["id"];

    $isAdded = false; 
    $userID = $_SESSION['user_id'];
    
    $query = "SELECT * FROM watchlist WHERE user_id = $userID AND movie_id = $filmID";
    $resultWatchlist = $conn->query($query);
    if($resultWatchlist && $resultWatchlist->num_rows > 0) {
        $isAdded = true; 
    }

    if($isAdded) {
        echo '<a href="remove_from_watchlist.php?id=' . $row["id"] . '" class="btn btn-success">Added to watchlist</a>';
    } else {
        echo '<a href="add_to_watchlist.php?id=' . $row["id"] . '" class="btn btn-primary">+ Watchlist</a>';
    }
} else {
    echo '<a href="login2.php" class="btn btn-primary">+ Watchlist</a>';
}
echo '</div>';

                            echo "</div>";
                            echo '</div>';
                        }
                    }
                } else {
                    
                    echo "ID not provided.";
                }
                ?>

            </div>
        </div>
    </div>
</div>

<div class="container mt-4">
    <h3>User Reviews</h3>

    
    <?php
    $sql_review = "SELECT user_review.id_user, user_review.rating, user_review.isi_review, tabel_akun.username 
    FROM user_review 
    INNER JOIN tabel_akun ON user_review.id_user = tabel_akun.id 
    WHERE user_review.id_movie = $id
    AND (user_review.isi_review IS NOT NULL OR user_review.rating IS NOT NULL)
    ";



    $result_review = $conn->query($sql_review);

    if ($result_review->num_rows > 0) {
        while($row_review = $result_review->fetch_assoc()) {
            echo '<div class="card mb-3">';
            echo '<div class="card-body">';
            echo '<h5 class="card-title">' . $row_review["username"] . '</h5>';
            echo '<h6 class="card-subtitle mb-2 text-muted">Rating: ' . $row_review["rating"] . '</h6>';
            echo '<p class="card-text">' . $row_review["isi_review"] . '</p>';
            echo '</div>';
            echo '</div>';
        }
    } else {
        echo "<p>No reviews yet.</p>";
    }
    ?>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
