<?php 
include_once('class.database.php');

class getAppDate_DB{
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
        $sql = "SELECT DISTINCT APPOINTMENT_DATE FROM `fd_rel_doctor_appointment_time` WHERE `DOCTOR_ID` = ".$arr_values['DOCTOR_ID'] ." and APPOINTMENT_DATE >= curdate() ORDER BY APPOINTMENT_DATE ASC";

        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }
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