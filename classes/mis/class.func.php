<?php
include_once ('class.func_db.php');
include_once ('class.ilog_db.php');
class Func
{
	private $func;
	private $ilog;
	private $arr_values = array();
	private $arr_values_log = array();

	public function __construct()
	{
		session_start ();
		$this->func = new Func_DB();
		$this->ilog = new iLog_DB();

		$this->user_name = $_SESSION ['user_name'];
		$this->user_pwd = $_SESSION ['user_pwd'];
		$this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['action_type'] )){
				
			$action_type = $_POST ['action_type'];
			
			if($action_type == "create" || $action_type == "update"){

				if (isset ( $_POST ['func_code'] )){
					$this->arr_values['func_code'] = $_POST ['func_code'];
				}

				if (isset ( $_POST ['func_name'] )){
					$this->arr_values['func_name'] = $_POST ['func_name'];
				}
				if (isset ( $_POST ['func_note'] )){
					$this->arr_values['note'] = $_POST ['func_note'];
				}
				
				if($action_type == "create"){
					$this->arr_values['create_user'] = $this->user_name;
					$this->arr_values['create_date'] = $this->date;
				}
				if($action_type == "update"){
					if (isset ( $_POST ['func_id'] )){
						$this->arr_values['func_id'] = $_POST ['func_id'];
					}
				}

				$this->arr_values['update_user'] = $this->user_name;
				$this->arr_values['update_date'] = $this->date;

			}elseif($action_type == "remove"){

				if (isset ( $_POST ['func_ids'] )){
					$this->arr_values = $_POST ['func_ids'];
				}

			}
			
			$this->arr_values_log['create_user'] = $this->user_name;
			$this->arr_values_log['create_date'] = $this->date;

			//$_SESSION ['jsonData'] = $json;
				
			//$json = json_decode ( $_SESSION ["jsonData"], true );
				
			//$this->data = $json;
				
			$this->action = $action_type;
			$this->action_type ();
		}
		else
		{
			//$return["login_user"] = $this->user_name;
			//echo json_encode ( $return );

			if (isset ( $_POST ['search_con'] )){
				$this->arr_values['search_con'] = $_POST ['search_con'];
			}else
			{
				$this->arr_values['search_con'] = 'null';
			}
			
			$this->action = "";
			$this->action_type ();
			// echo 'JSON is empty';
		}
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

	public function create()
	{
		// print_r($this->arr_values);
		$ret["data"] = $this->func->create($this->arr_values);
		// echo $ret["data"];
		if($ret["data"] != 2 && $ret["data"] != 0){
			$this->arr_values_log['opr_content'] = "增加权限:{".$this->arr_values['func_code']."}";
			$this->logFile($this->arr_values_log);
		}
		echo json_encode ( $ret );
	}
	
	public function save()
	{
		$this->students->save ();
		$studentId = $this->students->lastid;
		$this->contacts->save ( $studentId );
	}
	// public function update()
	// {
	// //$this->students->update ();
	// $this->contacts->update ();
	// }
	
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
		$ret = array ();
		$ret["data"] = $this->func->remove ($this->arr_values);
		if($ret["data"]!=""){
			$this->arr_values_log['opr_content'] = "删除权限";
			$this->logFile($this->arr_values_log);
		}
		echo json_encode ( $ret );
	}

	public function update(){
		$ret["data"] = $this->func->update ($this->arr_values);
		if($ret["data"]!=""){
			$this->arr_values_log['opr_content'] = "修改权限:{".$this->arr_values['func_code']."}";
			$this->logFile($this->arr_values_log);
		}
		echo json_encode ( $ret );
	}

	public function getDataTime(){
		// var d = new Date()
		// var vYear = d.getFullYear()
		// var vMon = d.getMonth() + 1
		// var vDay = d.getDate()
		// var h = d.getHours(); 
		// var m = d.getMinutes(); 
		// var se = d.getSeconds(); 
		// s=vYear+(vMon<10 ? "0" + vMon : vMon)+(vDay<10 ? "0"+ vDay : vDay)+(h<10 ? "0"+ h : h)+(m<10 ? "0" + m : m)+(se<10 ? "0" +se : se);
		//document.write(s);
	}
		// private function logFile($msg)
		// {
		// 	$myFile = "visibility.txt";
		// 	$fh = fopen ( $myFile, 'a' ) or die ( "can't open file" );
		// 	if (is_array ( $msg ))
		// 	{
		// 	fwrite ( $fh, print_r ( $msg, TRUE ) );
		// 	}
		// 	else
		// 	{
		// 	fwrite ( $fh, $msg . PHP_EOL );
		// 	}
		// 	fclose ( $fh );
		// }
	private function logFile($arr_values_log)
	{
		$ret = $this->ilog->create($arr_values_log);
		//echo $ret;
	}
}

$qr_func = new Func();
?>