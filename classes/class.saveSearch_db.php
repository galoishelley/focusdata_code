<?php 
include_once('class.database.php');

class saveSearch_DB{
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

        // if($this->col_exists($arr_values)){
        //     return 2;
        // };
        // print_r("DB");
        // print_r($arr_values);
        $ret = $this->db->insertData('FD_SAVE_SEARCH', $arr_values);

        return $ret;
    }

    public function viewAll($arr_values,$requesttype=0,$start=0,$lenght=10){
        // if($this->_dbug){
        //     echo "[---viewAll---arr_values]";
        //     print_r($arr_values);
        // }


        $sql = "SELECT * FROM `fd_save_search` order by create_date desc";

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
            $ret = $this->db->deleteData('fd_save_search',"CUSTOMER_USER_ID='".intval($arr_values["CUSTOMER_USER_ID"]["$i"])."' and CUSTOMER_SEARCH_ID='".intval($arr_values["CUSTOMER_SEARCH_ID"][$i])."'");
        return $ret;
    }
}
?>