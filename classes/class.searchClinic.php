<?php
include_once ('class.searchClinic_db.php');

//deprecated______distance calculation on backend Added by Alex 2016.9.24
//include_once ('GoogleMap/service/DistanceMatrixService.php');

class SearchClinic
{
	private $searchclinic_db;
	private $arr_values = array();
	private $request;

	
	private $customer_user_id;
	private $distance_range;

	public function __construct()
	{
		session_start ();
		$this->searchclinic_db = new SearchClinic_DB();
		

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
			case 'GET_7_DAYS' :
				$this->get_7_days ();
				break;
			case 'GET_ALL_CLINIC' :
				$this->get_all_clinic();
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

	public function get_7_days()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功
		
		

		$ret["data"]=$this->searchclinic_db->sp_get_7_days($this->arr_values);


		$recordCount = count($ret["data"]);


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
		$response["response"]["data"] = $ret["data"];
		
		header('Content-Type: application/json');
		echo json_encode ( $response );
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
	
	
	public function get_all_clinic()
	{

		$page = $this->arr_values['pageNum'];


		$r=$this->searchclinic_db->sp_get_all_clinic_count($this->arr_values);
		$total = $r[0]["COUNT"];

		$pageSize = 10; //每页显示数
		$totalPage = ceil($total/$pageSize); //总页数
		$startPage = $page*$pageSize;



		$distance=0;
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功
		
		

		$ret["data"]=$this->searchclinic_db->sp_get_all_clinic($this->arr_values,$startPage,$pageSize);
		
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


		
		//deprecated______distance calculation on backend Added by Alex 2016.9.24 
		if(false &&$this->customer_user_id!=null)
		{
			$ret["my_address"] = $this->searchclinic_db->get_address($this->customer_user_id);
			
			$my_address=$ret["my_address"][0]["CUSTOMER_ADDR"].", ".
					$ret["my_address"][0]["CUSTOMER_SUBURB"].", ".
					$ret["my_address"][0]["STATE_NAME"].", Australia";
			
			$arrLength=count($ret["data"]);
			for($x = 0; $x < $arrLength; $x++)
			{
				$clinic_addr= $ret["data"][$x]["CLINIC_ADDR"].", ".
						$ret["data"][$x]["CLINIC_SUBURB"].", ".
						$ret["data"][$x]["STATE_NAME"].", Australia";
				
				$request = new GoogleMapAPI\Service\DistanceMatrixService();
				$request->addOrigin($my_address);
				$request->addDestination($clinic_addr);
				$responseMAP = $request->fetchJSON();
				
				$json = json_decode($responseMAP);
				if(isset($json))
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
		//deprecated______distance calculation on backend end
		

			
			
		//distance calculation Added by Alex 2017.3.15
		if($this->customer_user_id!=null)
		{
			$ret["my_address"] = $this->searchclinic_db->get_address($this->customer_user_id);
				
			$my_address_lat=$ret["my_address"][0]["CUSTOMER_LAT"];
			$my_address_lng=$ret["my_address"][0]["CUSTOMER_LNG"];
			
			
			$arrLength=count($ret["data"]);
			for($x = 0; $x < $arrLength; $x++)
			{
				$clinic_addr_lat= $ret["data"][$x]["CLINIC_LAT"];
				$clinic_addr_lng= $ret["data"][$x]["CLINIC_LNG"];
				if($clinic_addr_lat!=''&&$clinic_addr_lng!=''&&$my_address_lat!=''&&$my_address_lng!='')
					$distance=$this->vincentyGreatCircleDistance(floatval($my_address_lat), floatval($my_address_lng), floatval($clinic_addr_lat), floatval($clinic_addr_lng));
				else
					$distance=100000000;
			
// 				print_r($distance);
// 				echo "<br><br>";
				
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

	$SearchClinic = new SearchClinic();
?>