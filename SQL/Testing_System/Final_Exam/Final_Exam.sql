-- CREATE DATABASE 
DROP DATABASE IF EXISTS Thuc_tap;
CREATE DATABASE IF NOT EXISTS Thuc_tap;
USE Thuc_tap;

-- CREATE TABLE Country

CREATE TABLE Country(
	Country_ID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Country_Name			VARCHAR (30) NOT NULL
);

-- CREATE TABLE Location

CREATE TABLE Location(
	Location_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Street_address			VARCHAR (45) NOT NULL,
    Postal_code				TINYINT UNSIGNED NOT NULL ,
    Country_ID				TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(Country_ID) REFERENCES Country(Country_ID)
);
    
-- CREATE TABLE Employee

CREATE TABLE Employee(
	Employee_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_name  				VARCHAR (45) NOT NULL,
    Email					VARCHAR (45) UNIQUE NOT NULL,
    Location_ID				TINYINT UNSIGNED NULL,
    FOREIGN KEY(Location_ID) REFERENCES Location(Location_ID) ON DELETE SET NULL
);

-- INSERT DATA 

-- INSERT TO Country

INSERT INTO Country					(Country_Name	) 
VALUES 								('Viet Nam'		),
									('America'		),
									('France'		),
									('England'		); 

-- INSERT TO Location

INSERT INTO Location				(Street_address	, Postal_code	, Country_ID	) 
VALUES 								('Ha Noi'		, 29			, 1				),
									('TP HCM'		, 21			, 1				),
									('TP HCM'		, 07 			, 1				),
									('United'		, 67			, 4				); 
                                    
-- INSERT TO Employee

INSERT INTO Employee				(Full_name				, Email						, Location_ID	) 
VALUES 								('Bui Tien Dung'		, 'nn01@gmail.com'			, 1				),
									('Tran Quoc Toan'		, 'nn02@gmail.com'			, 2				),
									('Le Thanh Nghi'		, 'nn03@gmail.com' 			, 2				),
									('Daniel Nguyen'		, 'nn04@gmail.com'			, 4				); 	
                                    
-- Question 2
-- A. Lấy tất cả các nhân viên thuộc Việt nam

SELECT DISTINCT		Employee_ID, Full_name, Email, Country_Name
FROM 				Employee e
INNER JOIN			Location l ON l.Location_ID = e.Location_ID
INNER JOIN			Country  c ON c.Country_ID 	= l.Country_ID
WHERE				c.Country_Name = "Viet Nam";

-- B.Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"

SELECT DISTINCT		Employee_ID, Full_name, Email, Country_Name
FROM 				Employee e
INNER JOIN			Location l ON l.Location_ID = e.Location_ID
INNER JOIN			Country  c ON c.Country_ID 	= l.Country_ID
WHERE				e.Email = "nn03@gmail.com";

-- C.Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc.
                                            
(SELECT DISTINCT 	c.Country_ID AS "Country_ID and Postal_code", c.Country_Name AS "Country and LocationID", COUNT(c.Country_ID) AS "So luong"
FROM				Country c
INNER JOIN			Location l ON l.Country_ID  = c.Country_ID
INNER JOIN			Employee e ON e.Location_ID = l.Location_ID
GROUP BY			c.Country_ID
ORDER BY			c.Country_ID ASC)
UNION ALL
(SELECT DISTINCT 	l.Postal_code,l.Location_ID, COUNT(l.Location_ID)
FROM				Location l
INNER JOIN			Country  c ON c.Country_ID  = l.Country_ID
INNER JOIN			Employee e ON e.Location_ID = l.Location_ID
GROUP BY			l.Location_ID
ORDER BY			l.Location_ID ASC);

                                            
-- Question 3. Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa 10 employee

DROP TRIGGER IF EXISTS Max_employee;
DELIMITER $$

CREATE TRIGGER Max_employee BEFORE INSERT 
ON Employee
FOR EACH ROW 

BEGIN
	
    IF Country_ID IN ( 	SELECT Country_ID
							FROM
							(	SELECT 		Country_ID, COUNT(Country_ID) 
								FROM 		Country 
								GROUP BY 	Country_ID
								HAVING 		COUNT(Country_ID)= 10) t1 )
    Then	
    signal sqlstate '45000'
    Set message_text = 'Max 10 employee in each Country';
    END IF;
End$$

DELIMITER //

-- Question 4. Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null

DELETE FROM Location
WHERE		Location_ID = 2;

SELECT 		* 
FROM		Location;

SELECT 		* 
FROM		Employee;
	