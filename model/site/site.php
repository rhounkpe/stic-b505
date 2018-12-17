<?php

    class Site extends Model {
        private $_identifier;
        private $_name;
        private $_country;
        private $_region;
        private $_locality;
        private $_postal_code;
        private $_street;
        private $_post_office_box_number;



        public function __construct(array $data) {
            $this->hydrate($data);
        }


        public function update() {
            $params = array(
                $this->_name,
                $this->_country,
                $this->_region,
                $this->_locality,
                $this->_postal_code,
                $this->_street,
                $this->_post_office_box_number,
            );

            if($this->_identifier == -1){
                $sql = 'INSERT INTO site (name, country, region, locality, postal_code, street, post_office_box_number) VALUES (?, ?,?, ?, ?, ?, ?)';
                $this->setIdentifier(self::lastInsertId());
            }
            
            self::execute($sql, $params);
            
            return true;

        }

        public static function getById(Site $site) {
            if ($site != null) {
                $id = (int) $site->identifier();

                $sql = 'SELECT * FROM site WHERE identifier = ?';
                $params = array($id);

                $query = self::execute($sql, $params);
                $data = $query->fetch();

                if ($query->rowCount() > 0) {
                    return new Site(array(
                        'identifier' => $data['identifier'],
                        'name' => $data['name'],
                        'country' => $data['country'],
                        'region' => $data['region'],
                        'locality' => $data['locality'],
                        'postal_code' => $data['postal_code'],
                        'street' => $data['street'],
                        'post_office_box_number' => $data['post_office_box_number']
                    ));
                }
            }

        }

        public static function getRoomsBySite(Site $site) {
            if ($site != null) {
    
                //$sql = "SELECT * FROM site, room where site.identifier = room.site AND site.name = ?";
                $sql = "SELECT * FROM site, room where site.identifier = room.site AND site.name = ?";
                $params = array(
                    $site->name()
                );

                $query = self::execute($sql, $params);
                $data = $query->fetchAll();

                $results = [];

                foreach($data as $row) {
         
                    $results[] = new Room(array(
                        'identifier' => $row['identifier'],
                        'name' => $row['name'],
                        'site' => $row['site'],
                        'description' => $row['site'],
                    ));
                }

                return $results;
            }
        }


        public static function getAll() {
            $params = array();

            $sql = 'SELECT * FROM site';

            $query = self::execute($sql, $params);

            $data = $query->fetchAll();

            $results = [];

            foreach ($data as $row) {
                $results[] = new Site(array(
                    'identifier' => $row['identifier'],
                    'name' => $row['name'],
                    'country' => $row['country'],
                    'region' => $row['region'],
                    'locality' => $row['locality'],
                    'postal_code' => $row['postal_code'],
                    'street' => $row['street'],
                    'post_office_box_number' => $row['post_office_box_number']
                ));
            }

            return $results;
        }




        public function identifier() {
            return $this->_identifier;
        }

        public function name() {
            return $this->_name;
        }


        public function country() {
            return $this->_country;
        }
 
        public function region() {
            return $this->_region;
        }


        public function locality() {
            return $this->_locality;
        }


        public function postal_code() {
            return $this->_postal_code;
        }

        public function street() {
            return $this->_street;
        }

        public function post_office_box_number() {
            return $this->_post_office_box_number;
        }


        public function setIdentifier($identifier) {
            $this->_identifier = $identifier;
        }

        public function setName($name) {
            $this->_name = $name;
        }

        public function setCountry($country) {
            $this->_country = $country;
        }
 
        public function setRegion($region) {
            $this->_region = $region;
        }


        public function setLocality($locality) {
            $this->_locality = $locality;
        }


        public function setPostal_code($postal_code) {
            $this->_postal_code = $postal_code;
        }

        public function setStreet($street) {
            $this->_street = $street;
        }

        public function setPost_office_box_number($street) {
            $this->_post_office_box_number = $street;
        }

    }
?>