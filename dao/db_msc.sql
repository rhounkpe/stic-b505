-- MappedSuperclass Inheritance Strategy
-- Each database table contains both the base class and the subclass properties
-- It’s not possible to use polymorphic queries
-- 
-- Uncomment and it become Table Per Class Strategy
-- 
-- 
DROP DATABASE IF EXISTS `refuge`;
-- 
-- 
CREATE DATABASE IF NOT EXISTS `refuge` CHARACTER SET 'utf8';
USE `refuge`;
-- 
-- 
-- Table Site
-- 
CREATE TABLE IF NOT EXISTS `Site` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    PRIMARY KEY (`identifier`)
)
ENGINE=INNODB;
-- 

CREATE TABLE IF NOT EXISTS `Room`(
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `site` SMALLINT UNSIGNED NOT NULL,
    `description` TEXT,
    PRIMARY KEY (`identifier`),
    FOREIGN KEY (`site`) REFERENCES Site(`identifier`)
)
ENGINE=INNODB;
-- 
-- 
CREATE TABLE IF NOT EXISTS `Person` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    `tel` VARCHAR(16),
    `country` VARCHAR(64),
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;

-- 
-- Employee Veterinary
CREATE TABLE IF NOT EXISTS `Veterinary` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    -- tel[1-3]
    `tel` VARCHAR(16),
    `country` VARCHAR(64),
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- Employee table
CREATE TABLE IF NOT EXISTS `Employee` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    -- tel[1-3]
    `tel` VARCHAR(16),
    `country` VARCHAR(64),
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    `matricule` CHAR(8) NOT NULL,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- Volunteer table
CREATE TABLE IF NOT EXISTS `Volunteer` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(64) NOT NULL,
    `given_name` VARCHAR(64) NOT NULL,
    `Birth_date` DATETIME NOT NULL,
    `birth_place` VARCHAR(64),
    `email` VARCHAR(128) NOT NULL,
    -- tel[1-3]
    `tel` VARCHAR(16),
    `country` VARCHAR(64) NOT NULL,
    `region` VARCHAR(64),
    `locality` VARCHAR(64),
    `postal_code` CHAR(4) NOT NULL,
    `street` VARCHAR(128) NOT NULL,
    `post_office_box_number` VARCHAR(8),
    `matricule` CHAR(8) NOT NULL,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
-- 
-- 
-- Table Animal
--
/*
CREATE TABLE IF NOT EXISTS `Animal` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_naissance` DATE,
    `date_arrivee` DATE,
    PRIMARY KEY (identifier)
)
ENGINE=INNODB;
*/
-- 
-- 
-- Table Pet
--
CREATE TABLE IF NOT EXISTS `Pet` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_birth` DATE,
    `date_arrival` DATETIME NOT NULL,
    `room` SMALLINT UNSIGNED NOT NULL,
    `site` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`identifier`),
    CONSTRAINT fk_pet_room FOREIGN KEY (room) REFERENCES Room (identifier),
    CONSTRAINT fk_pet_site FOREIGN KEY (site) REFERENCES Site (identifier) 
)
ENGINE=INNODB;
-- 
-- 
-- Table Wild_Animal
--
CREATE TABLE IF NOT EXISTS `Wild_Animal` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_birth` DATE,
    `date_arrival` DATETIME NOT NULL,
    `date_limit`DATETIME NOT NULL,
    `site` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`identifier`),
    CONSTRAINT fk_wild_animal_site FOREIGN KEY (site) REFERENCES Site(identifier)
    )
ENGINE=INNODB;
-- 
-- 
-- Table Farm_Animal
--
CREATE TABLE IF NOT EXISTS `Farm_Animal` (
    `identifier` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(68),
    `species` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `date_birth` DATE,
    `date_arrival` DATETIME NOT NULL,
    `site` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`identifier`),
    CONSTRAINT fk_farm_animal_site FOREIGN KEY (site) REFERENCES Site(identifier)
)
ENGINE=INNODB;
--  
-- Table Adoption
-- 
CREATE TABLE IF NOT EXISTS `Adoption` (
`begin_date`DATE NOT NULL,
`end_date`DATE,
`animal` SMALLINT UNSIGNED NOT NULL,
`person` SMALLINT UNSIGNED NOT NULL,
CONSTRAINT fk_adoption_animal_pet FOREIGN KEY (animal) REFERENCES Pet(identifier),
CONSTRAINT fk_adoption_animal_person_ FOREIGN KEY (person) REFERENCES Person(identifier),
PRIMARY KEY (`animal`,`person`,`begin_date`)
)
ENGINE=INNODB;
-- 
-- complexification? récurrence? description?
CREATE TABLE IF NOT EXISTS `Treatment` ( 
    `admin_date` DATE NOT NULL,
    `animal` SMALLINT UNSIGNED NOT NULL,
    `vet` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`animal`,`vet`, `admin_date`)
    -- CONSTRAINT fk_treatment_pet FOREIGN KEY (animal) REFERENCES Pet(identifer),
    -- CONSTRAINT fk_treatment_vet FOREIGN KEY (vet) REFERENCES Veterinary(identifier)
)
ENGINE=INNODB;
-- 
-- 
-- SITE ROOM
INSERT INTO `Site` 
(name, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Boondael',
    'Belgium',
    'Brussels',
    'ixelles',
    '1050',
    'Chausse de boondael 421',
    ''
);
-- 
-- comment faire que la foreign key soit le nom (càd A B ou C) et pas l'ID?
-- 
INSERT INTO `Site` 
(name, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Braine',
    'Belgium',
    'Brabant wallon',
    'Braine l alleud',
    '1420',
    'rue charles plisnier 21',
    ''
);

