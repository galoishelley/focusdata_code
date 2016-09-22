<?php 
include_once('class.database.php');

class AppointmentRecoder_DB{
    private $db;
    // public $lastid;
    private $_dbug;
    public function __construct(){  

    $this->_dbug = false;
    $this->db = new Database();
	/**
    if(isset($_POST['json'])){
        $json = $_POST['json'];
        $_SESSION['jsonData'] = $json;
        $json = json_decode($_SESSION["jsonData"],true);
        $this->data = $json;
        $this->action = $json['request'];
         $this->lastid = $this->db->lastInsertId();

         
    }else{
        $this->lastid = $this->db->lastInsertId();
    }
    **/
    }
    public function col_exists($where){
        $ret = $this->db->col_exists('fd_clinic_user','CLINIC_USER_NAME="'.$where.'"');
        return $ret;
    }

    public function create($arr_values){

        if($this->col_exists($arr_values["CLINIC_USER_NAME"])){
            return 2;
        };

        $ret = $this->db->insertData('fd_clinic_user', $arr_values);
        return $ret;
    }

    /**
    public function save(){
        
        $this->logFile($this->data);
        $sFname = $this->data['sFname'];
        $sMname= $this->data['sMname'];
        $sLname = $this->data['sLname'];
        $sAddress = $this->data['sAddress'];
        $sNotes =$this->data['sNotes'];
    
        
        $this->lastid = $this->db->insertData('students',
                               array('sFname','sMname','sLname','sAddress','sNotes'),
                               array($sFname,$sMname,$sLname,$sAddress,$sNotes));
       
    }
    **/
    public function update($arr_values){
        // echo "update";
        // print_r($arr_values);
        $arrlength=count($arr_values["CUSTOMER_USER_ID"]);
        for($i = 0; $i < $arrlength; $i++)
        {
            $where = " CUSTOMER_USER_ID = ".$arr_values['CUSTOMER_USER_ID'][$i]." and DOCTOR_ID = ".$arr_values['DOCTOR_ID'][$i]." and CREATE_DATE = '".$arr_values['CREATE_DATE'][$i]."'";
            // echo $where;

            $values["APPOINTMENT_STATUS_ID"] = 2;

            $ret = $this->db->updateData('fd_rel_customer_appointment', $values, $where);
        }

        return $ret;
        // $this->db->updateData('qr_role',array('role_name'=>$role_name,
        //                                         'funcion_id'=>$funcion_id,
        //                                         'note'=>$note,
        //                                       ),'func_code='.$func_code);
    }
     

    public function view(){
        $ret = $this->db->fetchAll('qr_func');
        
        return $ret;
    }
   
    public function col_exists_sql($arr_values,$requesttype=0){
        $sql = "select count(*) as COUNT
                from fd_rel_customer_appointment t1
                left join fd_doctor t2 
                on t2.DOCTOR_ID = t1.DOCTOR_ID
                left join fd_dict_appointment_status t3
                on t3.APPOINTMENT_STATUS_ID = t1.APPOINTMENT_STATUS_ID
                left join (fd_rel_clinic_doctor t4 left join fd_clinic_user as t5 on t4.clinic_user_id = t5.clinic_user_id )
                on t4.DOCTOR_ID = t1.DOCTOR_ID
                left join fd_dict_state t6 on t5.state_id = t6.state_id
                where 
                t1.CUSTOMER_USER_ID = ".(int)$arr_values['CUSTOMER_USER_ID']."
                and                
                t1.APPOINTMENT_STATUS_ID like '".$arr_values['APPOINTMENT_STATUS_ID']."'
                and
                t1.`CREATE_DATE`
                between str_to_date('".$arr_values['CREATE_DATE_BEGIN']."','%d-%m-%Y %H:%i:%s') 
                and
                str_to_date('".$arr_values['CREATE_DATE_END']."','%d-%m-%Y %H:%i:%s')";
        if($this->_dbug){
            echo "[---col_exists_sql---sql]";
            print_r($sql);
        }
        $ret = $this->db->col_exists_sql($sql);

        return $ret[0]["COUNT"];
    }
        // 
    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        $sql = "select t5.CLINIC_NAME, t5.CLINIC_ADDR,t5.CLINIC_SUBURB,t5.CLINIC_POSTCODE,t2.DOCTOR_TYPE, t2.DOCTOR_NAME, t1.CREATE_DATE,t3.APPOINTMENT_STATUS, t1.CUSTOMER_USER_ID, t1.DOCTOR_ID, T6.STATE_NAME, t7.APPOINTMENT_DATE, t7.APPOINTMENT_TIME
            from fd_rel_customer_appointment t1
            left join fd_doctor t2 
            on t2.DOCTOR_ID = t1.DOCTOR_ID
            left join fd_dict_appointment_status t3
            on t3.APPOINTMENT_STATUS_ID = t1.APPOINTMENT_STATUS_ID
            left join (fd_rel_clinic_doctor t4 left join fd_clinic_user as t5 on t4.clinic_user_id = t5.clinic_user_id )
            on t4.DOCTOR_ID = t1.DOCTOR_ID
            left join fd_dict_state t6 on t5.state_id = t6.state_id
            left join fd_rel_doctor_appointment_time t7 on t7.DOCTOR_APPOINTMENT_TIME_ID = t1.DOCTOR_APPOINTMENT_TIME_ID
            where 
            t1.CUSTOMER_USER_ID = ".(int)$arr_values['CUSTOMER_USER_ID']."
            and                
            t1.APPOINTMENT_STATUS_ID like '".$arr_values['APPOINTMENT_STATUS_ID']."'
            and
            t1.`CREATE_DATE`
            between str_to_date('".$arr_values['CREATE_DATE_BEGIN']."','%d-%m-%Y %H:%i:%s') 
            and
            str_to_date('".$arr_values['CREATE_DATE_END']."','%d-%m-%Y %H:%i:%s')
            ORDER BY CREATE_DATE DESC";

        $limit = " limit ".$start.",".$lenght;

        $sql .= $limit;
        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
    
    public function remove($arr_values){
        $arrlength=count($arr_values);
        for($i = 0; $i < $arrlength; $i++)
        $ret = $this->db->deleteData('qr_func',"func_code='".$arr_values[$i]."'");
        return $ret;
    }
}
?>