-- 
-- Views
-- 
-- A view on Site.
-- Select all tables. We can use this view to extract all records on the table site
CREATE VIEW view_site (identifier, `name`, country, region, locality, postal_code, street, post_office_box_number) 
AS
SELECT identifier, `name`, country, region, locality, postal_code, street, post_office_box_number
FROM site;
-- 
-- A view to retrieve all sites with their rooms
-- Example of views as Interface
-- 
CREATE VIEW site_room (site_name, locality, street, room_name, room_description)
AS
SELECT site.name, site.locality, site.street, room.name, room.description 
FROM site, room
WHERE site.identifier = room.site ORDER BY locality;
-- 
-- Views as Access control mecanisme
-- 
CREATE VIEW view_on_vet_4_hln(family_name, given_name, email) 
AS
SELECT family_name, given_name, email 
FROM veterinary;
GRANT SELECT ON view_on_vet_4_hln to 'helene'@'localhost';
-- 
-- Stored procedure
DELIMITER //
CREATE PROCEDURE get_employee_By_Id (IN id SMALLINT)
BEGIN
    SELECT * FROM employee 
    WHERE  identifier = id;
END //
-- 
-- Call this procedure
CALL get_employee_By_Id(2);
-- 
-- 
CREATE PROCEDURE del_employee (IN id SMALLINT)
BEGIN
    IF(get_employee_By_Id(id) > 0
        THEN DELETE FROM employee WHERE identifier = id
    ENDIF;
END //
-- 
-- Statistique
-- 
DELIMITER //                                                      
CREATE PROCEDURE count_employees_by_locality (loc VARCHAR(64), OUT num_employee INT)  
BEGIN
    SELECT COUNT(*) INTO num_employee 
    FROM employee
    WHERE locality = loc;                               
END //
DELIMITER ;
-- 
-- Call this procedure
CALL count_employees_by_locality('Leuven', @num_emp);
SELECT @num_emp;
-- 
-- 
DELIMITER //
CREATE TRIGGER check_before_update_pet BEFORE UPDATE
ON `pet` FOR EACH ROW
BEGIN
    IF NEW.name IS NOT NULL
    AND NEW.name != ''
      THEN
        SET NEW.name = 'John Doe';
    END IF;
END //
DELIMITER ;
