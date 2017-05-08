<?php 
include_once('class.database.php');

class SearchDoctor_DB{
    private $db;
 
    public function __construct(){  
    $this->db = new Database();

    }

    public function get_address($id)
    {
    	$sql = "SELECT * 
    			FROM fd_customer_user t1 left join fd_dict_state t2 
    			on t1.state_id=t2.state_id 
    			WHERE 
    			CUSTOMER_USER_ID=".$id;
    	
    	$ret = $this->db->fetchAll_sql($sql,null);
    	
    	return $ret;
    }

	public function isStateName($addr)
	{
		$result=false;
		$addr=strtolower($addr);
		if($addr=="australian capital territory")
			$result=true;
		else if($addr=="act")
			$result=true;
		else if($addr=="new south wales")
			$result=true;
		else if($addr=="nsw")
			$result=true;
		else if($addr=="victoria")
			$result=true;
		else if($addr=="vic")
			$result=true;
		else if($addr=="queensland")
			$result=true;
		else if($addr=="qld")
			$result=true;
		else if($addr=="south australia")
			$result=true;
		else if($addr=="sa")
			$result=true;
		else if($addr=="western australia")
			$result=true;
		else if($addr=="wa")
			$result=true;
		else if($addr=="tasmania")
			$result=true;
		else if($addr=="tas")
			$result=true;
		else if($addr=="northern territory")
			$result=true;
		else if($addr=="nt")
			$result=true;
		else
			$result=false;
		return $result;
	}

	public function getStateName($addr)
	{
		$result="";
		$addr=strtolower($addr);
		if($addr=="australian capital territory")
			$result="ACT";
		else if($addr=="act")
			$result="ACT";
		else if($addr=="new south wales")
			$result="NSW";
		else if($addr=="nsw")
			$result="NSW";
		else if($addr=="victoria")
			$result="VIC";
		else if($addr=="vic")
			$result="VIC";
		else if($addr=="queensland")
			$result="QLD";
		else if($addr=="qld")
			$result="QLD";
		else if($addr=="south australia")
			$result="SA";
		else if($addr=="sa")
			$result="SA";
		else if($addr=="western australia")
			$result="WA";
		else if($addr=="wa")
			$result="WA";
		else if($addr=="tasmania")
			$result="TAS";
		else if($addr=="tas")
			$result="TAS";
		else if($addr=="northern territory")
			$result="NT";
		else if($addr=="nt")
			$result="NT";
		else
			$result="";
		return $result;
	}

