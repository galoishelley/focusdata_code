<?php
include_once ('class.get_clinic_mail_by_doctorID_db.php');
class get_clinic_mail_by_doctorID
{
	private $get_clinic_mail_by_doctorID_db;


	public function __construct()
	{
		session_start ();
		$this->get_clinic_mail_by_doctorID_db = new get_clinic_mail_by_doctorID_db();
		
		if (isset ( $_POST ['doctorID'] )){
			$this->doctorID = $_POST ['doctorID'];
		}


		$ret= $this->get_clinic_mail_by_doctorID_db->view($this->doctorID);
		echo json_encode ( $ret[0]["CLINIC_USER_MAIL"]);
	}



}

$get_clinic_mail_by_doctorID = new get_clinic_mail_by_doctorID();
?>

