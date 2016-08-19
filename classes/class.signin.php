<?php
include_once ('class.signin_db.php');
class Signin
{
	private $signin;
	private $arr_values = array();

	public function __construct()
	{
		session_start ();
		$this->signin = new Signin_DB();

		// $this->user_name = $_SESSION ['user_name'];
		// $this->user_pwd = $_SESSION ['user_pwd'];
		$this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		// print_r($this->request);
		$this->arr_values = $this->request["para"];

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

	public function ret_str(){
		$response  = array();
		$response["serviceid "] = $this->request["serviceid"];
		$response["sequ"] = $this->request["sequ"];
		$response["systemid"] = $this->request["systemid"];
		$response["projectid"] = $this->request["projectid"];
		return $response;
	}

	public function viewAll()
	{
		$ret = array ();
		$ret_arr["response"]  = array();
		$state = 0;
		$msg = "";
		$result = "";

		$ret= $this->signin->viewAll ($this->arr_values);
		// echo $ret["COUNT"];
		$count = $ret[0]["COUNT"];
		if($count == 1){
			$response["state"] = 1;
			$state = $count;
			$msg = "登录成功";
			$result = "";

			$_SESSION ['fd_user_name'] = $this->arr_values["USER_NAME"];
			$_SESSION ['fd_user_pwd'] = $this->arr_values["USER_PWD"];
			
		}elseif($count == 0){
			$state = $count;
			$msg = "用户名密码错误";
			$result = "";
		}else{
			$state = $count;
			$msg = "登录失败,请联系管理员";
			$result = "";
		}

		$ret_arr["response"] = $this->ret_str();
		$ret_arr["response"]["state"] = $state;
		$ret_arr["response"]["msg"] = $msg;
		$ret_arr["response"]["result"] = $result;

		echo json_encode ( $ret_arr );
	}

}

$Signin = new Signin();
?>