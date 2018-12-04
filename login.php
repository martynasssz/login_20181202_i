<?php

	include '_config.php';

	spl_autoload_register(function ($class_name) {
		include 'Classes/' . $class_name . '.php';
	});

    // If we are trying to login
	if (isset($_POST['submit'])) {

		$db = new Database($config['database']);
		$user = new User($db);

		if ($user->login($_POST)) {
			header('Location: index.php');
		}
	}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Safe</title>
</head>
<body>
<h1>Login</h1>
<form action="login.php" method="post">
    <label>Username</label><br>
    <input type="text" name="username"><br>
    <label>Password</label><br>
    <input type="password" name="password"><br>
    <button type="submit" name="submit">Login</button>
</form>

<a href="register.php">Register</a>
</body>
</html>