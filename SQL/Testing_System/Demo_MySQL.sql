DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE IF NOT EXISTS Testing_System;
USE Testing_System;

CREATE TABLE `Department` (
		DepartmentID 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	DepartmentName 	VARCHAR (30) NOT NULL
);

CREATE TABLE `Position` (
		PositionID		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName	VARCHAR (30) NOT NULL
);

CREATE TABLE `Account` (
		AccountID		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Email			VARCHAR (30) NOT NULL,
	Username		VARCHAR (30) NOT NULL,
	DepartmentID	INT UNSIGNED NOT NULL,
	PositionID		INT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

CREATE TABLE `Group` (
		GroupID			INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Groupname		VARCHAR (30) NOT NULL,
	CreatorID		INT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(Creator)
);

CREATE TABLE GroupAccount (
	GroupID			INT UNSIGNED NOT NULL,
	AccountID 		INT UNSIGNED NOT NULL,
	Joindate		DATE 
);

CREATE TABLE TypeQuestion (
		TypeID 			INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TypeName 		VARCHAR (30) NOT NULL
);

CREATE TABLE CategoryQuestion (
		CategoryID		INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CategoryName	VARCHAR (30) NOT NULL
);

CREATE TABLE Question (
		QuestionID		INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Content			VARCHAR (30) NOT NULL,
	CategoryID		INT UNSIGNED NOT NULL,
	TypeID			INT UNSIGNED NOT NULL,
	CreatorID		INT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountID)
);

CREATE TABLE Answer (
		AnswerID 		INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Content			VARCHAR (30) NOT NULL,
	QuestionID		INT UNSIGNED NOT NULL,
	isCorrect 		BOOLEAN,
    FOREIGN KEY(QuestionID) 	REFERENCES Question(QuestionID)
);

CREATE TABLE Exam (
		ExamID 			INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Code`			INT UNSIGNED NOT NULL,
	Title			VARCHAR (30) NOT NULL,
	CategoryID		INT UNSIGNED NOT NULL,
	Duration		INT UNSIGNED NOT NULL,
	CreatorID		INT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountID)
);

CREATE TABLE ExamQuestion (
	ExamID 			INT UNSIGNED NOT NULL,
	QuestionID		INT UNSIGNED NOT NULL,
    FOREIGN KEY(ExamID) 		REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) 	REFERENCES Question(QuestionID),
    PRIMARY KEY(ExamID,QuestionID)
);













SELECT * FROM Sales;
SELECT * FROM Sales.Sales;

INSERT INTO Department(DepartmentName)
VALUES 
				("Marketing"),
                ("Sale"),
                ("Bảo vệ"),
                ("Nhân sự"),
                ("Kỹ thuật"),
                ("Tài chính"),
                ("Phó giám đốc"),
                ("Giám đốc"),
                ("Thư kí"),
                ("Bán hàng"),
                
                
                
DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE Testing_System;
USE Testing_System;

CREATE TABLE `Department` (
DepartmentID 	INT AUTO_INCREMENT PRIMARY KEY,
DepartmentName 	VARCHAR (30)
);

INSERT INTO Department (DepartmentName)
VALUES ("John"),("Daniel"),("Zbyszek"),("Jankos"),("Sofm");

CREATE TABLE Position (
PositionID		INT AUTO_INCREMENT PRIMARY KEY,
PositionName	VARCHAR (30)
);

INSERT INTO Position (PositionName)
VALUES ("Director"),("Employeess"),("Employeess"),("Employeess"),("Employeess");

CREATE TABLE `Account` (
AccountID		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Email			VARCHAR (30),
Username		VARCHAR (30) UNIQUE,
DepartmentID	INT,
PositionID		INT,
CreatDate		DATE,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
FOREIGN KEY (PositionID)   REFERENCES `Position` (PositionID)
);

INSERT INTO `Account` (Email, Username, CreatDate)
VALUES ("email123@gmail.com","Email1","2020/11/11"),("email123@gmail.com","Email2","2020/11/11"),("email123@gmail.com","Email3","2020/11/11"),("email123@gmail.com","Email5","2020/11/11"),("email123@gmail.com","Email5","2020/11/11");


CREATE TABLE `Group` (
GroupID			INT AUTO_INCREMENT PRIMARY KEY,
Groupname		VARCHAR (30),
CreatorID		INT,
CreatDate		DATE
);

INSERT INTO `Account` (Groupname, CreatDate)
VALUES ("Email123","2020/11/11"),("Email123","2020/11/11"),("Email123","2020/11/11"),("Email123","2020/11/11"),("Email123","2020/11/11");

CREATE TABLE GroupAccount (
GroupID			INT,
AccountID 		INT,
Joindate		DATE,
FOREIGN KEY (GroupID) 	   REFERENCES `Group` (GroupID),
FOREIGN KEY (AccountID)    REFERENCES `Account` (AccountID)
);

INSERT INTO GroupAccount (GroupID, AccountID, Joindate)
VALUES (1,1,2021/12/20),(1,1,2021/12/20),(1,1,2021/12/20),(1,1,2021/12/20),(1,1,2021/12/20);

CREATE TABLE TypeQuestion (
TypeID 			INT AUTO_INCREMENT PRIMARY KEY,
TypeName 		VARCHAR (30)
);

INSERT INTO TypeQuestion()

CREATE TABLE CategoryQuestion (
CategoryID		INT AUTO_INCREMENT PRIMARY KEY,
CategoryName	VARCHAR (30)
);

CREATE TABLE Question (
QuestionID		INT AUTO_INCREMENT PRIMARY KEY,
Content			VARCHAR (30),
CategoryID		INT,
TypeID			INT,
CreatorID		INT,
CreatDate		DATE,
FOREIGN KEY (CategoryID)   REFERENCES CategoryQuestion (CategoryID),
FOREIGN KEY (TypeID)       REFERENCES TypeQuestion	(TypeID)
);

CREATE TABLE Answer (
AnswerID 		INT AUTO_INCREMENT PRIMARY KEY,
Content			VARCHAR (30),
QuestionID		INT,
isCorrect 		BOOLEAN,
FOREIGN KEY (QuestionID)   REFERENCES Question (QuestionID) 
);

CREATE TABLE Exam (
ExamID 			INT AUTO_INCREMENT PRIMARY KEY,
`Code`			INT,
Title			VARCHAR (30),
CategoryID		INT,
Duration		INT,
CreatorID		INT,
CreatDate		DATE,
FOREIGN KEY (CategoryID)    REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE ExamQuestion (
ExamID 			INT,
QuestionID		INT,
FOREIGN KEY (ExamID)        REFERENCES Exam (ExamID)
);

INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   '5'			,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'		,   '1'			,   '2'		,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');