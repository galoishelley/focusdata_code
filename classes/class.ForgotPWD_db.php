<?php 
include_once('class.database.php');

class ForgotPWD_db{
    private $db;
    public function __construct(){  

    $this->db = new Database();
	
    }

    public function checkClinic($MAIL){

        $sql = "SELECT * FROM fd_clinic_user WHERE CLINIC_USER_MAIL='".$MAIL."'";

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

	public function checkPerson($MAIL){

        $sql = "SELECT * FROM fd_customer_user WHERE CUSTOMER_USER_MAIL='".$MAIL."'";

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function updateClinic($arr_values){
        
        $where =" CLINIC_USER_MAIL = '".$arr_values['CLINIC_USER_MAIL']+"'";
       
        unset($arr_values["CLINIC_USER_MAIL"]);

        foreach($arr_values as $k=>$v){
            if($k=="CLINIC_USER_PWD"){
                $arr_values[$k]=md5($v);
            }
        }
        $ret = $this->db->updateData('fd_clinic_user', $arr_values, $where);
        return $ret;

    }


    public function updatePerson($arr_values){
        
        $where =" CUSTOMER_USER_MAIL = '".$arr_values['CUSTOMER_USER_MAIL']."'";
       
        unset($arr_values["CUSTOMER_USER_MAIL"]);

        foreach($arr_values as $k=>$v){
            if($k=="CUSTOMER_USER_PWD"){
                $arr_values[$k]=md5($v);
            }
        }
        $ret = $this->db->updateData('fd_customer_user', $arr_values, $where);
        return $ret;

    }
}
?>