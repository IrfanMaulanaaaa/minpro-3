<?php
session_start();

if(isset($_SESSION['user_id'])) {
    include "config.php";

    if(isset($_GET['id'])) {
        $filmID = $_GET['id'];
        $userID = $_SESSION['user_id'];

        $query = "DELETE FROM watchlist WHERE user_id = $userID AND movie_id = $filmID";

        if ($conn->query($query) === TRUE) {
            header("Location: " . $_SERVER["HTTP_REFERER"]);
            exit;
        } else {
            echo "Error: " . $query . "<br>" . $conn->error;
        }
    } else {
        echo "Error: Film ID tidak ditemukan.";
    }

    $conn->close();
} else {
    header("Location: login2.php");
    exit;
}
?>
