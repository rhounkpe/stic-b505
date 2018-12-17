<?php
    class SiteManager {
        private $_db; // Instance of PDO

        public function __construct($db) {
            $this->setDb($db);
        }

        public function create(Site $site) {
            $query = $this->_db->prepare('INSERT INTO site SET name = :name, address = :address ');

            $query->bindValue(':name', $site->name());
            $query->bindValue(':address', $site->address());

            $query-> execute();
        }

        public function getAll() {
            $sites = array();

            $query = $this->_db->query('SELECT * FROM site ORDER BY identifier');

            while ($data = $query->fetch(PDO::FETCH_ASSOC)) {
                $sites[] = new Site($data);
            }

            return $sites;
        }

        public function getById(Site $site) {
            $query = $this->_db->query('SELECT * FROM site WHERE identifier = ' . $site->identifier());

            $data = $query->fetch(PDO::FETCH_ASSOC);

            return  new Site($data);
        }

        public function update(Site $site) {
            $query = $this->_db->prepare('UPDATE site SET identifier = :identifier,  name = :name');

            $query->bindValue(':name', $site->name());

            $query->execute();
        }

        public function delete(Site $site) {
            $this->_db->exec('DELETE FROM site WHERE id = ' . $site->identifier());
        }

        public function setDb(PDO $db) {
            $this->_db = $db;
        }
    }
?>
