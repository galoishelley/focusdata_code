<?php 
include_once('class.database.php');

class saveDoctor_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function col_exists($arr_values){
        // print_r($arr_values);
        $where = "CUSTOMER_USER_ID = ".$arr_values["CUSTOMER_USER_ID"]." and DOCTOR_ID = ".$arr_values["DOCTOR_ID"];

        // echo $where;
        $ret = $this->db->col_exists('fd_rel_customer_doctor',$where);
        return $ret;
    }

    public function create($arr_values){

        if($this->col_exists($arr_values)){
            return 2;
        };
        // print_r("DB");
        // print_r($arr_values);
        $ret = $this->db->insertData('fd_rel_customer_doctor', $arr_values);

        return $ret;
    }

    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        // if($this->_dbug){
        //     echo "[---viewAll---arr_values]";
        //     print_r($arr_values);
        // }

        foreach($arr_values as $k=>$v){
            // echo 'key='.$k.',value='.$v;
            if($k=="CUSTOMER_USER_ID"){
                continue;
            }
            if($v=="%"){
                continue;
            }
            if($arr_values[$k]==""){
                $arr_values[$k] = "%";
            }else{
                $arr_values[$k] = "%".$arr_values[$k]."%";
            }

        }

        // if($this->_dbug){
        //     echo "[---viewAll---arr_values]";
        //     print_r($arr_values);
        // }


        $sql = "SELECT t3.CLINIC_USER_NAME, t3.CLINIC_ADDR, t4.DOCTOR_ID, t4.DOCTOR_TYPE, t4.DOCTOR_NAME, t4.ACTIVE_STATUS FROM `fd_rel_customer_doctor` t1
                left join (fd_rel_clinic_doctor t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id ) on t2.DOCTOR_ID = t1.DOCTOR_ID
                left join fd_doctor t4 on t1.DOCTOR_ID = t4.DOCTOR_ID
                where 
                t1.CUSTOMER_USER_ID = ".$arr_values['CUSTOMER_USER_ID']."
                AND t3.CLINIC_USER_NAME LIKE '".$arr_values['CLINIC_USER_NAME']."'
                AND t3.CLINIC_ADDR LIKE '".$arr_values['CLINIC_ADDR']."'
                AND t4.DOCTOR_NAME LIKE '".$arr_values['DOCTOR_NAME']."'";

        // if($this->_dbug){
        //     echo "[---viewAll---sql]";
        //     print_r($sql);
        // }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function remove($arr_values){
       if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }
        $arrlength=count($arr_values["CUSTOMER_USER_ID"]);
        for($i = 0; $i < $arrlength; $i++)
            $ret = $this->db->deleteData('fd_rel_customer_doctor',"CUSTOMER_USER_ID='".intval($arr_values["CUSTOMER_USER_ID"]["$i"])."' and DOCTOR_ID='".intval($arr_values["DOCTOR_ID"][$i])."'");
        return $ret;
    }
}
?>