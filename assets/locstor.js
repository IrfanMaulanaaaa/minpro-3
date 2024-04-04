var userId = '<?php echo isset($_SESSION["user_id"]) ? $_SESSION["user_id"] : ""; ?>';
        if (userId) {
            localStorage.setItem('user_id', userId);
        }