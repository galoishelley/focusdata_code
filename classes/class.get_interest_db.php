<?php
include_once('class.database.php');

class get_interest_db{
	private $db;
	public function __construct(){

		$this->db = new Database();

	}

	public function view(){
		
		$sql = "SELECT * FROM fd_dict_interest";

		$ret = $this->db->fetchAll_sql($sql,null);

		return $ret;
	}
}
?>