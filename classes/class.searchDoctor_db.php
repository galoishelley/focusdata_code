<?php 
include_once('class.database.php');

class SearchDoctor_DB{
    private $db;
    // public $lastid;
    public function __construct(){  

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
        $func_code = $arr_values['func_code'];
        unset($arr_values['func_code']);  

        $ret = $this->db->updateData('qr_func', $arr_values, 'func_code="'.$func_code.'"');
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
   
    public function viewAll($arr_values){
        $sql = "SELECT concat('searchdoc_', @rownum:=@rownum+1) AS DT_RowId, fd_doctor.*, fd_clinic_user.*, GROUP_CONCAT(DATE_FORMAT(fd_rel_doctor_appointment_time.APPOINTMENT_TIME,'%H:%i') order by APPOINTMENT_TIME) as APPOINTMENT_TIME  FROM (SELECT @rownum:=0) r, fd_doctor, fd_rel_clinic_doctor, fd_clinic_user, fd_rel_doctor_appointment_time
            where 
            fd_doctor.ACTIVE_STATUS = 1 
            and 
            fd_rel_doctor_appointment_time.ACTIVE_STATUS = 1
            and
            fd_doctor.doctor_id = fd_rel_clinic_doctor.doctor_id
            and 
            fd_rel_clinic_doctor.clinic_user_id = fd_clinic_user.clinic_user_id
            and
            fd_rel_doctor_appointment_time.doctor_id = fd_doctor.doctor_id
            group by fd_doctor.doctor_id
            order by fd_rel_doctor_appointment_time.APPOINTMENT_TIME";

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
    
    public function remove($arr_values){
        $arrlength=count($arr_values);
        for($i = 0; $i < $arrlength; $i++)
        $ret = $this->db->deleteData('qr_func',"func_code='".$arr_values[$i]."'");
        return $ret;
    }
    /**
    private function logFile($msg)
    {
        $myFile = "visibility.txt";
        $fh = fopen($myFile, 'a') or die("can't open file");
            if(is_array($msg)){
            fwrite($fh, print_r($msg, TRUE));
            
        } else {
            fwrite($fh, $msg . PHP_EOL);
        }
        fclose($fh);
    }
    **/
}
?>