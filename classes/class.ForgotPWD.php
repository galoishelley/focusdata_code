<?php
include_once ('class.ForgotPWD_db.php');
class ForgotPWD
{
	private $ForgotPWD_db;


	public function __construct()
	{
		session_start ();
		$this->ForgotPWD_db = new ForgotPWD_db();

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}


		$this->arr_values = $this->request["para"];

		if (isset ( $this->arr_values['email'])){
			$this->email = $this->arr_values['email'];
			unset($this->arr_values['email']);
		}
		
	


		if (isset ( $this->arr_values["action_type"] )){
			$action_type = $this->arr_values["action_type"];
			unset($this->arr_values["action_type"]);
		}else
		{
			$action_type = "";
		}
		
	

		$this->action = $action_type;
		$this->action_type ();

		
	}

	private function action_type()
	{
		switch ($this->action)
		{
			case 'clinic' :
				$this->clinic ();
				break;
			case 'person' :
				$this->person ();
				break;

			case 'updateClinic' :
				$this->updateClinic ();
				break;

			case 'updatePerson' :
				$this->updatePerson ();
				break;

			
			default :
			
				break;
		}
	}
	



	public function clinic()
	{
		$response  = array();
	

		$ret= $this->ForgotPWD_db->checkClinic ($this->email);
		
		$recordCount = count($ret);


		header('Content-Type: application/json');
		echo json_encode ( $recordCount);
	}



	public function person()
	{

	
	

	
	

		$ret= $this->ForgotPWD_db->checkPerson ($this->email);
		

		$recordCount = count($ret);


		header('Content-Type: application/json');



		echo json_encode ( $recordCount);
	}



	public function response_const(){
		$response  = array();
		$response["serviceid "] = $this->request["serviceid"]; 
		$response["sequ"] = $this->request["sequ"]; 
		$response["systemid"] = $this->request["systemid"];
		$response["projectid"] = $this->request["projectid"]; 
		return $response;
	}

	public function updateClinic(){
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //鎴愬姛

		$ret = $this->ForgotPWD_db->updateClinic ($this->arr_values);
		
		if($ret==1){
			$success = true;
			$ret_msg="Updated successfully";
			$ret_code = "U00000";
		}else if($ret==0){
			$success = false;
			$ret_msg="Updating failed";
			$ret_code = "U99999";
		}else{
			$success = false;
			$ret_msg="Error,contact admin please";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;

		$response["response"] = $this->response_const(); 
		$response["response"]["success"] = $success; 
		$response["response"]["status"] = $status; 
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}

	public function updatePerson(){
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //鎴愬姛

		$ret = $this->ForgotPWD_db->updatePerson ($this->arr_values);
		
		if($ret==1){
			$success = true;
			$ret_msg="Updated successfully";
			$ret_code = "U00000";
		}else if($ret==0){
			$success = false;
			$ret_msg="Updating failed";
			$ret_code = "U99999";
		}else{
			$success = false;
			$ret_msg="Error,contact admin please";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;

		$response["response"] = $this->response_const(); 
		$response["response"]["success"] = $success; 
		$response["response"]["status"] = $status; 
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}


}

$ForgotPWD= new ForgotPWD();
?>

