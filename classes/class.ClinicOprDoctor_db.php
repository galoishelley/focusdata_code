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
                 and t3.CLINIC_SUBURB like '%".$arr_values['CLINIC_SUBURB']."%'
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
        $sql = "SELECT t1.*, t3.CLINIC_NAME, t3.CLINIC_ADDR,t3.CLINIC_SUBURB, t3.CLINIC_POSTCODE,t4.STATE_NAME FROM fd_doctor t1
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                ON t1.DOCTOR_ID = t2.DOCTOR_ID
                left join fd_dict_state t4 on t4.state_id = t3.state_id
                 where 
                 t3.CLINIC_NAME like '%".$arr_values['CLINIC_NAME']."%'
                 and t3.CLINIC_SUBURB like '%".$arr_values['CLINIC_SUBURB']."%'
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


$sql = "select ta.*, GROUP_CONCAT(tc.interest_name  SEPARATOR ',') as INTEREST_NAME from (
SELECT t1.*,GROUP_CONCAT(t6.language_name  SEPARATOR ',') as LANGUAGE_NAME,
         t3.CLINIC_NAME,t3.CLINIC_ADDR,t3.CLINIC_POSTCODE,t3.CLINIC_SUBURB,t4.STATE_NAME 
        		FROM fd_doctor t1 left join 
        		(fd_rel_doctor_language as t5 left join fd_dict_language as t6 on t5.LANGUAGE_ID = t6.LANGUAGE_ID )
 ON t1.DOCTOR_ID = t5.DOCTOR_ID
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                ON t1.DOCTOR_ID = t2.DOCTOR_ID
                left join fd_dict_state t4 on t4.state_id = t3.state_id
                 where t3.clinic_user_id = ".$arr_values['CLINIC_USER_ID']."
                 and t1.DOCTOR_TYPE like '%".$arr_values['DOCTOR_TYPE']."%'
                 and t1.DOCTOR_NAME like '%".$arr_values['DOCTOR_NAME']."%' and t1.ACTIVE_STATUS like '%".$arr_values['ACTIVE_STATUS']."%' GROUP BY t1.DOCTOR_ID 
ORDER BY t1.CREATE_DATE DESC) ta LEFT JOIN
    fd_rel_doctor_interest tb on ta.DOCTOR_ID=tb.DOCTOR_ID
    LEFT JOIN fd_dict_interest tc ON tb.INTEREST_ID = tc.INTEREST_ID GROUP BY ta.DOCTOR_ID";


     
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
        
        $where =" DOCTOR_ID = ".intval($arr_values['DOCTOR_ID']);
        //1.delete rel id=DOCTOR_ID
        $ret = $this->db->deleteData('fd_rel_doctor_language', $where);

        $ret = $this->db->deleteData('fd_rel_doctor_interest', $where);
        
        //2.handle language
     	$arr=explode(",",$arr_values["LANGUAGE_NAME"]);

     	$arrlength=count($arr);
     	
     	for($k = 0; $k < $arrlength; $k++){
     		$sql = "SELECT LANGUAGE_ID FROM `fd_dict_language` where LANGUAGE_NAME ='".$arr[$k]."'";
     		$LANGUAGE_ID = $this->db->fetchAll_sql($sql,null);
     		
     		$arr_values_tmp["DOCTOR_ID"] = intval($arr_values['DOCTOR_ID']);
     		$arr_values_tmp["LANGUAGE_ID"] = intval($LANGUAGE_ID[0]["LANGUAGE_ID"]);
     		$ret = $this->db->insertData('fd_rel_doctor_language', $arr_values_tmp);
     	}

         //3.handle interest
         $arrInterest=explode(",",$arr_values["INTEREST_NAME"]);

     	$arrlengthInterest=count($arrInterest);
     	
     	for($k = 0; $k < $arrlengthInterest; $k++){
     		$sql = "SELECT INTEREST_ID FROM `fd_dict_interest` where INTEREST_NAME ='".$arrInterest[$k]."'";
     		$INTEREST_ID = $this->db->fetchAll_sql($sql,null);
     		
     		$arr_values_tmp_Interest["DOCTOR_ID"] = intval($arr_values['DOCTOR_ID']);
     		$arr_values_tmp_Interest["INTEREST_ID"] = intval($INTEREST_ID[0]["INTEREST_ID"]);
     		$ret = $this->db->insertData('fd_rel_doctor_interest', $arr_values_tmp_Interest);
     	}



        
        unset($arr_values["DOCTOR_ID"]);
        unset($arr_values["LANGUAGE_NAME"]);
        unset($arr_values["INTEREST_NAME"]);
        
        $ret = $this->db->updateData('fd_doctor', $arr_values, $where);

        return $ret;
    }
}
?>