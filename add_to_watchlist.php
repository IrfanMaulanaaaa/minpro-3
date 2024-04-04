<?php
session_start();

if(isset($_SESSION['user_id'])) {
    if(isset($_GET['id'])) {
        $movie_id = $_GET['id'];

        include "config.php"; 
        $user_id = $_SESSION['user_id'];
        $sql = "INSERT INTO watchlist (user_id, movie_id) VALUES ($user_id, $movie_id)";
        if ($conn->query($sql) === TRUE) {
            header("Location: index.php");
            exit();
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
        $conn->close();
    } else {
        header("Location: index.php");
        exit();
    }
} else {
    header("Location: login2.php");
    exit();
}
?>
