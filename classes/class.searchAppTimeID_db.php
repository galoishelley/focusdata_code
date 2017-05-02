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
        $sql = "SELECT * FROM `fd_rel_doctor_appointment_time` WHERE `DOCTOR_ID` = ".$arr_values["DOCTOR_ID"]." and `APPOINTMENT_DATE` = '".$arr_values["APPOINTMENT_DATE"]."' and `APPOINTMENT_TIME` = '".$arr_values["APPOINTMENT_TIME"]."'";

        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }


        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
}
?>