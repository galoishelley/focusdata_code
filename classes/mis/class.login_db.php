<?php 
include_once('class.database.php');

class User{
    private $db;
    //public $lastid;
    public function __construct(){  

   		$this->db = new Database();

   	/*
    if(isset($_POST['json'])){
        $json = $_POST['json'];
        $_SESSION['jsonData'] = $json;
        $json = json_decode($_SESSION["jsonData"],true);
        $this->data = $json;
        $this->action = $json['request'];
         $this->lastid = $this->db->lastInsertId();

         
    }else{
        $this->lastid = $this->db->lastInsertId();
    }
    */
   
    }

    /**
    public function save(){
        
        $this->logFile($this->data);
        $sFname = $this->data['sFname'];
        $sMname= $this->data['sMname'];
        $sLname = $this->data['sLname'];
        $sAddress = $this->data['sAddress'];
        $sNotes =$this->data['sNotes'];
    
        
        $this->lastid = $this->db->insertData('students',
                               array('sFname','sMname','sLname','sAddress','sNotes'),
                               array($sFname,$sMname,$sLname,$sAddress,$sNotes));
       
    }
    
    public function update(){

        //$this->logFile($this->data);
        $role_id = $this->data['role_id'];
        $role_name = $this->data['role_name'];
        $funcion_id = $this->data['function_id'];
        $note = $this->data['note'];
        
        $this->db->updateData('qr_role',array('role_name'=>$role_name,
                                                'funcion_id'=>$funcion_id,
                                                'note'=>$note,
                                              ),'role_id='.$role_id);
    }
     **/
    public function view($login_name=null, $login_pwd=null){
        $user_id = $this->db->fetchAll('qr_user',"login_name='".$login_name ."' and login_pwd='".$login_pwd."'");
        
        return $user_id;
    }
   
    public function viewAll(){
        $users = $this->db->fetchAll('qr_user',null);
        
        return $users;
    }
    
    public function viewCount($login_name=null, $login_pwd=null){
    	$iCount = $this->db->col_exists('qr_user',"login_name='".$login_name ."' and login_pwd='".$login_pwd."'");
       	
    	return $iCount;
    }
    /**
    public function remove(){

    }
    
    private function logFile($msg)
    {
        $myFile = "visibility.txt";
        $fh = fopen($myFile, 'a') or die("can't open file");
            if(is_array($msg)){
            fwrite($fh, print_r($msg, TRUE));
            
        } else {
            fwrite($fh, $msg . PHP_EOL);
        }
        fclose($fh);
    }
    **/
}
?>