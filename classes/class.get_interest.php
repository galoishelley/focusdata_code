<?php
include_once ('class.get_interest_db.php');
class get_interest
{
	private $get_interest_db;


	public function __construct()
	{
		session_start ();
		$this->get_interest_db = new get_interest_db();
		


		$ret= $this->get_interest_db->view();
		echo json_encode ( $ret);
	}



}

$get_interest = new get_interest();
?>