INSERT INTO `Site` 
(name, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Leuven',
    'Belgium',
    'Brabant flamand',
    'Leuven',
    '3000',
    'hoogstraat 1',
    ''
);

INSERT INTO `Site` 
(name, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Anderlecht',
    'Belgium',
    'Brussels',
    'Anderlecht',
    '1070',
    'Chaussee des mauves 223',
    ''
);

-- 
-- 
-- Let's populate Veterinary with 10 records
-- 
-- Trigger to verify email format. If not valid, will not save the record.
INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Hounkpe',
    'Rufin',
    '1976-06-13 08:55:00',
    'Cotonou',
    'rhounkpe@gmail.com',
    '0484979320',
    'Belgium',
    'Brussels',
    'Vorst',
    '1190',
    'Van Volxemlaan 302',
    '48'
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Dumont',
    'Alain',
    '1979-06-15 08:55:00',
    'etterbeek',
    'alaindumont@gmail.com',
    '0465447894',
    'Belgium',
    'Brussels',
    'etterbeek',
    '1040',
    'rue charles plisnier 21',
    ''
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Charles',
    'Dominique',
    '1980-05-13 08:55:00',
    'Charleroi',
    'hoste@yahoo.com',
    '0425568765',
    'Belgium',
    'Brabant wallon',
    'Braine l alleud',
    '1420',
    'rue jacques brel',
    ''
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Mogherini',
    'Federica',
    '19-09-03 08:55:00',
    'Charleroi',
    'fedemoghe@gmail.com',
    '0434543267',
    'Belgium',
    'Hainaut',
    'Gosselie',
    '6041',
    'rue shcuman',
    '3'
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Merkel',
    'Angela',
    '1955-07-22 08:55:00',
    'Berlin',
    'merkel.angela@yahoo.com',
    '0478765456',
    'Belgium',
    'Brussels',
    'ixelles',
    '1050',
    'chaussee de boondael 421',
    ''
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Juncker',
    'Jean Claude',
    '1950-10-22 08:55:00',
    'Luxembourg',
    'jc_juncker@gmail.com',
    '0479876568',
    'Belgium',
    'Brussels',
    'ixelles',
    '1050',
    'avenue franklin roosevelt',
    ''
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Verhofstadt',
    'Guy',
    '1953-11-11 08:55:00',
    'Termonde',
    'guyguy1@yahoo.com',
    '0465898765',
    'Belgium',
    'Brussels',
    'Watermael-Boisfort',
    '1170',
    'rue Wiener 56',
    '1'
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'De Wever',
    'Bart',
    '1965-03-02 08:55:00',
    'Anvers',
    'ton_ami_bart@gmail.com',
    '0445326789',
    'Belgium',
    'Anvers',
    'Anvers',
    '2000',
    'rue loepold II 45',
    ''
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Michel',
    'Charles',
    '1976-12-03 08:55:00',
    'etterbeek',
    'mich_mich@gmail.com',
    '0454455445',
    'Belgium',
    'Brussels',
    'Brussels',
    '1000',
    'rue de la loi 16',
    ''
);

