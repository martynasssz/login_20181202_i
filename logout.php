<?php

	include "_config.php";
	session_start();

	spl_autoload_register(function ($class_name) {
		include 'Classes/' . $class_name . '.php';
	});

	$db = new Database($config['database']);
	$user = new User($db);
	$user->logout();

	header('Location: login.php');
