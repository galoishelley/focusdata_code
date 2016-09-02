<?php 
include_once('class.database.php');

class UserDetail_DB{
    private $db;
    private $_dbug;
    public function __construct(){  

        $this->_dbug = false;
        $this->db = new Database();
    }

    public function update_active($arr_values){
        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---$arr_values]";
            print_r($arr_values);
        }

        $values['ACTIVE_STATUS'] = intval($arr_values['ACTIVE_STATUS']);

        $arrlength=count($arr_values['CUSTOMER_USER_ID']);
        for($i = 0; $i < $arrlength; $i++){
            $where = "";
            $where =" CUSTOMER_USER_ID = ".intval($arr_values['CUSTOMER_USER_ID'][$i]);

            $ret = $this->db->updateData('fd_customer_user', $values, $where);
        }
        return $ret;

    }

    public function view_name_area_count($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $sql = "SELECT count(*) as count FROM `fd_customer_user` WHERE  ACTIVE_STATUS  like '%".$arr_values['ACTIVE_STATUS']."%' and  CUSTOMER_ADDR like '%".$arr_values['CUSTOMER_ADDR']."%' and CUSTOMER_USER_NAME like '%".$arr_values['CUSTOMER_USER_NAME']."%'";

        // echo $sql;
        if($this->_dbug){
            echo "[---viewAll---sql]";
            print_r($sql);
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret[0]['count'];
    }


    public function view_name_area($arr_values,$requesttype=0,$start=0,$lenght=10){
        if($this->_dbug){
            echo "[---viewAll---arr_values]";
            print_r($arr_values);
        }

        $limit = " limit ".$start.",".$lenght;
        $sql = "SELECT * FROM `fd_customer_user` WHERE  ACTIVE_STATUS  like '%".$arr_values['ACTIVE_STATUS']."%' and  CUSTOMER_ADDR like '%".$arr_values['CUSTOMER_ADDR']."%' and CUSTOMER_USER_NAME like '%".$arr_values['CUSTOMER_USER_NAME']."%' order by update_date desc". $limit;


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

        $sql = "SELECT * FROM `fd_customer_user` WHERE `CUSTOMER_USER_ID` = '".$arr_values["CUSTOMER_USER_ID"]."'";

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

        $sql = "SELECT * FROM `fd_customer_user` WHERE `CUSTOMER_USER_NAME` = '".$arr_values["username"]."'";

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

// print_r($arr_values);

        $where =" CUSTOMER_USER_ID = ".$arr_values['CUSTOMER_USER_ID'];
        unset($arr_values["CUSTOMER_USER_ID"]);

        $ret = $this->db->updateData('fd_customer_user', $arr_values, $where);
        // echo $ret;
        return $ret;
        // $this->db->updateData('qr_role',array('role_name'=>$role_name,
        //                                         'funcion_id'=>$funcion_id,
        //                                         'note'=>$note,
        //                                       ),'func_code='.$func_code);
    }
}
?>