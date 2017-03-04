<?php
include_once ('class.SUCCESSFUL_FLAG_db.php');
class SUCCESSFUL_FLAG
{
	private $SUCCESSFUL_FLAG_db;


	public function __construct()
	{
		session_start ();
		$this->SUCCESSFUL_FLAG_db = new SUCCESSFUL_FLAG_db();
		
		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		

		$this->arr_values = $this->request["para"];


		$this->viewAll ();

	}




	public function viewAll()
	{

		$ret= $this->SUCCESSFUL_FLAG_db->viewAll ($this->arr_values);
		$success = true;

		if($ret!=""){
			if($ret[0]["SUCCESSFUL_FLAG"]=="1")
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

$SUCCESSFUL_FLAG = new SUCCESSFUL_FLAG();
?>

