<?php

	include "_config.php";

	spl_autoload_register(function ($class_name) {
		include 'Classes/' . $class_name . '.php';
	});

	// if we are trying to register
	if (isset($_POST['submit'])) {
		$db = new Database($config['database']);
		$new_user = new User($db);
		$new_user->register($_POST);

		header('Location: login.php');
	}

?>

<!DOCTYPE html>
<html>
<head>
    <title><?= $config['app']['app_name']; ?></title>
</head>
<body>
<h1>Register</h1>
<form action="register.php" method="post">
    <label>Username</label>
    <input type="text" name="username"><br>
    <label>Password</label>
    <input type="password" name="password"><br>
    <label>Email</label>
    <input type="text" name="email"><br>
    <button type="submit" name="submit">Register</button>
</form>
</body>
</html>