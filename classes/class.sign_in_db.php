<?php 
include_once('class.database.php');

class sign_in_DB{
    private $db;
    public function __construct(){  

    $this->db = new Database();
	
    }



    public function getUserName($arr_values){
        // print_r($arr_values);
        $sql="";
        $table_name = "";
        $whereSql = "";
        if($arr_values["usertype"] == 0)
        {
            $whereSql = "CLINIC_USER_MAIL = '".$arr_values["USER_MAIL"]."' and CLINIC_USER_PWD = '".md5($arr_values["USER_PWD"])."'";
            $sql = "SELECT CLINIC_NAME as name FROM fd_clinic_user WHERE ".$whereSql;
        }else if($arr_values["usertype"] == 1){
            $whereSql = "CUSTOMER_USER_MAIL = '".$arr_values["USER_MAIL"]."' and CUSTOMER_USER_PWD = '".md5($arr_values["USER_PWD"])."'";
            $sql = "SELECT CONCAT(b.TITLE_NAME, ' ', a.CUSTOMER_LASTNAME) as name FROM fd_customer_user a left join fd_dict_title b on a.TITLE_ID= b.TITLE_ID WHERE ".$whereSql;
        }else if($arr_values["usertype"] == 2){
            $table_name = "fd_admin";
            $whereSql = "ADMIN_NAME = '".$arr_values["USER_MAIL"]."' and ADMIN_PWD = '".md5($arr_values["USER_PWD"])."'";
            $sql = "SELECT 'admin' as name";
        }

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
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