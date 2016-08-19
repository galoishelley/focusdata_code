<?php
include_once ('class.role_db.php');
class Func
{
	private $func;
	private $arr_values = array();

	public function __construct()
	{
		session_start ();
		$this->func = new Role_DB();

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
				if (isset ( $_POST ['note'] )){
					$this->arr_values['note'] = $_POST ['note'];
				}
				
				if($action_type == "create"){
					$this->arr_values['create_user'] = $this->user_name;
					$this->arr_values['create_date'] = $this->date;
				}

				$this->arr_values['update_user'] = $this->user_name;
				$this->arr_values['update_date'] = $this->date;

			}elseif($action_type == "remove"){

				if (isset ( $_POST ['func_codes'] )){
					$this->arr_values = $_POST ['func_codes'];
				}

			}
			
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
		$ret = $this->func->create($this->arr_values);
		echo $ret;
	}
	/*
	public function save()
	{
	$this->students->save ();
	$studentId = $this->students->lastid;
	$this->contacts->save ( $studentId );
	}
	public function update()
	{
	//$this->students->update ();
	$this->contacts->update ();
	}
	*/
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
}

$qr_func = new Func();
?>