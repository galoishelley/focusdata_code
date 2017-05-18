<?php
include_once ('class.activate_db.php');
class activate
{
	private $activate_db;


	public function __construct()
	{
		session_start ();
		$this->activate_db = new activate_db();
		
		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		

		$this->arr_values = $this->request["para"];


		$success = true;


		if($this->activate_db->col_exists($this->arr_values))
		{
			$this->activate_db->updateActive($this->arr_values);
            $success = true;
		}
		else
			$success = false;

		echo json_encode ( $success );

	}




}

$activate = new activate();
?>

