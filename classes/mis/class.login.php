<?php
include_once ('class.login_db.php');
include_once ('class.ilog_db.php');

class Login
{
	private $users;
	private $ilog;
	private $user_name;
	private $pwd;
	private $arr_values = array();
	private $arr_values_log = array();

	public function __construct()
	{
		session_start ();
		$this->users = new User();
		$this->ilog = new iLog_DB();
		$this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['user_name'] ) && isset ( $_POST ['pwd'] ))
		{
			
			$this->user_name = $_POST ['user_name'];
			$this->pwd = $_POST ['pwd'];
			
			$_SESSION ['user_name'] = $this->user_name;
			$_SESSION ['user_pwd'] = $this->pwd;
			
			//$json = json_decode ( $_SESSION ["jsonData"], true );
			
			//$this->data = $json;
			
			$this->action = "";
			$this->action_type ();
		}
		else
		{
			
			$this->action = "";
			$this->action_type ();
			
			// echo 'JSON is empty';
		}
	}
	public function action_type()
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
				$this->view ();
				break;
		}
	}

	public function view()
	{
		$return = array ();

		//login
		$return ['iCount'] = $this->users->viewCount ($this->user_name, $this->pwd);
		// $this->arr_values['opr_content'] = "登录系统";
		// $this->arr_values['create_user'] = $this->user_name;
		// $this->arr_values['create_date'] = $this->date;
		// $this->logFile($this->arr_values);
		// //log
		if($return ['iCount']){
			$this->arr_values_log['opr_content'] = "登录系统";
			$this->arr_values_log['create_user'] = $this->user_name;
			$this->arr_values_log['create_date'] = $this->date;
			$this->logFile($this->arr_values_log);
		}

		echo json_encode ($return);
		
		
		//$this->logFile ( json_encode ( $return ) );
	}

	private function logFile($arr_values_log)
	{
		$ret = $this->ilog->create($arr_values_log);
		//echo $ret;
	}
}

$login = new Login ();
?>