    public function sp_get_doctor($arr_values,$startPage,$pageSize)
    {

    	$sql = "CALL `sp_get_doctor`(:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9,:p10);";

    	
    	if(isset($arr_values['APPOINTMENT_DATE'])) 
    	{
	    	if($arr_values['APPOINTMENT_DATE']=="")
	    		$p0=date('Y-m-d');
	    	else
	    		$p0=date('Y-m-d', strtotime($arr_values['APPOINTMENT_DATE']));
    	}
    	else
    		$p0=date('Y-m-d');
    	
    	if(isset($arr_values['CLINIC_SUBURB']))
    	{
	    	if($arr_values['CLINIC_SUBURB']=="")
	    	{
	    		$p1="";
	    		$p2="";
	    		$p3="";
	    	}
			else if(preg_match("/\d{4}/", $arr_values['CLINIC_SUBURB'], $matches)===1)
			{
				$p1="";
	    		$p2=$matches[0];
	    		$p3="";
			}
			else if($this->isStateName($arr_values['CLINIC_SUBURB']))
			{
				$p1="";
	    		$p2="";
	    		$p3=$this->getStateName($arr_values['CLINIC_SUBURB']);
			}
	    	else
	    	{
	    		
	    		
	    		if (strpos($arr_values['CLINIC_SUBURB'], ',') !== false) {
	    			$p1=explode(",",$arr_values['CLINIC_SUBURB'])[0];
	    			$tmp=explode(",",$arr_values['CLINIC_SUBURB'])[1];
	    			$tmp=ltrim($tmp," ");
	    			if (strpos($tmp, ' ') !== false)
	    			{
	    				$p2=explode(" ",$tmp)[1];
	    				$p3=explode(" ",$tmp)[0];
	    			}
	    			else
	    			{
	    				$p1=$arr_values['CLINIC_SUBURB'];
	    				$p2="";
	    				$p3="";
	    			}
	    		}
	    		else
	    		{
	    			$p1=$arr_values['CLINIC_SUBURB'];
	    			$p2="";
	    			$p3="";
	    		}
	    		

	    		
	    	}
    	}
    	else
    	{
    		$p1="";
    		$p2="";
    		$p3="";
    	}
    	
    	if(isset($arr_values['DOCTOR_TYPE']))
    		$p4=$arr_values['DOCTOR_TYPE'];
    	else
    		$p4="";
    	
    	if(isset($arr_values['CLINIC_NAME']))
    		$p5=$arr_values['CLINIC_NAME'];
    	else
    		$p5="";
    		
    	if(isset($arr_values['DOCTOR_NAME']))
    		$p6=$arr_values['DOCTOR_NAME'];
    	else
    		$p6="";
    	
    	if(isset($arr_values['DOCTOR_ID']))
    		$p7=$arr_values['DOCTOR_ID'];
    	else
    		$p7="";
    	
    	if(isset($arr_values['CLINIC_USER_ID']))
    		$p8=$arr_values['CLINIC_USER_ID'];
    	else
    		$p8="";


		$p9=$startPage;
		$p10=$pageSize;

    	$stmt = $this->db->prepare($sql);
    	
    	$stmt->bindParam(':p0', $p0, PDO::PARAM_STR);
    	$stmt->bindParam(':p1', $p1, PDO::PARAM_STR);
    	$stmt->bindParam(':p2', $p2, PDO::PARAM_STR);
    	$stmt->bindParam(':p3', $p3, PDO::PARAM_STR);
    	$stmt->bindParam(':p4', $p4, PDO::PARAM_STR);
    	$stmt->bindParam(':p5', $p5, PDO::PARAM_STR);
    	$stmt->bindParam(':p6', $p6, PDO::PARAM_STR);
    	$stmt->bindParam(':p7', $p7, PDO::PARAM_STR);
    	$stmt->bindParam(':p8', $p8, PDO::PARAM_STR);
		$stmt->bindParam(':p9', $p9, PDO::PARAM_STR);
    	$stmt->bindParam(':p10', $p10, PDO::PARAM_STR);
    	$stmt->execute();
    	
    	return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


	public function sp_get_doctor_count($arr_values)
    {

    	$sql = "CALL `sp_get_doctor_count`(:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8);";

    	
    	if(isset($arr_values['APPOINTMENT_DATE'])) 
    	{
	    	if($arr_values['APPOINTMENT_DATE']=="")
	    		$p0=date('Y-m-d');
	    	else
	    		$p0=date('Y-m-d', strtotime($arr_values['APPOINTMENT_DATE']));
    	}
    	else
    		$p0=date('Y-m-d');
    	
    	if(isset($arr_values['CLINIC_SUBURB']))
    	{
	    	if($arr_values['CLINIC_SUBURB']=="")
	    	{
	    		$p1="";
	    		$p2="";
	    		$p3="";
	    	}
			else if(preg_match("/\d{4}/", $arr_values['CLINIC_SUBURB'], $matches)===1)
			{
				$p1="";
	    		$p2=$matches[0];
	    		$p3="";
			}
			else if($this->isStateName($arr_values['CLINIC_SUBURB']))
			{
				$p1="";
	    		$p2="";
	    		$p3=$this->getStateName($arr_values['CLINIC_SUBURB']);
			}
	    	else
	    	{
	    		
	    		
	    		if (strpos($arr_values['CLINIC_SUBURB'], ',') !== false) {
	    			$p1=explode(",",$arr_values['CLINIC_SUBURB'])[0];
	    			$tmp=explode(",",$arr_values['CLINIC_SUBURB'])[1];
	    			$tmp=ltrim($tmp," ");
	    			if (strpos($tmp, ' ') !== false)
	    			{
	    				$p2=explode(" ",$tmp)[1];
	    				$p3=explode(" ",$tmp)[0];
	    			}
	    			else
	    			{
	    				$p1=$arr_values['CLINIC_SUBURB'];
	    				$p2="";
	    				$p3="";
	    			}
	    		}
	    		else
	    		{
	    			$p1=$arr_values['CLINIC_SUBURB'];
	    			$p2="";
	    			$p3="";
	    		}
	    		

	    		
	    	}
    	}
    	else
    	{
    		$p1="";
    		$p2="";
    		$p3="";
    	}
    	
    	if(isset($arr_values['DOCTOR_TYPE']))
    		$p4=$arr_values['DOCTOR_TYPE'];
    	else
    		$p4="";
    	
    	if(isset($arr_values['CLINIC_NAME']))
    		$p5=$arr_values['CLINIC_NAME'];
    	else
    		$p5="";
    		
    	if(isset($arr_values['DOCTOR_NAME']))
    		$p6=$arr_values['DOCTOR_NAME'];
    	else
    		$p6="";
    	
    	if(isset($arr_values['DOCTOR_ID']))
    		$p7=$arr_values['DOCTOR_ID'];
    	else
    		$p7="";
    	
    	if(isset($arr_values['CLINIC_USER_ID']))
    		$p8=$arr_values['CLINIC_USER_ID'];
    	else
    		$p8="";


	
    	

    	$stmt = $this->db->prepare($sql);
    	
    	$stmt->bindParam(':p0', $p0, PDO::PARAM_STR);
    	$stmt->bindParam(':p1', $p1, PDO::PARAM_STR);
    	$stmt->bindParam(':p2', $p2, PDO::PARAM_STR);
    	$stmt->bindParam(':p3', $p3, PDO::PARAM_STR);
    	$stmt->bindParam(':p4', $p4, PDO::PARAM_STR);
    	$stmt->bindParam(':p5', $p5, PDO::PARAM_STR);
    	$stmt->bindParam(':p6', $p6, PDO::PARAM_STR);
    	$stmt->bindParam(':p7', $p7, PDO::PARAM_STR);
    	$stmt->bindParam(':p8', $p8, PDO::PARAM_STR);

    	$stmt->execute();
    	
    	return $stmt->fetchAll(PDO::FETCH_ASSOC);
    	
    }
}
?>