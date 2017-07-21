<?php
include_once ('class.CHECK_REQUESTING_FLAG_db.php');
class CHECK_REQUESTING_FLAG
{
	private $CHECK_REQUESTING_FLAG_db;
	private $arr_values = array();


	public function __construct()
	{


		session_start ();
		$this->CHECK_REQUESTING_FLAG_db = new CHECK_REQUESTING_FLAG_db();
		
		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		

		$this->arr_values = $this->request["para"];


		$this->viewAll ();


	}

	public function viewAll()
	{

		$ret= $this->CHECK_REQUESTING_FLAG_db->viewAll ($this->arr_values);
		$success = true;

		if($ret!=""){
			if($ret[0]["REQUESTING_USER_ID"]=="0")
			{
				$success = true;
			}
			else
			{
				$success = false;
			}
		}else{
			$success = false;
		}
		
		echo json_encode ( $success );
	}



}

$CHECK_REQUESTING_FLAG = new CHECK_REQUESTING_FLAG();
?>

