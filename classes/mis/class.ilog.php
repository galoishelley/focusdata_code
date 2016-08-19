<?php
include_once ('class.ilog_db.php');
class iLog
{
	private $ilog;
	private $arr_values = array();

	public function __construct()
	{
		session_start ();
		$this->ilog = new iLog_DB();

		$this->user_name = $_SESSION ['user_name'];
		$this->user_pwd = $_SESSION ['user_pwd'];
		$this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['action_type'] )){
				
			$action_type = $_POST ['action_type'];

			$this->action = $action_type;
			$this->action_type ();
		}
		else
		{

			if (isset ( $_POST ['begin_time'] )){
				$this->arr_values['begin_time'] = $_POST ['begin_time'];
			}

			if (isset ( $_POST ['end_time'] )){
				$this->arr_values['end_time'] = $_POST ['end_time'];
			}

			$this->action = "";
			$this->action_type ();
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

	public function viewAll()
	{
		$ret = array ();
		$ret["data"]= $this->ilog->viewAll ($this->arr_values);

		echo json_encode ( $ret );
		//$this->logFile ( json_encode ( $ret ) );
	}



	public function view()
	{
		$ret = array ();
		$ret["data"]= $this->ilog->view ();

		echo json_encode ( $ret );
		//$this->logFile ( json_encode ( $ret ) );
	}
}

$qr_ilog = new iLog();
?>