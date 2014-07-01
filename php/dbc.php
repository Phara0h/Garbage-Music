<?php
//error_reporting(E_ALL);
//ini_set('display_errors', '1');
class DBC {
 
    private $_address = "127.0.0.1";
    private $_user = 'root';
    private $_pass = '';
    private $_db = 'musicdb';
    private $_link;
	
    function __construct() {
        $this->_link = @mysql_connect($this->_address, $this->_user, $this->_pass) or die(mysql_error());
        mysql_select_db($this->_db) or die(mysql_error());
    }

    public function Query($query, $returnid = false) {
        $this->result = mysql_query($query) or $this->show_error(mysql_errno(), mysql_error(), "query", $query, __line__);
		return $this->result;
    }

    public function insertid() {
        $id = $this->lastinsertid;
        return $id;
    }
	
    private function show_error($errno, $errtext,$function, $query, $line)
    {
		$error = "There was an error in the function $function. <br />";
		$error .= "Line Number: $line.<br />";
		$error .= "Error Number: $errno.<br />";
		$error .= "Error Text: $errtext.<br />";
		$error .= "Query: $query <br />";
		echo $error;
		exit($error);
	}

}
?>