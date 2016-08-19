<?php 
include_once('class.database.php');

class iLog_DB{
    private $db;
    public $lastid;
    public function __construct(){  

   $this->db = new Database();

    }

    public function view(){
        $ret = $this->db->fetchAll('qr_ilog');
        
        return $ret;
    }
   
    public function viewAll($arr_values){
        $begin_time = $arr_values['begin_time'];
        $end_time = $arr_values['end_time'];
        $sql = "SELECT concat('ilog_', @rownum:=@rownum+1) AS DT_RowId, qr_log.* FROM (SELECT @rownum:=0) r, qr_log where CREATE_DATE BETWEEN str_to_date('".$begin_time."','%Y-%m-%d %H:%i:%s') and str_to_date('".$end_time."','%Y-%m-%d %H:%i:%s')";
        // echo $sql."<br>";
        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
    
    public function create($arr_values){
        $ret = $this->db->insertData('qr_log', $arr_values);
        // print_r($arr_values);
        return $ret;
    }

    /**
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