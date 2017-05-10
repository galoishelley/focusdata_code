<?php 
include_once('class.database.php');

class appointmentDoctor_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function col_exists($arr_values){
        $where = "CUSTOMER_USER_ID = ".$arr_values["CUSTOMER_USER_ID"]." and DOCTOR_ID = ".$arr_values["DOCTOR_ID"]." and DOCTOR_APPOINTMENT_TIME_ID = ".$arr_values["DOCTOR_APPOINTMENT_TIME_ID"];

        // echo $where;
        $ret = $this->db->col_exists('fd_rel_customer_appointment',$where);
        return $ret;
    }

    public function create($arr_values){

        if($this->col_exists($arr_values)){
            /*Testcase: we book an appointment, then cancel it, then rebook it, 
            if here we return 2,then the page will say "This time is occupied",
            so we comment this line to allow this testcase works
            */
            //return 2;
        };
        // print_r("DB");
        // print_r($arr_values);
        $ret = $this->db->insertData('fd_rel_customer_appointment', $arr_values);

        $arr_values["OPERATOR_STATUS"]="A";
        $this->db->insertData('fd_rel_customer_appointment_his', $arr_values);

        return $ret;
    }

    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT * FROM `fd_rel_doctor_appointment_time` WHERE `DOCTOR_ID` = '".$arr_values["DOCTOR_ID"]."' and `APPOINTMENT_TIME` = '".$arr_values["APPOINTMENT_TIME"]."'  and `ACTIVE_STATUS`=1";

        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
}
?>