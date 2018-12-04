<?php
	include "_config.php";
	session_start();

	// If users is not authenticated redirect to login page
	if (!isset($_SESSION['user']) || empty($_SESSION['user'])) {
		header('Location: login.php');
	}

?>

<!DOCTYPE html>
<html>
<head>
    <title><?= $config['app']['app_name']; ?></title>
</head>
<body>
<h1>Hello, <?= $_SESSION['user']; ?>!</h1>
<a href="logout.php">Logout</a>
</body>
</html>