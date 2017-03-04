<?php 
include_once('class.database.php');

class REQUESTING_FLAG_db{
    private $db;
    public function __construct(){  

    $this->db = new Database();
	
    }
    

    
    
    public function update($arr_values){
    
    
    	$where ="`REQUESTING_FLAG`= 0 and `DOCTOR_ID` = ".$arr_values["DOCTOR_ID"]." and `APPOINTMENT_DATE` = '".$arr_values["APPOINTMENT_DATE"]."' and `APPOINTMENT_TIME` = '".$arr_values["APPOINTMENT_TIME"]."'  and `ACTIVE_STATUS`=1";
    	
    	$arr=array();
    	$arr["REQUESTING_FLAG"]=1;
    	$arr["REQUESTING_USER_ID"]=$arr_values["CUSTOMER_USER_ID"];
    
    
    	$ret = $this->db->updateData('fd_rel_doctor_appointment_time', $arr, $where);
    	return $ret;
    }
    


}
?>