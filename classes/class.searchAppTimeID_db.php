<?php 
include_once('class.database.php');

class SearchAppTimeID_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }
        $sql = "SELECT * FROM `fd_rel_doctor_appointment_time` WHERE `DOCTOR_ID` = '".$arr_values["DOCTOR_ID"]."' and `APPOINTMENT_DATE` = str_to_date('".$arr_values["APPOINTMENT_DATE"]."','%d-%m-%Y') and `APPOINTMENT_TIME` = str_to_date('".$arr_values["APPOINTMENT_TIME"]."','%H:%i')  and `ACTIVE_STATUS`=1";

        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }
        // print_r($sql);

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
}
?>