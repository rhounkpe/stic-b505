<?php

/*
    function load_models_from_animal($class_name) {
        require_once './animal/' . $class_name . '.php';
    }

    function load_models_from_person($class_name) {
        require_once './person/' . $class_name . '.php';
    }

    function load_models_from_site($class_name) {
        require_once './site/' . $class_name . '.php';
    }

    spl_autoload_register('load_models_from_animal');
    spl_autoload_register('load_models_from_person');
    spl_autoload_register('load_models_site');
    */

    abstract class Model {
        private static $pdo;

        /**
         * Get connected to the Data Base and return an instance of PDO.
         * If we're already connected, return this existing PDO instance.
         * Singleton Pattern
         * */
        private static function connect() {
            if (self::$pdo == null) {
                $dsn = 'mysql:host=localhost;dbname=refuge';
                $dbuser = 'root';
                $dbpassword = 'root';

                self::$pdo = new PDO($dsn, $dbuser, $dbpassword);
                self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            }
            return self::$pdo;
        }

        /**
         * Execute a query
         */
        protected static function execute($sql, $params) {
            $stmt = self::connect()->prepare($sql);
            $stmt->execute($params);

            return $stmt;
        }

        protected function hydrate(array $data) {
            foreach($data as $key => $value) {
                // Let's grabbe the setter corresponding to the attribut
                $method = 'set' . ucfirst($key);
                
                // If this setter exists
                if (method_exists($this, $method)) {
                    // We call the setter and we pass it dynamically the value corresponding to the key
                    $this->$method($value);
                }
            }
        }        

        /**
         * Return the ID of the last inserted value
         */
        protected static function lastInsertId() {
            return self::connect()->lastInsertId();
        }
    }
?>