INSERT INTO `Veterinary` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number)
VALUES (
    'Onkelinx',
    'Laurette',
    '1960-11-14 08:55:00',
    'Lillois',
    'kikou_laurette@yahoo.com',
    '0478546745',
    'Belgium',
    'Brabont wallon',
    'waterloo',
    '1410',
    'rue jean david 4',
    '1'
);
-- 
-- 10 EMPLOYEE
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Demanet',
    'Hélène',
    '1995-07-22 18:55:00',
    'Brussels',
    'helene.demanet@gmail.com',
    '0479750446',
    'Belgium',
    'Brussels',
    'ixelles',
    '1050',
    'chaussee de boondael 1',
    '',
    'MLNHFCDS'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Dumoulin',
    'Antoine',
    '1990-08-10 18:55:00',
    'Namur',
    'antoinedumoulin@gmail.com',
    '0476562321',
    'Belgium',
    'Namur',
    'havelange',
    '5370',
    'rue du moulin 34',
    '',
    'PETGVCDS'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Macron',
    'Emmanuel',
    '1950-02-04 10:55:00',
    'Paris',
    'manu007@gmail.com',
    '0476562321',
    'Belgium',
    'Brussels',
    'Watermael-Boisfort',
    '1170',
    'rue des gilets jaunes 56',
    '',
    'KHYTDSCX'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Lareine',
    'Elizabeth',
    '1934-08-10 18:55:00',
    'Londres',
    'the_real_queen@gmail.com',
    '045324678',
    'Belgium',
    'Brabant wallon',
    'waterloo',
    '1410',
    'chaussee wellington le grand 1',
    '',
    'PMVFREAZ'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Jabon',
    'Jan',
    '1974-05-10 18:55:00',
    'Gand',
    'the_ham@gmail.com',
    '0456893421',
    'Belgium',
    'Gand',
    'gand',
    '9000',
    'hoogstraat 3',
    '12',
    'VCDERTYU'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Middleton',
    'catherine',
    '1984-08-10 18:55:00',
    'Londres',
    'princess01@gmail.com',
    '0428899878',
    'Belgium',
    'Brussels',
    'Uccle',
    '1180',
    'rue des anglais 21',
    '',
    'SGCNXLOU'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Van Rompuy',
    'Herman',
    '1960-08-19 18:55:00',
    'Leuven',
    'Herman.vr@gmail.com',
    '0467985423',
    'Belgium',
    'Brabant Flamand',
    'Leuven',
    '3000',
    'marktstraat 19',
    '2',
    'ZNKIDYTC'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'De block',
    'margaret',
    '1984-08-10 18:55:00',
    'Anvers',
    'happy_and_healthy@gmail.com',
    '0448382829',
    'Belgium',
    'Brabant Flamand',
    'Leuven',
    '3000',
    'leuvenstraat 3',
    '',
    'QMODFGCS'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Jean',
    'Louis',
    '1976-10-10 18:55:00',
    'etterbeek',
    'jeanlouis@yahoo.com',
    '0467341289',
    'Belgium',
    'Brussels',
    'ixelles',
    '1050',
    'Avenue générale jacque 435',
    '7',
    'SHUOCSZA'
);
-- 
INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Marie',
    'Madelaine',
    '1944-08-10 18:55:00',
    'Berlin',
    'marie0999@gmail.com',
    '04346997222',
    'Belgium',
    'Brabant wallon',
    'rixensart',
    '1330',
    'chaussee josephine charlotte 4',
    '',
    'SUIPLKGF'
);

INSERT INTO `Employee` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Dupont',
    'Adrien',
    '1990-06-04 16:55:00',
    'Namur',
    'adrien_dupont@gmail.com',
    '0445783246',
    'Belgium',
    'Brussels',
    'Uccle',
    '1180',
    'chaussee de waterloo 3679',
    '6',
    'JKRDSZAX'
);
-- 
-- 5 VOLUNTEER
-- 
INSERT INTO `Volunteer` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'France',
    'Marie',
    '1980-04-04 16:55:00',
    'Uccle',
    'marie_france666@gmail.com',
    '0473919754',
    'Belgium',
    'Brussels',
    'Uccle',
    '1180',
    'chaussee de waterloo 3678',
    '1',
    'IXSPQWLK'
);
-- 
INSERT INTO `Volunteer` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Cordie',
    'Annie',
    '1967-10-08 16:55:00',
    'Charleroi',
    'la_bonne_du_cure@gmail.com',
    '049865328',
    'Belgium',
    'Hainaut',
    'Charleroi',
    '6000',
    'chaussee de louvain 6678',
    '8',
    'QPMZEOCJ'
);

INSERT INTO `Volunteer` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Gelluk',
    'Philippe',
    '1965-09-08 16:55:00',
    'Brussels',
    'el_gato@gmail.com',
    '046789653',
    'Belgium',
    'Brussels',
    'etterbeek',
    '1040',
    'Boulevard de la couronne 118',
    '3',
    'QMCLDMPS'
);

INSERT INTO `Volunteer` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Guillaume',
    'Valeriane',
    '1990-09-08 16:55:00',
    'Namur',
    'valou123@yahoo.com',
    '0445121341',
    'Belgium',
    'Brussels',
    'ixelles',
    '1050',
    'Boulevard de la couronne 18',
    '',
    'KSOPEMXC'
);

