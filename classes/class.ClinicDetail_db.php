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

        $sql = "SELECT * FROM `fd_clinic_user` WHERE  ACTIVE_STATUS  like '%".$arr_values['ACTIVE_STATUS']."%' and  CLINIC_NAME like '%".$arr_values['CLINIC_NAME']."%' and CLINIC_ADDR like '%".$arr_values['CLINIC_ADDR']."%' order by update_date desc";

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

        $sql = "SELECT * FROM `fd_clinic_user` WHERE `CLINIC_USER_NAME` = '".$arr_values["username"]."'";

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

        // print_r($arr_values);

        
        $where =" CLINIC_USER_ID = ".intval($arr_values['CLINIC_USER_ID']);
        if(isset ( $arr_values['ACTIVE_STATUS'] )){
            $arr_values['ACTIVE_STATUS'] = intval($arr_values['ACTIVE_STATUS']);
        }
        unset($arr_values["CLINIC_USER_ID"]);

        $ret = $this->db->updateData('fd_clinic_user', $arr_values, $where);
        // echo $ret;
        return $ret;

    }
}
?>