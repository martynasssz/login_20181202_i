<?php

	class Database
	{

		private $conn;

		function __construct(array $db_settings)
		{
			try {
				$this->conn = new PDO("mysql:host=" . $db_settings['hostname'] . ";dbname=" . $db_settings['database'] . ";charset=utf8", $db_settings['username'], $db_settings['password']);
				$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			} catch (PDOException $e) {
				die("Connection failed: " . $e->getMessage());
			}
		}

		public function insert(string $table, array $data)
		{

			$keys = array_keys($data);
			$placeholders = preg_filter('/^/', ':', $keys);
			try {
				$query = $this->conn->prepare("INSERT INTO $table (" . implode(',', $keys) . ") VALUES (" . implode(',', $placeholders) . ")");
				$query->execute($data);
			} catch (PDOException $e) {
				die("<pre>" . $e->getMessage() . "</pre>");
			}
		}

		// select single filtered row
		public function selectOne(string $table, array $filter)
		{
			$filter_query = [];
			foreach ($filter as $column => $value) {
				$filter_query[] = $column . " = '" . $value . "'";
			}

			$filter_query = implode(" AND ", $filter_query);

			try {
				$query = $this->conn->prepare("SELECT * FROM $table WHERE $filter_query");
				$query->execute();
				return $query->fetch(PDO::FETCH_ASSOC);
			} catch (PDOException $e) {
				die("<pre>" . $e->getMessage() . "</pre>");
			}
		}

		// select all rows from the table
		public function selectAll(string $table)
		{
			try {
				$query = $this->conn->prepare("SELECT * FROM $table");
				$query->execute();
				return $query->fetchAll(PDO::FETCH_ASSOC);
			} catch (PDOException $e) {
				die("<pre>" . $e->getMessage() . "</pre>");
			}
		}

	}
