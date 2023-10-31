<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=utf-8");
header('Access-Control-Allow-Headers: *');
class Config
{
    protected $db;
    protected function connect()
    {
        try {
            $NAMEDB = 'asigno';
            $HOST = 'localhost';
            $USER = 'root';
            $PASSWORD = '';
            $conectar = $this->db = new PDO("mysql:host=$HOST;dbname=$NAMEDB", "$USER", "$PASSWORD");
            return $conectar;
        } catch (Exception $e) {
            print "¡Error BD!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    public function set_names()
    {
        return $this->db->query("SET NAMES 'utf8'");
    }
}
