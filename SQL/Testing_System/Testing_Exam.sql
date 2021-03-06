-- CREATE DATABASE 
DROP DATABASE IF EXISTS Testing_Exam;
CREATE DATABASE IF NOT EXISTS Testing_Exam;
USE Testing_Exam;

-- CREATE TABLE Customer

CREATE TABLE Customer(
	CustomerID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`   		VARCHAR (30) NOT NULL,
    Phone			TINYINT UNSIGNED NOT NULL UNIQUE,
    Email			VARCHAR (45) NOT NULL UNIQUE,
    Address			VARCHAR (45) NOT NULL,
    Note			VARCHAR	(45) 
);

-- CREATE TABLE CAR

CREATE TABLE Car(
	CarID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Maker			ENUM("HONDA","TOYOTA"),
    Model			VARCHAR (30) NOT NULL,
    Yeah			YEAR,
    Color			VARCHAR (30) NOT NULL,
    Note			VARCHAR (45) 
);
    
-- CREATE TABLE Car_Oder

CREATE TABLE Car_Oder(
	OrderID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CustomerID  	TINYINT UNSIGNED NOT NULL,
    CarID			TINYINT UNSIGNED NOT NULL,
    Amount			TINYINT UNSIGNED NOT NULL DEFAULT 1,
    SalePrice		TINYINT UNSIGNED,
    OrderDate		DATE,
    DeliveryDate    DATE,
    DeliveryAddress	VARCHAR (45) NOT NULL,
    `Status`		TINYINT,
    Note			VARCHAR (45)
);

