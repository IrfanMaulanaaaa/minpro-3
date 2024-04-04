<?php
session_start();

// Include database configuration
include "config.php";
// Set waktu kedaluwarsa cookie (misalnya, 10 detik dari sekarang)
$expiry_time = time() + 10;

// Atur cookie PHPSESSID dengan waktu kedaluwarsa
setcookie('PHPSESSID', session_id(), $expiry_time, '/');
setcookie('PHPSESSID_EXPIRY', $expiry_time, $expiry_time, '/');
// Cek apakah form login telah dikirim
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Simpan username dan password dari form
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Query untuk memeriksa keberadaan username dan password dalam tabel_akun
    $sql = "SELECT * FROM tabel_akun WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($sql);

    // Jika data ditemukan, tandai pengguna sebagai login
    if ($result->num_rows > 0) {
        // Ambil data pengguna dari hasil query
        $user = $result->fetch_assoc();
        
        // Simpan informasi login ke dalam session
        $_SESSION["user_id"] = $user["id"];
        $_SESSION["username"] = $user["username"];
        
        // Redirect ke halaman beranda
        header("Location: index.php");
        exit;
    } else {
        // Jika username atau password tidak valid, kembalikan ke halaman login dengan pesan error
        header("Location: login2.php?error=invalid_credentials");
        exit;
    }
} else {
    // Jika form tidak dikirimkan, kembalikan ke halaman login
    header("Location: login2.php");
    exit;
}


?>
