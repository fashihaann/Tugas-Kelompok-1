<div class="sidebar">
    <div class="text-center mb-4">
        <img src="assets/img/logo.png" style="max-height: 60px;" />
    </div>

    <?php if(isset($_SESSION['login'])) { ?>
        <a href="dashboard.php" class="menu-top-active">DASHBOARD</a>
        <div class="dropdown">
            <a href="#" class="dropdown-toggle" id="accountMenu" data-toggle="dropdown">Account <i class="fa fa-angle-down"></i></a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="my-profile.php">My Profile</a>
                <a class="dropdown-item" href="change-password.php">Change Password</a>
            </div>
        </div>
        <a href="issued-books.php">Issued Books</a>
        <a href="logout.php" class="btn btn-danger mt-4">LOG ME OUT</a>
    <?php } else { ?>
        <a href="adminlogin.php">Admin Login</a>
        <a href="signup.php">User Signup</a>
        <a href="index.php">User Login</a>
    <?php } ?>
</div>