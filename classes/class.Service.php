<?php
include_once ('class.Service_db.php');
// define _DBUG_LOG 1;
class Service
{
	private $Service;
	private $arr_values = array();
	private $request;
	private $_dbug;
	private $user_name,$user_pwd;
	private $draw;

	public function __construct()
	{
		session_start ();
		$this->Service = new Service_DB();
		$this->_dbug = false;

		$this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}

        if($this->_dbug){
            echo "[---Service---request]";
            print_r($this->request);
        }

        if (isset ( $_POST ['draw'])){
			$this->draw = $_POST ['draw'];
		}
		if (isset ( $_POST ['start'])){
			$this->start = $_POST ['start'];
		}
		if (isset ( $_POST ['length'])){
			$this->length = $_POST ['length'];
		}

		$this->arr_values = $this->request["para"];

		if($this->_dbug){
	        echo "[---Service---arr_values]";
	        print_r($this->arr_values);
	    }

	    $this->requesttype = $this->request["requesttype"];
        if($this->requesttype==1){
        	$this->user_name = $_SESSION ['fd_user_name'];
			$this->user_pwd = $_SESSION ['fd_user_pwd'];
        }

	    if (isset ( $this->arr_values["action_type"] )){
			$action_type = $this->arr_values["action_type"];
			unset($this->arr_values["action_type"]);
		}else
		{
			$action_type = "";
		}
		
		if($action_type == "create"){
			$this->arr_values["CREATE_USER"] = $this->user_name;
			$this->arr_values["UPDATE_USER"] = $this->user_name;
			$this->arr_values["CREATE_DATE"] = $this->date;
			$this->arr_values["UPDATE_DATE"] = $this->date;
		}else if($action_type == "update"){
			$this->arr_values["UPDATE_USER"] = $this->user_name;
			$this->arr_values["UPDATE_DATE"] = $this->date;
		}

		$this->action = $action_type;
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
			case 'update_active' :
				$this->update_active ();
				break;
			case 'remove' :
				$this->remove ();
				break;
			case 'view_name_area' :
				$this->view_name_area ();
				break;	
			case 'view' :
				$this->view ();
				break;	
			default :
				$this->view ();
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

	public function view()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		$ret = $this->Service->view ($this->arr_values);
		
		if($ret!=""){
			$success = true;
			$ret_msg="Query successfully";
			$ret_code = "S00000";
		}else{
			$success = true;
			$ret_msg="No match data";
			$ret_code = "S00001";
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
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}

	public function viewAll()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		$ret = $this->Service->viewAll ($this->arr_values);
		
		if($ret!=""){
			$success = true;
			$ret_msg="Query successfully";
			$ret_code = "S00000";
		}else{
			$success = true;
			$ret_msg="No match data";
			$ret_code = "S00001";
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
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}

	public function view_name_area()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		$records = $this->Service->view_name_area_count ($this->arr_values);

		$ret["data"] = $this->Service->view_name_area ($this->arr_values,0,$this->start,$this->length);
		
		if($ret!=""){
			$success = true;
			$ret_msg="Query successfully";
			$ret_code = "S00000";
		}else{
			$success = true;
			$ret_msg="No match data";
			$ret_code = "S00001";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;

		//服务器模式data
		$data  = array();
		$data["draw"] = $this->draw;
		$data["recordsTotal"] = $records;
		$data["recordsFiltered"] = $records;
		$data["data"]=$ret["data"];
		
		// echo $ret;
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = $data;

		echo json_encode ( $response );
	}

	public function update_active(){
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;

		$ret = $this->Service->update_active ($this->arr_values);
		
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
		// print_r($status);

		// //服务器模式data
		// $data  = array();
		// $data["draw"] = $this->draw;
		// $data["recordsTotal"] = $records;
		// $data["recordsFiltered"] = $records;
		// $data["data"]=$ret["data"];
		
		// echo $ret;
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}

	public function update(){
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;

		$ret = $this->Service->update ($this->arr_values);
		
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
		// print_r($status);

		// //服务器模式data
		// $data  = array();
		// $data["draw"] = $this->draw;
		// $data["recordsTotal"] = $records;
		// $data["recordsFiltered"] = $records;
		// $data["data"]=$ret["data"];
		
		// echo $ret;
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}
}

$Service = new Service();
?>