<?php
include_once ('class.signup_clinic_db.php');
class Sign_up_clinic
{
	private $Sign_up_clinic;
	private $arr_values = array();
	private $request;
	private $_dbug;

	public function __construct()
	{
		session_start ();
		$this->Sign_up_clinic = new Sign_up_clinic_DB();
		$this->_dbug = false;

		// $this->user_name = $_SESSION ['user_name'];
		// $this->user_pwd = $_SESSION ['user_pwd'];
		$this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		
		if($this->_dbug){
            echo "[---Sign_up_clinic---request]";
            print_r($this->request);
        }


		$this->arr_values = $this->request["para"];
		if (isset ( $this->arr_values["action_type"] )){
			$action_type = $this->arr_values["action_type"];
			unset($this->arr_values["action_type"]);
		}else
		{
			$action_type = "";
		}
		
		$this->action = $action_type;

		$this->user_name = $this->arr_values["CLINIC_USER_MAIL"];
		$this->user_pwd = $this->arr_values["CLINIC_USER_PWD"];
		$this->arr_values["CREATE_USER"] = $this->user_name;
		$this->arr_values["UPDATE_USER"] = $this->user_name;
		$this->arr_values["CREATE_DATE"] = $this->date;
		$this->arr_values["UPDATE_DATE"] = $this->date;

		$this->action_type ();
	}
	private function action_type()
	{
		switch ($this->action)
		{
			case 'create' :
				$this->create ();
				break;
			case 'save' :
				$this->save ();
				break;
			case 'update' :
				$this->update ();
				break;
			case 'remove' :
				$this->remove ();
				break;	
			default :
				$this->viewAll ();
				//$this->getDataTime();
				break;
		}
	}

	public function response_const(){
		$response  = array();
		$response["serviceid "] = $this->request["serviceid"]; //功能编号 300003
		$response["sequ"] = $this->request["sequ"]; //时序号 随机4位数
		$response["systemid"] = $this->request["systemid"];   //focusdata 系统ID 黄页 100
		$response["projectid"] = $this->request["projectid"]; //focusdata项目ID 10001
		return $response;
	}

	public function create()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "Succeed";
		$ret_code = "UP0000"; 

		$ret = $this->Sign_up_clinic->create($this->arr_values);
		
		if($ret == 2){
			$success = false;
			$ret_msg="用户名已经存在";
			$ret_code = "UP0001";
		}elseif($ret>0){
			$success = true;
			$ret_msg="Succeed";
			$ret_code = "UP0000";
		}else{
			$success = false;
			$ret_msg="Error,contact admin please";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;

		//服务器模式data
		// $data  = array();
		// $data["draw"] = $this->draw;
		// $data["recordsTotal"] = $records;
		// $data["recordsFiltered"] = $records;
		// $data["data"]=$ret["data"];
		
		// echo $ret;
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = "";

		echo json_encode ( $response );
	}

	public function viewAll()
	{
		$ret = array ();
		$ret["data"]= $this->func->viewAll ($this->arr_values);

		echo json_encode ( $ret );
		//$this->logFile ( json_encode ( $return ) );
	}



	public function view()
	{
		$ret = array ();
		$ret["data"]= $this->func->view ();

		echo json_encode ( $ret );
		//$this->logFile ( json_encode ( $return ) );
	}

	 public function remove()
	{
		$ret = $this->func->remove ($this->arr_values);
		echo $ret;
		// echo json_encode ( $return );
	}

	public function update(){
		$ret = $this->func->update ($this->arr_values);
		echo $ret;
	}

}

$Sign_up_clinic = new Sign_up_clinic();
?>