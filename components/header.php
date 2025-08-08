<?php
?>
<header class="main-header">
    <div class="header-container">
        <div class="logo">
            <a href="index.php">E-Commerce</a>
        </div>
        
        <nav class="main-nav">
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="products.php">Products</a></li>
                <li><a href="cart.php">Cart</a></li>
                <?php if (isset($_SESSION['user_id'])): ?>
                    <li><a href="profile.php">Profile</a></li>
                    <li><a href="logout.php">Logout</a></li>
                <?php else: ?>
                    <li><a href="login.php">Login</a></li>
                    <li><a href="register.php">Register</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </div>
</header>

<style>
    .main-header {
        background: #fff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    
    .header-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 15px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 20px;
    }
    
    .logo a {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        text-decoration: none;
    }
    
    .main-nav ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
        gap: 20px;
    }
    
    .main-nav a {
        color: #333;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s;
    }
    
    .main-nav a:hover {
        color: #007bff;
    }
    
    @media (max-width: 768px) {
        .header-container {
            flex-direction: column;
            align-items: center;
        }
        
        .main-nav ul {
            flex-wrap: wrap;
            justify-content: center;
        }
    }
</style> 