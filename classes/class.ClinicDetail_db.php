<?php 
include_once('class.database.php');

class ClinicDetail_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

     public function view_name_addr($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---view---arr_values]";
            print_r($arr_values);
        }
        // print_r($arr_values);

        $sql = "SELECT t1.*, t2.STATE_NAME FROM `fd_clinic_user` t1
            left join fd_dict_state t2 on t1.state_id = t2.state_id
            WHERE  t1.ACTIVE_STATUS  like '%".$arr_values['ACTIVE_STATUS']."%' and  
            t1.CLINIC_SUBURB like '%".$arr_values['CLINIC_SUBURB']."%' and t1.CLINIC_NAME like '%".$arr_values['CLINIC_NAME']."%' and t1.STATE_ID like '%".$arr_values['STATE_ID']."%' order by create_date desc";

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

    public function view($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---view---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT * FROM `fd_clinic_user` WHERE `CLINIC_USER_ID` = ".intval($arr_values["CLINIC_USER_ID"]);

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

        $sql = "SELECT * FROM `fd_clinic_user` WHERE `CLINIC_USER_MAIL` = '".$arr_values["username"]."'";

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }

     public function update_active($arr_values){
        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---$arr_values]";
            print_r($arr_values);
        }

        $values['ACTIVE_STATUS'] = intval($arr_values['ACTIVE_STATUS']);

        $arrlength=count($arr_values['CLINIC_USER_ID']);
        for($i = 0; $i < $arrlength; $i++){
            $where = "";
            $where =" CLINIC_USER_ID = ".intval($arr_values['CLINIC_USER_ID'][$i]);

            $ret = $this->db->updateData('fd_clinic_user', $values, $where);
        }
        return $ret;

    }

    public function update($arr_values){
        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---$arr_values]";
            print_r($arr_values);
        }

  

        
        $where =" CLINIC_USER_ID = ".intval($arr_values['CLINIC_USER_ID']);
        if(isset ( $arr_values['ACTIVE_STATUS'] )){
            $arr_values['ACTIVE_STATUS'] = intval($arr_values['ACTIVE_STATUS']);
        }
        unset($arr_values["CLINIC_USER_ID"]);


        if(isset ( $arr_values['BULK_BILLING'] )){
            $arr_values['BULK_BILLING'] = 1;
        }
        else
            $arr_values['BULK_BILLING'] = 0;

        if(isset ( $arr_values['LATE_HOUR_SERVICES'] )){
            $arr_values['LATE_HOUR_SERVICES'] = 1;
        }
        else
            $arr_values['LATE_HOUR_SERVICES'] = 0;

        if(isset ( $arr_values['FREE_PARKING'] )){
            $arr_values['FREE_PARKING'] = 1;
        }
        else
            $arr_values['FREE_PARKING'] = 0;

        if(isset ( $arr_values['WHEELCHAIR_ACCESS'] )){
            $arr_values['WHEELCHAIR_ACCESS'] = 1;
        }
        else
            $arr_values['WHEELCHAIR_ACCESS'] = 0;

        if(isset ( $arr_values['FEMALE_DOCTOR'] )){
            $arr_values['FEMALE_DOCTOR'] = 1;
        }
        else
            $arr_values['FEMALE_DOCTOR'] = 0;

        if(isset ( $arr_values['HOME_VISIT'] )){
            $arr_values['HOME_VISIT'] = 1;
        }
        else
            $arr_values['HOME_VISIT'] = 0;

        if(isset ( $arr_values['ONSITE_PATHOLOGY_COLLECTION'] )){
            $arr_values['ONSITE_PATHOLOGY_COLLECTION'] = 1;
        }
        else
            $arr_values['ONSITE_PATHOLOGY_COLLECTION'] = 0;

        if(isset ( $arr_values['AGPAL'] )){
            $arr_values['AGPAL'] = 1;
        }
        else
            $arr_values['AGPAL'] = 0;

        if(isset ( $arr_values['STANDARD_15_MINUTE_CONSULTATION'] )){
            if($arr_values['STANDARD_15_MINUTE_CONSULTATION'] =='')
            {
                $arr_values["STANDARD_15_MINUTE_CONSULTATION"]=0;
            }
        }

        if(isset ( $arr_values['EXTEND_30_MINUTE_CONSULTATION'] )){
            if($arr_values['EXTEND_30_MINUTE_CONSULTATION'] =='')
            {
                $arr_values["EXTEND_30_MINUTE_CONSULTATION"]=0;
            }
        }




        foreach($arr_values as $k=>$v){
            if($k=="CLINIC_USER_PWD"){
                $arr_values[$k]=md5($v);
            }
        }
        $ret = $this->db->updateData('fd_clinic_user', $arr_values, $where);
        // echo $ret;
        return $ret;

    }
}
?>