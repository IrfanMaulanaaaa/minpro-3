<?php
    session_start(); 
    // Lakukan koneksi ke database
    include "config.php";
    include 'check_session_expiry.php';
    // Query untuk mengambil data judul dan rating dari tabel film
    $sql = "SELECT id, title, rating, gambar, link_trailer FROM movies";
    $result = $conn->query($sql);
    
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets\style.css">
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/IMDb_Logo_Square.svg/2048px-IMDb_Logo_Square.svg.png">
    <title>Imdb</title>
    <script>
        var userId = '<?php echo isset($_SESSION["user_id"]) ? $_SESSION["user_id"] : ""; ?>';
        if (userId) {
            localStorage.setItem('user_id', userId);
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
        <?php
        // Periksa apakah pengguna sudah login
        if (isset($_SESSION['user_id'])) {
            // Jika sudah login, arahkan tombol ke beranda
            echo '<a class="navbar-brand" href="index.php">'.$_SESSION['username'].'</a>';
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
                        // echo '<span class="navbar-text">' . $_SESSION['username'] . '!</span>';
                    }
                    ?>
                </li>
                <?php
// Periksa apakah pengguna sudah login
if (isset($_SESSION['user_id'])) {
    // Jika sudah login, arahkan tombol ke beranda
    echo '<li class="me-2">
            <a href="watchlist.php" class="btn btn-primary">Watchlist</a>
          </li>';
} else {
    // Jika belum login, arahkan tombol ke halaman login
    
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




<div class="container mt-4">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <?php
        if ($result->num_rows > 0) {
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
        ?>
                <div class="col">
            <div class="card text-center" id="<?php echo $row["id"]; ?>" >
                <a href="detail.php?id=<?php echo $row["id"]; ?>"> 
                    <img src="<?php echo $row["gambar"]; ?>" class="card-img-top" alt="Film">
                </a>
                <div class="card-body">
                    <h6 class="card-title mb-10"><?php echo $row["title"]; ?></h5>
                    <p class="card-text">Rating: <?php echo $row["rating"]; ?></p>
                    <a href="<?php echo $row["link_trailer"]; ?>" class="btn btn-primary" target="_blank">Tonton Trailer</a>
                    <?php if(isset($_SESSION['user_id'])) { ?>
                        <div class="mt-2">
                            <?php if($isAdded) { ?>
                                <!-- Jika film sudah ditambahkan ke watchlist, tampilkan tombol "Sudah Ditambahkan" -->
                                <a href="remove_from_watchlist.php?id=<?php echo $row["id"]; ?>" class="btn btn-success">Added to watchlist</a>
                            <?php } else { ?>
                                <!-- Jika film belum ditambahkan ke watchlist, tampilkan tombol "+ Watchlist" -->
                                <a href="add_to_watchlist.php?id=<?php echo $row["id"]; ?>" class="btn btn-primary">+ Watchlist</a>
                            <?php } ?>
                        </div>
                    <?php } else { ?>
                        <!-- Jika belum sign in, arahkan ke halaman sign in -->
                        <div class="mt-2">
                            <a href="login2.php" class="btn btn-primary">+ Watchlist</a>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
<?php
    }
}
$conn->close();
?>
    </div>
</div>
<footer class="bg-dark text-light py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4 ">
                <h5>About</h5>
                <p>Imdb is where you can find what to watch, you can also make a review of the movie you watch, or give a rate of it.</p>
            </div>
            <div class="col-md-4">
                <h5>Social Media</h5>
                <ul class="list-unstyled d-flex">
                    <li class="m-1"><a href="https://www.instagram.com/ifan._m/"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="white" d="M7.8 2h8.4C19.4 2 22 4.6 22 7.8v8.4a5.8 5.8 0 0 1-5.8 5.8H7.8C4.6 22 2 19.4 2 16.2V7.8A5.8 5.8 0 0 1 7.8 2m-.2 2A3.6 3.6 0 0 0 4 7.6v8.8C4 18.39 5.61 20 7.6 20h8.8a3.6 3.6 0 0 0 3.6-3.6V7.6C20 5.61 18.39 4 16.4 4zm9.65 1.5a1.25 1.25 0 0 1 1.25 1.25A1.25 1.25 0 0 1 17.25 8A1.25 1.25 0 0 1 16 6.75a1.25 1.25 0 0 1 1.25-1.25M12 7a5 5 0 0 1 5 5a5 5 0 0 1-5 5a5 5 0 0 1-5-5a5 5 0 0 1 5-5m0 2a3 3 0 0 0-3 3a3 3 0 0 0 3 3a3 3 0 0 0 3-3a3 3 0 0 0-3-3"/></svg></a></li>
                    <li class="m-1"><a href="https://github.com/IrfanMaulanaaaa"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="white" d="M12.001 2c-5.525 0-10 4.475-10 10a9.994 9.994 0 0 0 6.837 9.488c.5.087.688-.213.688-.476c0-.237-.013-1.024-.013-1.862c-2.512.463-3.162-.612-3.362-1.175c-.113-.288-.6-1.175-1.025-1.413c-.35-.187-.85-.65-.013-.662c.788-.013 1.35.725 1.538 1.025c.9 1.512 2.337 1.087 2.912.825c.088-.65.35-1.087.638-1.337c-2.225-.25-4.55-1.113-4.55-4.938c0-1.088.387-1.987 1.025-2.687c-.1-.25-.45-1.275.1-2.65c0 0 .837-.263 2.75 1.024a9.28 9.28 0 0 1 2.5-.337c.85 0 1.7.112 2.5.337c1.913-1.3 2.75-1.024 2.75-1.024c.55 1.375.2 2.4.1 2.65c.637.7 1.025 1.587 1.025 2.687c0 3.838-2.337 4.688-4.562 4.938c.362.312.675.912.675 1.85c0 1.337-.013 2.412-.013 2.75c0 .262.188.574.688.474A10.016 10.016 0 0 0 22 12c0-5.525-4.475-10-10-10"/></svg></a></li>
                    <li class="m-1"><a href="https://www.linkedin.com/in/muhammad-irfan-maulana-525a0826b/"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="white" d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2zm-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93zM6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37z"/></svg></a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <p>Samarinda, Kalimantan Timur.</p>
                <p>Email: irfanmaulanaaa009@gmail.com</p>
            </div>
        </div>
        <hr class="bg-light">
        <div class="text-center">
            <p>&copy; 2024 Your Company. All Rights Reserved.</p>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- <script src="assets\locstor.js"></script> -->
</body>
</html>
