<?php 
include_once('class.database.php');

class sign_in_DB{
    private $db;
    public function __construct(){  

    $this->db = new Database();
	
    }

    public function viewAll($arr_values){
        // print_r($arr_values);
        $table_name = "";
        $whereSql = "";
        if($arr_values["usertype"] == 0)
        {
            $table_name = "fd_clinic_user";
            $whereSql = "CLINIC_USER_MAIL = '".$arr_values["USER_MAIL"]."' and CLINIC_USER_PWD = '".md5($arr_values["USER_PWD"])."'";
        }else if($arr_values["usertype"] == 1){
            $table_name = "fd_customer_user";
            $whereSql = "CUSTOMER_USER_MAIL = '".$arr_values["USER_MAIL"]."' and CUSTOMER_USER_PWD = '".md5($arr_values["USER_PWD"])."'";
        }else if($arr_values["usertype"] == 2){
            $table_name = "fd_admin";
            $whereSql = "ADMIN_NAME = '".$arr_values["USER_MAIL"]."' and ADMIN_PWD = '".md5($arr_values["USER_PWD"])."'";
        }

        // echo "test:".$table_name;

        $sql = "SELECT COUNT(*) AS COUNT FROM ".$table_name." WHERE ".$whereSql;
        // echo $sql;
        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
}
?>