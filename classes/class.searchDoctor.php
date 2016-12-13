<?php
include_once ('class.searchDoctor_db.php');
include_once ('GoogleMap/service/DistanceMatrixService.php');
// define _DBUG_LOG 1;
class SearchDoctor
{
	private $searchdoctor_db;
	private $arr_values = array();
	private $request;
	private $draw;
	private $start;
	private $length;
	
	private $requesttype;
	
	private $customer_user_id;
	private $distance_range;

	public function __construct()
	{
		session_start ();
		$this->searchdoctor_db = new SearchDoctor_DB();
		

		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}


		$this->arr_values = $this->request["para"];

		if(isset($this->arr_values["CUSTOMER_USER_ID"]))
			$this->customer_user_id=$this->arr_values["CUSTOMER_USER_ID"];
		
		if($this->customer_user_id!=null)
		{
			if($this->arr_values["DISTANCE"]=="20km")
				$this->distance_range=20000;
			else if($this->arr_values["DISTANCE"]=="10km")
				$this->distance_range=10000;
			else if($this->arr_values["DISTANCE"]=="5km")
				$this->distance_range=5000;
			else
				$this->distance_range=100000000; //10万公里
		}

		
		$this->searchdoctor ();
	}


	public function response_const(){
		$response  = array();
		$response["serviceid "] = $this->request["serviceid"]; //功能编号 300003
		$response["sequ"] = $this->request["sequ"]; //时序号 随机4位数
		$response["systemid"] = $this->request["systemid"];   //focusdata 系统ID 黄页 100
		$response["projectid"] = $this->request["projectid"]; //focusdata项目ID 10001
		return $response;
	}

	
	
	public function searchdoctor()
	{
		$distance=0;
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功
		
		

		$ret["data"]=$this->searchdoctor_db->index_search_sp($this->arr_values);


		$recordCount = count($ret["data"]);


		
		//distance calculation Added by Alex 2016.9.24
		if(false && $this->customer_user_id!=null)
		{
			$ret["my_address"] = $this->searchdoctor_db->get_address($this->customer_user_id);
			
			$my_address=$ret["my_address"][0]["CUSTOMER_ADDR"].", ".
					$ret["my_address"][0]["CUSTOMER_SUBURB"].", ".
					$ret["my_address"][0]["STATE_NAME"].", Australia";
			
			$arrLength=count($ret["data"]);
			for($x = 0; $x < $arrLength; $x++)
			{
				$doctor_addr= $ret["data"][$x]["CLINIC_ADDR"].", ".
						$ret["data"][$x]["CLINIC_SUBURB"].", ".
						$ret["data"][$x]["STATE_NAME"].", Australia";
				
				$request = new GoogleMapAPI\Service\DistanceMatrixService();
				$request->addOrigin($my_address);
				$request->addDestination($doctor_addr);
				$responseMAP = $request->fetchJSON();
				
				$json = json_decode($responseMAP);
				if ($json->status == 'OK') {
					if ($json->rows[0]->elements[0]->status == 'OK') {
						$distance = $json->rows[0]->elements[0]->distance->value; //单位：米
					}
				}
				if($distance>$this->distance_range)//距离大于要求范围，踢出数据集！
				{
					unset($ret["data"][$x]);
				}
	
			}
			$filteredArray = array_values($ret["data"]);
			$recordCount=count($filteredArray);
		}
		else
			$filteredArray = $ret["data"];
		//distance calculation end

		
		
		
		if($recordCount>0){
			$success = true;
			$ret_msg="查询成功";
			$ret_code = "S00000";
		}else if($recordCount==0){
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

		
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = $filteredArray;
		
		header('Content-Type: application/json');
		echo json_encode ( $response );
	}

}

$SearchDoctor = new SearchDoctor();
?>