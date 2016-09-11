<?php 
include_once('class.database.php');

class ClinicOprDoctor_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function view($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---view---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT * FROM `fd_customer_user` WHERE `CUSTOMER_USER_ID` = '".$arr_values["CUSTOMER_USER_ID"]."'";

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function viewAll_admin_count($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT count(*) as count FROM fd_doctor t1
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                ON t1.DOCTOR_ID = t2.DOCTOR_ID
                 where 
                 t3.CLINIC_NAME like '%".$arr_values['CLINIC_NAME']."%'
                 and t3.CLINIC_ADDR like '%".$arr_values['CLINIC_ADDR']."%'
                 and t3.STATE_ID like '%".$arr_values['STATE_ID']."%'
                 and t1.DOCTOR_TYPE like '%".$arr_values['DOCTOR_TYPE']."%'
                 and t1.DOCTOR_NAME like '%".$arr_values['DOCTOR_NAME']."%'
                 and t1.ACTIVE_STATUS like '%".$arr_values['ACTIVE_STATUS']."%'";

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret[0]['count'];
    }


    public function viewAll_admin($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $limit = " limit ".$start.",".$lenght;
        $sql = "SELECT t1.*, t3.CLINIC_NAME, t3.CLINIC_ADDR,t4.STATE_NAME FROM fd_doctor t1
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                ON t1.DOCTOR_ID = t2.DOCTOR_ID
                left join fd_dict_state t4 on t4.state_id = t3.state_id
                 where 
                 t3.CLINIC_NAME like '%".$arr_values['CLINIC_NAME']."%'
                 and t3.CLINIC_ADDR like '%".$arr_values['CLINIC_ADDR']."%'
                 and t3.STATE_ID like '%".$arr_values['STATE_ID']."%'
                 and t1.DOCTOR_TYPE like '%".$arr_values['DOCTOR_TYPE']."%'
                 and t1.DOCTOR_NAME like '%".$arr_values['DOCTOR_NAME']."%'
                 and t1.ACTIVE_STATUS like '%".$arr_values['ACTIVE_STATUS']."%' order by t1.CREATE_DATE DESC ".$limit;

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT t1.*, t3.CLINIC_NAME, t3.CLINIC_ADDR,t4.STATE_NAME FROM fd_doctor t1
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                ON t1.DOCTOR_ID = t2.DOCTOR_ID
                left join fd_dict_state t4 on t4.state_id = t3.state_id
                 where t3.clinic_user_id = ".$arr_values['CLINIC_USER_ID']."
                 and t1.DOCTOR_TYPE like '%".$arr_values['DOCTOR_TYPE']."%'
                 and t1.DOCTOR_NAME like '%".$arr_values['DOCTOR_NAME']."%' and t1.ACTIVE_STATUS like '%".$arr_values['ACTIVE_STATUS']."%' order by t1.CREATE_DATE DESC";

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function update($arr_values){
        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---$arr_values]";
            print_r($arr_values);
        }
        // foreach($arr_values as $k=>$v){
        //     if($k=="ACTIVE_STATUS"){
        //         $arr_values[$k]=intval($v);
        //     }
        // }

        $values['ACTIVE_STATUS'] = intval($arr_values['ACTIVE_STATUS']);

         // echo $arr_values['ACTIVE_STATUS'][1];

        $arrlength=count($arr_values['DOCTOR_ID']);
        for($i = 0; $i < $arrlength; $i++){
            $where =" DOCTOR_ID = ".intval($arr_values['DOCTOR_ID'][$i]);
            // unset($arr_values["DOCTOR_ID"]);

            $ret = $this->db->updateData('fd_doctor', $values, $where);
            // echo $ret;
        }
        return $ret;

        // $this->db->updateData('qr_role',array('role_name'=>$role_name,
        //                                         'funcion_id'=>$funcion_id,
        //                                         'note'=>$note,
        //                                       ),'func_code='.$func_code);
    }

    public function update_doctor_info($arr_values){
        if($this->_dbug){
            echo "[---viewAll---$arr_values]";
            print_r($arr_values);
        }
         // print_r($arr_values);
        
        $where =" DOCTOR_ID = ".intval($arr_values['DOCTOR_ID']);
        unset($arr_values["DOCTOR_ID"]);

        $ret = $this->db->updateData('fd_doctor', $arr_values, $where);

        return $ret;
    }
}
?>