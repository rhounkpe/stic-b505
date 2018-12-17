<?php
    class Room extends Model {
        private $identifier;
        private $name;
        private $site;
        private $description;

        public function __construct(array $data) {
            $this->hydrate($data);
        }

        public function identifier() {
            return $this->_identifier;
        }

        public function name() {
            return $this->_name;
        }
        
        public function site() {
            return $this->_site;
        }
        
        public function description() {
            return $this->_description;
        }

        public function setIdentifier($identifier) {
            $this->_identifier = $identifier;
        }


        public function setName($name) {
            $this->_name = $name;
        }

        public function setSite($site) {
            $this->_site = $site;
        }

        public function setDescription($description) {
            $this->_description = $description;
        }
    }
?>