<?php
include_once('class.database.php');

class activate_db{
	private $db;
	public function __construct(){

		$this->db = new Database();

	}

	public function col_exists($arr_values){
        $ret = $this->db->col_exists('fd_customer_user',"`CUSTOMER_USER_MAIL` = '".$arr_values["email"]."' and `ACTIVATION_CODE` = '".$arr_values["acode"]."'");
        return $ret;
    }

	public function updateActive($arr_values){
      
		$where = "`CUSTOMER_USER_MAIL` = '".$arr_values["email"]."'";
		
    	$arr=array();
    	$arr["ACTIVATE"]=1;

    	$ret = $this->db->updateData('fd_customer_user', $arr, $where);
    	return $ret;
    }
}
?>