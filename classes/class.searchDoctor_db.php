<?php 
include_once('class.database.php');

class SearchDoctor_DB{
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
   
    public function col_exists_sql($arr_values,$requesttype){
        if($this->_dbug){
            echo "[---col_exists_sql---arr_values]";
            print_r($arr_values);
        }
        if($this->_dbug){
            echo "[---col_exists_sql2---requesttype]";
            print_r($requesttype);
        }

        $keys = array();
        $keys_where =array();
        if($requesttype==0){ //全体模糊查询
            $where = " and ( ";
        }else{
            $where = "";
        }
        if(count($arr_values)>0){
            $keys = array_keys($arr_values); 
            $keys_where = array();
           
            // array_splice($keys,count($keys)-1,1);
        }
        for($i = 0; $i < count($keys); $i++){
            if($keys[$i]=="DISTANCE"){
                array_splice($keys,$i,1);
            }
        }

        if($this->_dbug){
            echo "[---col_exists_sql---keys]";
            print_r($keys);
        }

        for($i = 0; $i < count($keys); $i++){

            if($keys[$i] == "CLINIC_ADDR" || $keys[$i] == "CLINIC_NAME"){
                $keys_where[$i] = "t3.".$keys[$i];
            }else if($keys[$i] == "DOCTOR_TYPE" || $keys[$i] == "DOCTOR_NAME"){
                $keys_where[$i] = "t1.".$keys[$i];
            }else if($keys[$i] == "APPOINTMENT_DATE_BEGIN" || $keys[$i] == "APPOINTMENT_DATE_END"){
                $keys_where[$i] = "t4.".$keys[$i];
          	}else{}

          	if($this->_dbug){
	            echo "[---col_exists_sql---keys_where]";
	            echo  $keys_where[$i];
        	}

            if($requesttype==0){

                if($arr_values[$keys[$i]] != ""){
                    $arr_values[$keys[$i]] = '%'.$arr_values[$keys[$i]].'%';
                }else{
                    $arr_values[$keys[$i]] = '%';
                }

                if($this->_dbug){
                    echo "[---col_exists_sql---arr_values111]";
                    print_r($arr_values[$keys[$i]]);
                }

                if($keys_where[$i] == "t4.APPOINTMENT_DATE_BEGIN" || $keys_where[$i] == "t4.APPOINTMENT_DATE_END"){
                }else{
                	$where .= $keys_where[$i] ." like '".$arr_values[$keys[$i]]."'";
                }

                if($i != count($keys)-1 ){
                    $where .= " or ";
                }
            }else{ 
                if($arr_values[$keys[$i]] != ""){
                	if($keys[$i] == "APPOINTMENT_DATE_BEGIN"){
                		$where .= "and t4.APPOINTMENT_DATE BETWEEN str_to_date('".$arr_values[$keys[$i]]."','%Y-%m-%d %H:%i:%s')";
                	}else if($keys[$i] == "APPOINTMENT_DATE_END"){
                		$where .= " AND str_to_date('".$arr_values[$keys[$i]]."','%Y-%m-%d %H:%i:%s')";
                	}else{
                		$where .= " and " .$keys_where[$i] ." like '%".$arr_values[$keys[$i]]."%'";
                	}
                }
            }
        }

        if($requesttype==0){
            $where .= " )";
        }

        if($this->_dbug){
            echo "[---col_exists_sql---where]";
            print_r($where);
        }
        $sql = "select count(*) as COUNT from (
                select 
                GROUP_CONCAT(DATE_FORMAT(t4.APPOINTMENT_TIME,'%H:%i') order by APPOINTMENT_TIME) as APPOINTMENT_TIME
                from fd_doctor as t1
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                on
                t1.doctor_id = t2.doctor_id
                left join fd_rel_doctor_appointment_time t4 on t4.doctor_id = t1.doctor_id
                where
                t1.ACTIVE_STATUS = 1
                and 
                t4.ACTIVE_STATUS = 1 ".$where.
                " group by t1.doctor_id,t4.APPOINTMENT_DATE
                order by t1.DOCTOR_NAME
                ) r";
        if($this->_dbug){
            echo "[---col_exists_sql---sql]";
            print_r($sql);
        }
        $ret = $this->db->col_exists_sql($sql);

