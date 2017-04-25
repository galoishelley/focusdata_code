<?php 
include_once('class.database.php');

class SearchClinic_DB{
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
   
    public function sp_get_7_days($arr_values)
    {

    	$sql = "CALL `sp_get_7_days`(:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8);";

    	
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


    public function sp_get_all_clinic($arr_values,$startPage,$pageSize)
    {

    	$sql = "CALL `sp_get_all_clinic`(:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8,:p9,:p10);";

    	
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


	public function sp_get_all_clinic_count($arr_values)
    {

    	$sql = "CALL `sp_get_all_clinic_count`(:p0,:p1,:p2,:p3,:p4,:p5,:p6,:p7,:p8);";

    	
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