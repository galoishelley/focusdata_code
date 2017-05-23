<?php
include_once ('class.get_lang_db.php');
class get_lang
{
	private $get_lang_db;


	public function __construct()
	{
		session_start ();
		$this->get_lang_db = new get_lang_db();
		


		$ret= $this->get_lang_db->view();
		echo json_encode ( $ret);
	}



}

$get_lang = new get_lang();
?>

