<?php
include_once ('class.REQUESTING_FLAG_db.php');
class REQUESTING_FLAG
{
	private $REQUESTING_FLAG_db;
	private $arr_values = array();


	public function __construct()
	{
		session_start ();
		$this->REQUESTING_FLAG_db = new REQUESTING_FLAG_db();


		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		
		$success = true;
		$this->arr_values = $this->request["para"];
		

		$ret = $this->REQUESTING_FLAG_db->update($this->arr_values);
		if($ret>0){
			$success = true;
		}else{
			$success = false;
		}
		
		$success = true;
			
		echo $success;

	}



}

$REQUESTING_FLAG = new REQUESTING_FLAG();
?>

