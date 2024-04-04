<?php
// Mulai sesi
// session_start();

// Waktu kedaluwarsa satu minggu dari sekarang
$expiry_time = time() + (7 * 24 * 60 * 60); // 1 minggu = 7 hari * 24 jam * 60 menit * 60 detik

// Atur cookie PHPSESSID dengan waktu kedaluwarsa satu minggu
setcookie('PHPSESSID', session_id(), $expiry_time, '/');
setcookie('PHPSESSID_EXPIRY', $expiry_time, $expiry_time, '/');

// Cek apakah cookie PHPSESSID telah ada
if(isset($_COOKIE['PHPSESSID'])) {
    // Jika cookie PHPSESSID ada, dapatkan nilai cookie
    $phpsessid_value = $_COOKIE['PHPSESSID'];

    // Cek apakah ada waktu kedaluwarsa untuk cookie PHPSESSID
    if(isset($_COOKIE['PHPSESSID_EXPIRY'])) {
        // Jika ada, dapatkan waktu kedaluwarsanya
        $expiry_time = $_COOKIE['PHPSESSID_EXPIRY'];

        // Dapatkan waktu saat ini
        $current_time = time();

        // Periksa apakah cookie telah kadaluwarsa
        if($current_time > $expiry_time) {
            // Jika kadaluwarsa, hapus cookie PHPSESSID
            setcookie('PHPSESSID', '', time() - 3600, '/');
            setcookie('PHPSESSID_EXPIRY', '', time() - 3600, '/');
        }
    }
}
?>
