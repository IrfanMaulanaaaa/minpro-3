<?php
// Mulai sesi
session_start();

// Include file koneksi ke database
include "config.php";

// Ambil data yang dikirimkan melalui formulir pendaftaran
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];

try {
    // Query untuk menyimpan informasi pengguna ke dalam database
    $sql = "INSERT INTO tabel_akun (email, username, password) VALUES ('$email', '$username', '$password')";

    // Eksekusi query
    if ($conn->query($sql) === TRUE) {
        // Jika pendaftaran berhasil, arahkan ke halaman login
        header("Location: login2.php");
        exit;
    }
} catch (mysqli_sql_exception $e) {
    // Tangkap exception dan tampilkan pesan kesalahan
    $error_message = $e->getMessage();
    if (strpos($error_message, "Duplicate entry") !== false) {
        // Jika ada error duplikat, simpan pesan kesalahan ke dalam session
        $_SESSION['error'] = "Email atau username sudah digunakan. Silakan gunakan email atau username lain.";
        header("Location: register.php");
        exit;
    } else {
        // Jika error bukan karena duplikat, tampilkan pesan error bawaan dari MySQL
        echo "Error: " . $error_message;
    }
}

// Tutup koneksi database
$conn->close();
?>
