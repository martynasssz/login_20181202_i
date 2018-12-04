<?php 

class User
{
	private $db;

	function __construct($db) {
		$this->db = $db;
	}
	
	public function register($user_data) {

		$this->db->insert('users', [
			'username' => $user_data['username'],
			'password_hash' => password_hash($user_data['password'], PASSWORD_DEFAULT),
			'email' => $user_data['email']
		]);
	}

	public function login($auth_data) {

		$user = $this->db->selectOne('users', [
			'username' => $auth_data['username']
		]);
	
		if ($user && password_verify($auth_data['password'], $user['password_hash'])) {
			session_start();
			$_SESSION['user'] = $user['username'];
			return true;
		}
		return false;

	}

	public function logout() {
		session_start();
		$_SESSION = array();
		session_destroy();
	}

}