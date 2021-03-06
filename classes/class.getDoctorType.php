<?php
include_once ('class.getDoctorType_db.php');
// define _DBUG_LOG 1;
class getDoctorType
{
	private $getDoctorType;
	private $arr_values = array();
	private $request;
	private $_dbug;

	public function __construct()
	{
		session_start ();
		$this->getDoctorType = new getDoctorType_DB();
		$this->_dbug = false;

		// $this->user_name = $_SESSION ['fd_user_name'];
		// $this->user_pwd = $_SESSION ['fd_user_pwd'];

		// $this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}

        if($this->_dbug){
            echo "[---getDoctorType---request]";
            print_r($this->request);
        }

		$this->arr_values = $this->request["para"];

		if($this->_dbug){
	        echo "[---getDoctorType---arr_values]";
	        print_r($this->arr_values);
	    }

		$this->action = "";
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

	public function viewAll()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		$ret = $this->getDoctorType->viewAll ();
		
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
}

$getDoctorType = new getDoctorType();
?>