<?php
include_once('class.database.php');

class get_clinic_mail_by_doctorID_db{
	private $db;
	public function __construct(){

		$this->db = new Database();

	}

	public function view($doctorID){
		
		$sql = "SELECT c.CLINIC_USER_MAIL FROM `fd_doctor` a left join `fd_rel_clinic_doctor` b on a.DOCTOR_ID=b.DOCTOR_ID left join `fd_clinic_user` c on b.CLINIC_USER_ID=c.CLINIC_USER_ID where a.DOCTOR_ID=".$doctorID;

		$ret = $this->db->fetchAll_sql($sql,null);

		return $ret;
	}
}
?>