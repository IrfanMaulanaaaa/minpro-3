document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Menghentikan pengiriman formulir default
    
    // Mengambil nilai username dari input
    var username = document.getElementById('username').value;

    // Menetapkan cookie dengan nama 'username' dan waktu kedaluwarsa 30 detik
    var now = new Date();
    var expirationTime = new Date(now.getTime() + 30 * 1000); // 30 detik
    document.cookie = `username=${username}; expires=${expirationTime.toUTCString()}`;

    // Melakukan pengiriman formulir
    this.submit();
});