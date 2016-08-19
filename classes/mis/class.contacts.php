<?php
include_once('class.database.php');
include_once('class.students.php');

class Contacts{
    private $db;
    private $student;
    private $lastid;

    
    public function __construct(){


        $this->db = new Database();   
        if(isset($_POST['json'])){
        $json = $_POST['json'];
        $_SESSION['jsonData'] = $json;
        $json = json_decode($_SESSION["jsonData"],true);
        
        $this->data = $json;
        $this->action = $json['request'];
        }else{
            $this->action = "";
              //echo 'JSON is empty';
        }
    }
    
    public function create(){
    	
    		$cfname = $this->data['cNewContact']['cFName'];
    		$clname = $this->data['cNewContact']['cLName'];
    		$cemail = $this->data['cNewContact']['cEmail'];
    		$ctitle = $this->data['cNewContact']['cTitle'];
    		$cphone = $this->data['cNewContact']['cPhone'];
    		$cnotes = $this->data['cNewContact']['cNotes'];
    		$values = array('cFName','cLName','cEmail','cTitle','cPhone','cNotes');
    		$this->db->insertData('contacts',$values,
    				array($cfname,$clname,$cemail,$ctitle,$cphone,$cnotes));
    	
    	
    }
    public function save($id){
        foreach($this->data['cList'] as $value)
        {
            $cfname = $value['cFName'];
            $clname = $value['cLName'];
            $cemail = $value['cEmail'];
            $ctitle = $value['cTitle'];
            $cphone = $value['cPhone'];
            $cnotes = $value['cNotes'];
      		$values = array('cFName','cLName','cEmail','cTitle','cPhone','cNotes','sID');
      		$this->db->insertData('contacts',$values, 
      		                       array($cfname,$clname,$cemail,$ctitle,$cphone,$cnotes,$id));

        }
    }
    
    public function update(){
        
        
            
            $cid = $this->data['cUpdateContact']['cID'];
            $cfname = $this->data['cUpdateContact']['cFName'];
            $clname = $this->data['cUpdateContact']['cLName'];
            $cemail = $this->data['cUpdateContact']['cEmail'];
            $ctitle = $this->data['cUpdateContact']['cTitle'];
            $cphone = $this->data['cUpdateContact']['cPhone'];
            $cnotes = $this->data['cUpdateContact']['cNotes'];
      		
      		$this->db->updateData('contacts',array('cFName'=>$cfname,'cLName'=>$clname,'cEmail'=>$cemail,'cTitle'=>$ctitle,
      		    'cPhone'=>$cphone,'cNotes'=>$cnotes),'cID='.$cid);
        
    }
    
    public function view(){
        $contacts = $this->db->fetchAll('contacts');
        //.' AND is_active = 1'
        return $contacts;
    }
    
    public function remove(){
        
            $cid = $this->data['cRemoveContact']['cID'];        
            $this->db->deleteData('contacts','cID='.$cid);
        
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

}

?>