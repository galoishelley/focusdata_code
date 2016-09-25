<?php
include_once ('class.SearchAppTimeID_db.php');
// define _DBUG_LOG 1;
class SearchAppTimeID
{
	private $SearchAppTimeID;
	private $arr_values = array();
	private $request;
	private $_dbug;

	public function __construct()
	{
		session_start ();
		$this->SearchAppTimeID = new SearchAppTimeID_DB();
		$this->_dbug = false;

		// $this->user_name = $_SESSION ['fd_user_name'];
		// $this->user_pwd = $_SESSION ['fd_user_pwd'];

		// $this->date = date("Y-m-d H:i:s",time());

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}

        if($this->_dbug){
            echo "[---SearchAppTimeID---request]";
            print_r($this->request);
        }

		$this->arr_values = $this->request["para"];

		if($this->_dbug){
	        echo "[---SearchAppTimeID---arr_values]";
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
		$response["serviceid "] = $this->request["serviceid"];
		$response["sequ"] = $this->request["sequ"];
		$response["systemid"] = $this->request["systemid"];
		$response["projectid"] = $this->request["projectid"];
		return $response;
	}

	public function viewAll()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000";

		$ret = $this->SearchAppTimeID->viewAll ($this->arr_values);
		
		if($ret!=""){
			$success = true;
			$ret_msg="查询成功";
			$ret_code = "S00000";
		}else{
			$success = true;
			$ret_msg="无符合条件数据";
			$ret_code = "S00001";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;


		// $data  = array();
		// $data["draw"] = $this->draw;
		// $data["recordsTotal"] = $records;
		// $data["recordsFiltered"] = $records;
		// $data["data"]=$ret["data"];
		
		// echo $ret;
		$response["response"] = $this->response_const();
		$response["response"]["success"] = $success;
		$response["response"]["status"] = $status;
		$response["response"]["data"] = $ret;

		echo json_encode ( $response );
	}
}

$SearchAppTimeID = new SearchAppTimeID();
?>