<?php
session_start();

include "config.php";

// Pastikan pengguna sudah login
if(!isset($_SESSION['user_id'])) {
    header("Location: login2.php");
    exit;
}

if(isset($_POST['review']) && isset($_POST['rating']) && isset($_POST['movie_id'])) {
    $review = $_POST['review'];
    $rating = $_POST['rating'];
    $movie_id = $_POST['movie_id'];
    $user_id = $_SESSION['user_id'];

    if($rating < 0 || $rating > 5) {
        $_SESSION['error'] = "Rating harus berada di antara 0.0 dan 5.0.";
        header("Location: " . $_SERVER["HTTP_REFERER"]);
        exit;
    }

    $sql = "INSERT INTO user_review (id_user, id_movie, isi_review, rating) VALUES ($user_id, $movie_id, '$review', $rating)";

    if ($conn->query($sql) === TRUE) {
        $_SESSION['success'] = "Review berhasil disimpan.";
        header("Location: " . $_SERVER["HTTP_REFERER"]);
        exit;
    } else {
        $_SESSION['error'] = "Error: " . $sql . "<br>" . $conn->error;
        header("Location: " . $_SERVER["HTTP_REFERER"]);
        exit;
    }
} else {
    $_SESSION['error'] = "Data tidak lengkap.";
    header("Location: " . $_SERVER["HTTP_REFERER"]);
    exit;
}

$conn->close();
?>
