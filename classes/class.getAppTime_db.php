<?php 
include_once('class.database.php');

class getAppTime_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function viewAll($arr_values=0,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }



        $sql = "SELECT DOCTOR_APPOINTMENT_TIME_ID,DOCTOR_ID,APPOINTMENT_DATE,date_format(APPOINTMENT_TIME,'%H:%i') as APPOINTMENT_TIME,ACTIVE_STATUS FROM `fd_rel_doctor_appointment_time` WHERE ACTIVE_STATUS = 1 and  `DOCTOR_ID` = ".$arr_values['DOCTOR_ID'] ." and APPOINTMENT_DATE = str_to_date('".$arr_values['APPOINTMENT_DATE']."','%d-%m-%Y') and if( str_to_date('".$arr_values['APPOINTMENT_DATE']."','%d-%m-%Y')  > CURDATE(),APPOINTMENT_TIME like '%',APPOINTMENT_TIME >= CURTIME()) ORDER BY APPOINTMENT_DATE ASC";

        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }
        // print_r($sql);
        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function viewAll_User($arr_values=0,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT DISTINCT `CUSTOMER_SUBURB` FROM `fd_customer_user` where  CUSTOMER_SUBURB != '' ORDER BY `CUSTOMER_SUBURB` ASC";

        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
}
?>