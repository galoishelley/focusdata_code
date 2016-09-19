<?php
include_once ('class.searchDoctor_db.php');
// define _DBUG_LOG 1;
class SearchDoctor
{
	private $searchdoctor;
	private $arr_values = array();
	private $request;
	private $draw;
	private $start;
	private $length;
	private $_dbug;
	private $requesttype;

	public function __construct()
	{
		session_start ();
		$this->searchdoctor = new SearchDoctor_DB();
		$this->_dbug = false;
		// $this->user_name = $_SESSION ['fd_user_name'];
		// $this->user_pwd = $_SESSION ['fd_user_pwd'];
		$this->date = date("Y-m-d H:i:s",time());
		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
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
		//加载类型 第一次加载 还是点击按钮

		$this->requesttype = $this->request["requesttype"];

        if($this->_dbug){
            echo "[---searchDoctor---requesttype]";
            echo $this->requesttype;
        }

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;
		// echo "----------searchdoctor:";
		// print_r($this->request);


		$this->arr_values = $this->request["para"];

		if($this->_dbug){
	        echo "[---searchDoctor.php---__construct---arr_values]";
	        print_r($this->arr_values);
	    }
	    if (isset ( $this->arr_values["action_type"] )){
			$action_type = $this->arr_values["action_type"];
			unset($this->arr_values["action_type"]);
		}else
		{
			$action_type = "";
		}

		unset($this->arr_values["CUSTOMER_USER_ID"]);

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
			case 'index_search' :
				$this->index_search_view ();
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

	public function index_search_view()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;

		$records = $this->searchdoctor->index_search_view_count($this->arr_values,$this->requesttype);

		$ret["data"] = $this->searchdoctor->index_search_view ($this->arr_values,$this->requesttype,$this->start,$this->length);
		
		if($records>0){
			$success = true;
			$ret_msg="查询成功";
			$ret_code = "S00000";
		}else if($records==0){
			$success = true;
			$ret_msg="无符合条件数据";
			$ret_code = "S00001";
		}else{
			$success = false;
			$ret_msg="失败,请联系管理员";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;
		// print_r($status);

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

		// print_r($response);
		echo json_encode ( $response );
	}

	public function viewAll()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;

		$records = $this->searchdoctor->col_exists_sql($this->arr_values,$this->requesttype);

		$ret["data"] = $this->searchdoctor->viewAll ($this->arr_values,$this->requesttype,$this->start,$this->length);
		
		if($records>0){
			$success = true;
			$ret_msg="查询成功";
			$ret_code = "S00000";
		}else if($records==0){
			$success = true;
			$ret_msg="无符合条件数据";
			$ret_code = "S00001";
		}else{
			$success = false;
			$ret_msg="失败,请联系管理员";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;
		// print_r($status);

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

		// print_r($response);
		echo json_encode ( $response );
	}
}

$SearchDoctor = new SearchDoctor();
?>