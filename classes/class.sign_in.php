<?php
include_once ('class.sign_in_db.php');
class Sign_in
{
	private $sign_in;
	private $arr_values = array();
	private $_dbug;

	public function __construct()
	{
		session_start ();
		$this->sign_in = new Sign_in_DB();
		$this->_dbug = false;

		// $this->user_name = $_SESSION ['user_name'];
		// $this->user_pwd = $_SESSION ['user_pwd'];
		// $this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}

		if($this->_dbug){
		    echo "[---Sign_in---request]";
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
		$ret_code = "I00000"; //成功

		$retData=array();



		$ret= $this->sign_in->viewAll ($this->arr_values);
		
		$count = $ret[0]["COUNT"];

		if($count == 1){
			$success = true;
			$ret_msg="登录成功";
			$ret_code = "I00000";
			$_SESSION ['fd_user_name'] = $this->arr_values["USER_MAIL"];
			$_SESSION ['fd_user_pwd'] = $this->arr_values["USER_PWD"];
			$retData= $this->sign_in->getUserName($this->arr_values);
		}elseif($count == 0){
			$success = false;
			$ret_msg="用户名密码错误";
			$ret_code = "I00001";
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
		$response["response"]["data"] = $retData;

		echo json_encode ( $response );
	}

}

$Sign_in = new Sign_in();
?>