INSERT INTO `Volunteer` 
(family_name, given_name, Birth_date, birth_place, email, tel, country, region, locality, postal_code, street, post_office_box_number, matricule)
VALUES (
    'Dallemagne',
    'Thibault',
    '1996-08-28 16:55:00',
    'Namur',
    'thib34@yahoo.com',
    '0438382898',
    'Belgium',
    'Namur',
    'Durbuy',
    '6940',
    'rue haute 56',
    '2',
    'QPYCDLZE'
);
-- 
-- ANIMAUX
-- 
/*
INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Cougnou',
    'cat',
    'adorable',
    '2009-01-01',
    '2017-10-01',
    1,
    2
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Papouille',
    'cat',
    'le plus beau',
    '2003-10-01',
    '2017-01-01',
    1,
    1
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Plume',
    'cat',
    'majestueuse',
    '2006-02-01',
    '2016-10-01',
    2,
    2
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Lila',
    'dog',
    'aimante',
    '2003-10-01',
    '2018-10-01',
    1,
    2
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Maya',
    'dog',
    'affectueuse',
    '2008-07-01',
    '2017-08-01',
    2,
    2
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Canaille',
    'dog',
    'bruyant',
    '2010-09-01',
    '2018-04-01',
    1,
    1
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Buddy',
    'dog',
    'impressionnant',
    '2012-05-01',
    '2018-10-02',
    2,
    5
);

INSERT INTO `Pet` 
(name, species, description, date_birth, date_arrival, room, site)
VALUES (
    'Gaston',
    'dog',
    'un amour',
    '2015-09-01',
    '2018-12-01',
    3,
    1
);
*/
-- 
INSERT INTO `Wild_Animal` 
(name, species, description, date_birth, date_arrival, date_limit,site)
VALUES (
    'Titi',
    'bird',
    'blessé à l aile',
    '2018-12-01',
    '2018-12-01',
    '2018-12-16',
    1
);

INSERT INTO `Wild_Animal` 
(name, species, description, date_birth, date_arrival, date_limit,site)
VALUES (
    'Filou',
    'fox',
    'plusieurs blessures',
    '2018-12-01',
    '2018-12-12',
    '2019-01-2',
    2
);

INSERT INTO `Wild_Animal` 
(name, species, description, date_birth, date_arrival, date_limit,site)
VALUES (
    'Remy',
    'bird',
    'né au refuge',
    '2018-12-01',
    '2018-12-01',
    '2018-12-16',
    3
);

INSERT INTO `Wild_Animal` 
(name, species, description, date_birth, date_arrival, date_limit,site)
VALUES (
    'Pepite',
    'hedgehog',
    '2018-12-01',
    '2018-12-01',
    '2018-12-03',
    '2018-12-17',
    1
);

INSERT INTO `Farm_Animal` 
(name, species, description, date_birth, date_arrival,site)
VALUES (
    'marguerite',
    'cow',
    'mal traitee',
    '2018-09-03',
    '2018-09-03',
    3
);

INSERT INTO `Farm_Animal` 
(name, species, description, date_birth, date_arrival,site)
VALUES (
    'Ronchon',
    'pig',
    'mal traite',
    '2018-12-01',
    '2018-10-09',
    2
);

INSERT INTO `Farm_Animal` 
(name, species, description, date_birth, date_arrival,site)
VALUES (
    'Arthur',
    'sheep',
    'abandon',
    '2018-11-09',
    '2018-11-11',
    1
);

INSERT INTO `Farm_Animal` 
(name, species, description, date_birth, date_arrival,site)
VALUES (
    'Lily',
    'pig',
    'abandon',
    '2018-09-09',
    '2018-09-15',
    1
);
-- 
-- Populate room
-- 
INSERT INTO `Room` (name, site, description) VALUES ('Cat Room', 1, 'Room for cats');
INSERT INTO `Room` (name, site, description) VALUES ('Only for Dogs', 3, 'Room for dogs');
INSERT INTO `Room` (name, site, description)VALUES ('Rabbit hole', 1 ,'cats');
INSERT INTO `Room` (name, site, description) VALUES ('Chicks', 2, 'cats');
INSERT INTO `Room` (name, site, description) VALUES ('Angola', 4, 'dogs');
INSERT INTO `Room` (name, site, description) VALUES ('Todelin', 3, 'dogs');
INSERT INTO `Room` (name, site, description) VALUES ('Domino', 2, 'dogs');
INSERT INTO `Room` (name, site, description) VALUES ('Texaco', 1, 'cats');
-- 
CREATE USER IF NOT EXISTS 'rufin'@'localhost' IDENTIFIED BY 'pwd123';
CREATE USER IF NOT EXISTS 'helene'@'localhost' IDENTIFIED BY 'pwd123';
GRANT SELECT, INSERT, DELETE ON refuge.site TO 'rufin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON refuge.site TO 'helene'@'localhost';
-- 
CREATE USER IF NOT EXISTS 'asbl'@'localhost' IDENTIFIED BY 'HlnRuf2018';
GRANT ALL PRIVILEGES ON refuge.* TO 'asbl'@'localhost';
FLUSH PRIVILEGES;
-- 
-- 

