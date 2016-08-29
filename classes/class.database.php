<?php
require_once('../db/config.php');
include_once('DBPDO/class.DBPDO.php');

class Database {
    private $db;
    public function __construct() {

        try {

            $this->db = new DBPDO();
        }
        catch (PDOException $e) {

            echo $e->getMessage();
        }
    }

    public function closeConnection() {

        $this->conn = null;
    }
    
    /**
     * Function fetchData
     *
     * Fetch data from the database, depends on the parameters.
     *
     * @param (table,where,limit) about this param
     * @return array
     */
    public function fetchAll($table,$where = null,$limit = null){
        $select = 'SELECT * FROM '.$table;
        if($where != null){
            $select .= ' WHERE '.$where;
        }
        if($limit != null){
            $select .= ' LIMIT '.$limit;
        }
        $data = $this->db->execute($select)->fetchAll(PDO::FETCH_ASSOC);
        
        return $data;
    }

    public function fetchAll_sql($sql,$where = null,$limit = null){
        $select = $sql;
        if($where != null){
            $select .= ' WHERE '.$where;
        }
        if($limit != null){
            $select .= ' LIMIT '.$limit;
        }
        $data = $this->db->execute($select)->fetchAll(PDO::FETCH_ASSOC);

        return $data;
    
    }
    
    public function deleteData($table,$where = null){
    	$delete = 'DELETE FROM '.$table;
		
    	if($where != null){
    		$delete .= ' WHERE '.$where;
    	}
        // echo $delete."\n";
    	$data =$this->db->execute($delete);
        if($data){   
            return $data; 
        }
        else{
            return 0; 
        }    
    }
    
    
    
    public function col_exists($table,$where=null){
        $select = 'SELECT count(*) FROM '.$table;
        
        if($where != null){
            $select .= ' WHERE '.$where;
        }
				
        $data = $this->db->execute($select);
        
        $data->bindColumn(1, $iCount);
        
        $data->fetch(PDO::FETCH_BOUND);
        
        return $iCount;
    }

    public function col_exists_sql($sql){
        $select = $sql;
        $data = $this->db->execute($select)->fetchAll(PDO::FETCH_ASSOC);

        return $data;
    }
    
    function insertData($table, $rows){

        $insert = 'INSERT INTO '.$table .'(';
        $values = '';
        $keys = array_keys($rows); 
        
        for($i = 0; $i < count($rows); $i++){
            
            $insert .= $keys[$i];

            if($i != count($rows)-1){
                $insert .= ','; 
            }
            if($i == count($rows)-1){
                $insert .= ' ) ';
            }
        }

        for($i = 0; $i < count($rows); $i++){
            
            if(is_string($rows[$keys[$i]])){
                $values .= '"'.$rows[$keys[$i]].'"';
            }
            else{
                $values .= $rows[$keys[$i]];
            }

            if($i != count($rows)-1){
                $values .= ','; 
            }
        }

        // if($rows != null){
        //     for($h = 0; $h < count($rows); $h++){
        //         if(is_string($rows[$h]))
        //             $rows[$h] = $rows[$h];
        //     }
        //     $rows = implode(',',$rows);
        //     $insert .= ' ('.$rows.')'; 
            
        // }
        
        // for($i = 0; $i < count($values); $i++){
        //     if(is_string($values[$i]))
        //         $values[$i] = '"'.$values[$i].'"';
        // }
        
        // $values = implode(',',$values);
        
        $insert .= ' VALUES ('.$values.')';
        
        // echo $insert;
        $data = $this->db->execute($insert); 
        $lastid = $this->db->lastInsertId();
        if($data){
            return $lastid; 
//            return true; 
        }
        else{
            return false; 
        }
    }
    
    public function updateData($table,$rows,$where){

        $update = 'UPDATE '.$table.' SET ';
        $keys = array_keys($rows); 
        
        for($i = 0; $i < count($rows); $i++){
            
            if(is_string($rows[$keys[$i]])){
                $update .= $keys[$i].'="'.$rows[$keys[$i]].'"';
            }
            else{
                $update .= $keys[$i].'='.$rows[$keys[$i]];
            }

            if($i != count($rows)-1){
                $update .= ','; 
            }
        }
        
        if($where != null){
            $update .= ' WHERE '.$where;
        }
        
        // echo $update;
        $data =$this->db->execute($update);
        if($data){   
            return 1; 
        }
        else{
            return 0; 
        }
    }
    
    public function acomps($aid){
        $data = $this->db->execute('SELECT DISTINCT * FROM tbl_agencies AS agency JOIN tbl_agency_comps AS comps ON comps.t_id_agencies ='.$aid.' WHERE agency.id ='.$aid)->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }
    
    public function lastInsertId(){
        return $this->db->lastInsertId();
    }
    
    
    
}

?>