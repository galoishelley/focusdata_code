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

        $sql = "SELECT count(*) as count FROM `fd_customer_user` t1 WHERE t1.ACTIVE_STATUS  like '%".$arr_values['ACTIVE_STATUS']."%' and t1.CUSTOMER_NAME like '%".$arr_values['CUSTOMER_NAME']."%' and t1.CUSTOMER_SUBURB like '%".$arr_values['CUSTOMER_SUBURB']."%' and t1.STATE_ID like '%".$arr_values['STATE_ID']."%' and t1.CUSTOMER_USER_NAME like '%".$arr_values['CUSTOMER_USER_NAME']."%'";

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
        $sql = "SELECT t1.*, t2.STATE_NAME  FROM `fd_customer_user` t1
            left join fd_dict_state t2 on t1.state_id = t2.state_id
            WHERE  t1.ACTIVE_STATUS  like '%".$arr_values['ACTIVE_STATUS']."%' and t1.CUSTOMER_NAME like '%".$arr_values['CUSTOMER_NAME']."%' and t1.CUSTOMER_SUBURB like '%".$arr_values['CUSTOMER_SUBURB']."%' and
                t1.STATE_ID like '%".$arr_values['STATE_ID']."%' and t1.CUSTOMER_USER_NAME
                like '%".$arr_values['CUSTOMER_USER_NAME']."%' order by create_date desc". $limit;


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

        //md5
        foreach($arr_values as $k=>$v){
            if($k == "CUSTOMER_USER_PWD"){
                $arr_values[$k] = md5($v);
            }
        }

        $ret = $this->db->updateData('fd_customer_user', $arr_values, $where);
        return $ret;
    }
}
?>