        return $ret[0]["COUNT"];
    }

    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $keys = array();
        $keys_where =array();
        if($requesttype==0){
            $where = " and ( ";
        }else{
            $where = "";
        }
        if(count($arr_values)>0){
            $keys = array_keys($arr_values); 
            $keys_where = array();
           
            // array_splice($keys,count($keys)-1,1);
        }
        for($i = 0; $i < count($keys); $i++){
            if($keys[$i]=="DISTANCE"){
                array_splice($keys,$i,1);
            }
        }

        if($this->_dbug){
            echo "[---viewAll---keys]";
            print_r($keys);
        }

        for($i = 0; $i < count($keys); $i++){

            if($keys[$i] == "CLINIC_ADDR" || $keys[$i] == "CLINIC_NAME"){
                $keys_where[$i] = "t3.".$keys[$i];
            }else if($keys[$i] == "DOCTOR_TYPE" || $keys[$i] == "DOCTOR_NAME"){
                $keys_where[$i] = "t1.".$keys[$i];
            }else if($keys[$i] == "APPOINTMENT_DATE_BEGIN" || $keys[$i] == "APPOINTMENT_DATE_END"){
                $keys_where[$i] = "t4.".$keys[$i];
          	}
            // echo  $keys_where[$i]."---------";

            if($requesttype==0){
                if($arr_values[$keys[$i]] != ""){
                    $arr_values[$keys[$i]] = '%'.$arr_values[$keys[$i]].'%';
                }else{
                    $arr_values[$keys[$i]] = '%';
                }

                $where .= $keys_where[$i] ." like '".$arr_values[$keys[$i]]."'";

                if($i != count($keys)-1 ){
                    $where .= " or ";
                }
            }else{
                if($keys[$i] == "APPOINTMENT_DATE_BEGIN"){
            		$where .= "and t4.APPOINTMENT_DATE BETWEEN str_to_date('".$arr_values[$keys[$i]]."','%Y-%m-%d %H:%i:%s')";
            	}else if($keys[$i] == "APPOINTMENT_DATE_END"){
            		$where .= " AND str_to_date('".$arr_values[$keys[$i]]."','%Y-%m-%d %H:%i:%s')";
            	}else{
            		$where .= " and " .$keys_where[$i] ." like '%".$arr_values[$keys[$i]]."%'";
            	}
            }
        }

        if($requesttype==0){
            $where .= " )";
        }

        // echo "[---viewAll---where]";
        // print_r($where);

        $limit = " limit ".$start.",".$lenght;
        
        $sql = "select 
                concat('searchdoc_', @rownum:=@rownum+1) AS DT_RowId, t1.*, t2.*,t3.*,t4.APPOINTMENT_DATE,  
                GROUP_CONCAT(DATE_FORMAT(t4.APPOINTMENT_TIME,'%H:%i') order by APPOINTMENT_TIME) as APPOINTMENT_TIME
                from (SELECT @rownum:=0) t0, fd_doctor as t1
                left join (fd_rel_clinic_doctor as t2 left join fd_clinic_user as t3 on t2.clinic_user_id = t3.clinic_user_id )
                on
                t1.doctor_id = t2.doctor_id
                left join fd_rel_doctor_appointment_time t4 on t4.doctor_id = t1.doctor_id
                where
                t1.ACTIVE_STATUS = 1
                and 
                t4.ACTIVE_STATUS = 1 "
                .$where.
                " group by t1.doctor_id,t4.APPOINTMENT_DATE
                order by t1.DOCTOR_NAME".$limit;
        // echo "[-----viewAll:".$sql."-----]";
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