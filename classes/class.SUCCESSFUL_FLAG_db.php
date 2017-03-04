<?php
include_once('class.database.php');

class SUCCESSFUL_FLAG_db{
	private $db;
	public function __construct(){

		$this->db = new Database();

	}

	public function viewAll($arr_values){
		
		$sql = "SELECT * FROM `fd_rel_doctor_appointment_time` WHERE `DOCTOR_ID` = ".$arr_values["DOCTOR_ID"]." and `APPOINTMENT_DATE` = '".$arr_values["APPOINTMENT_DATE"]."' and `APPOINTMENT_TIME` = '".$arr_values["APPOINTMENT_TIME"]."' ";

		$ret = $this->db->fetchAll_sql($sql,null);

		return $ret;
	}
}
?>