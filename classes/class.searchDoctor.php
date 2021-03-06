<?php
include_once ('class.searchDoctor_db.php');

class SearchDoctor
{
	private $searchdoctor_db;
	private $arr_values = array();
	private $request;

	
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
			case 'GET_DOCTOR' :
				$this->get_doctor();
				break;
			
			default :
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
	
	public function vincentyGreatCircleDistance(
			$latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000)
	{
		// convert from degrees to radians
		$latFrom = deg2rad($latitudeFrom);
		$lonFrom = deg2rad($longitudeFrom);
		$latTo = deg2rad($latitudeTo);
		$lonTo = deg2rad($longitudeTo);
	
		$lonDelta = $lonTo - $lonFrom;
		$a = pow(cos($latTo) * sin($lonDelta), 2) +
		pow(cos($latFrom) * sin($latTo) - sin($latFrom) * cos($latTo) * cos($lonDelta), 2);
		$b = sin($latFrom) * sin($latTo) + cos($latFrom) * cos($latTo) * cos($lonDelta);
	
		$angle = atan2(sqrt($a), $b);
		return $angle * $earthRadius;
	}
	
	
	public function get_doctor()
	{

		$page = $this->arr_values['pageNum'];
		$r=$this->searchdoctor_db->sp_get_doctor_count($this->arr_values);
		$total = $r[0]["COUNT"];

		$pageSize = 10; //每页显示数
		$totalPage = ceil($total/$pageSize); //总页数
		$startPage = $page*$pageSize;



		$distance=0;
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功
		
		

		$ret["data"]=$this->searchdoctor_db->sp_get_doctor($this->arr_values,$startPage,$pageSize);
		
		$arrlength=count($ret["data"]);
		
		//language filter begin 2017.3.1
		if(isset($this->arr_values['LANGUAGE']))
		{
			for($x = 0; $x < $arrlength; $x++)
			{
				
				$found=false;
				$arrDocLang=explode(",",$ret["data"][$x]["LANGUAGE_NAME"]);
				for($y = 0; $y < count($arrDocLang); $y++)
				{
					for($z = 0; $z < count($this->arr_values['LANGUAGE']); $z++)
					{
						if($arrDocLang[$y]==$this->arr_values['LANGUAGE'][$z])
						{
							$found=true;
						}
					}
				}
				if(!$found)
				{
					unset($ret["data"][$x]);
				}
			}
		}
		//language filter begin 2017.3.1 end


		$recordCount = count($ret["data"]);


		//distance calculation Added by Alex 2017.3.15
		if($this->customer_user_id!=null)
		{
			$ret["my_address"] = $this->searchdoctor_db->get_address($this->customer_user_id);
				
			$my_address_lat=$ret["my_address"][0]["CUSTOMER_LAT"];
			$my_address_lng=$ret["my_address"][0]["CUSTOMER_LNG"];
			
			
			$arrLength=count($ret["data"]);
			for($x = 0; $x < $arrLength; $x++)
			{
				$doctor_addr_lat= $ret["data"][$x]["CLINIC_LAT"];
				$doctor_addr_lng= $ret["data"][$x]["CLINIC_LNG"];
				if($doctor_addr_lat!=''&&$doctor_addr_lng!=''&&$my_address_lat!=''&&$my_address_lng!='')
					$distance=$this->vincentyGreatCircleDistance(floatval($my_address_lat), floatval($my_address_lng), floatval($doctor_addr_lat), floatval($doctor_addr_lng));
				else
					$distance=100000000;
					
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
			$ret_msg="Query successfully";
			$ret_code = "S00000";
		}else if($recordCount==0){
			$success = true;
			$ret_msg="No match data";
			$ret_code = "S00001";
		}else{
			$success = false;
			$ret_msg="Error,contact admin please";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;

		
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["page_info"]["total"] = 	$total;
		$response["response"]["page_info"]["pageSize"]  = $pageSize;  
		$response["response"]["page_info"]["totalPage"]  = $totalPage;
		$response["response"]["data"] = $filteredArray;
		
		header('Content-Type: application/json');
		echo json_encode ( $response );
	}
}

$SearchDoctor = new SearchDoctor();
?>