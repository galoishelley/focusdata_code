<?php 
include_once('class.database.php');

class appointmentTime_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function update($arr_values){

        if($this->_dbug){
            echo "[---viewAll---$arr_values]";
            print_r($arr_values);
        }
/*
        print_r($arr_values);*/

        $where =" DOCTOR_APPOINTMENT_TIME_ID = ".intval($arr_values['DOCTOR_APPOINTMENT_TIME_ID']);
        unset($arr_values["DOCTOR_APPOINTMENT_TIME_ID"]);

        //md5
        foreach($arr_values as $k=>$v){
            if($k == "ACTIVE_STATUS"){
                $arr_values[$k] = 0;
            }
        }

        $ret = $this->db->updateData('fd_rel_doctor_appointment_time', $arr_values, $where);
        return $ret;
    }
}
?>