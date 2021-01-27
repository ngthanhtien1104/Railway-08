-- CREATE DATABASE
DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE IF NOT EXISTS Testing_System;
USE Testing_System;

-- CREATE TABLE Department
CREATE TABLE `Department` (
	DepartmentID 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	DepartmentName 	VARCHAR (30) NOT NULL UNIQUE
);

-- CREATE TABLE Positon
CREATE TABLE `Position` (
	PositionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName	VARCHAR (30) NOT NULL
);

-- CREATE TABLE Account
CREATE TABLE `Account` (
	AccountID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email			VARCHAR (30) NOT NULL,
	Username		VARCHAR (30) NOT NULL,
    Fullname 		VARCHAR (30) NOT NULL,
	DepartmentID	TINYINT UNSIGNED NOT NULL,
	PositionID		TINYINT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- CREATE TABLE Group
CREATE TABLE `Group` (
	GroupID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Groupname		VARCHAR (30) NOT NULL,
	CreatorID		TINYINT UNSIGNED NOT NULL,
	CreatDate		DATE 
);

-- CREATE TABLE GroupAccount
CREATE TABLE GroupAccount (
	GroupID			TINYINT UNSIGNED NOT NULL,
	AccountID 		TINYINT UNSIGNED NOT NULL,
	Joindate		DATE 
);

-- CREATE TABLE TypeQuestion
CREATE TABLE TypeQuestion (
	TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName 		VARCHAR (30) NOT NULL
);

-- CREATE TABLE CategoryQuestion
CREATE TABLE CategoryQuestion (
	CategoryID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName	VARCHAR (30) NOT NULL
);

-- CREATE TABLE Question
CREATE TABLE Question (
	QuestionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content			VARCHAR (30) NOT NULL,
	CategoryID		TINYINT UNSIGNED NOT NULL,
	TypeID			TINYINT UNSIGNED NOT NULL,
	CreatorID		TINYINT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountID)
);

-- CREATE TABLE Answer
CREATE TABLE Answer (
	AnswerID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content			VARCHAR (30) NOT NULL,
	QuestionID		TINYINT UNSIGNED NOT NULL,
	isCorrect 		BOOLEAN,
    FOREIGN KEY(QuestionID) 	REFERENCES Question(QuestionID)
);

-- CREATE TABLE Exam
CREATE TABLE Exam (
	ExamID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code`			VARCHAR (30) NOT NULL,
	Title			VARCHAR (30) NOT NULL,
	CategoryID		TINYINT UNSIGNED NOT NULL,
	Duration		INT UNSIGNED NOT NULL,
	CreatorID		TINYINT UNSIGNED NOT NULL,
	CreatDate		DATE,
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountID)
);

-- CREATE TABLE ExamQuestion
CREATE TABLE ExamQuestion (
	ExamID 			TINYINT UNSIGNED NOT NULL,
	QuestionID		TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(ExamID) 		REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) 	REFERENCES Question(QuestionID),
    PRIMARY KEY(ExamID,QuestionID)
);


/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/

INSERT INTO Department  			(DepartmentName )
VALUES 								("Marketing" 	),
									("Sale"			),
									("Bảo vệ"		),
									("Nhân sự"		),
									("Kỹ thuật"		),
									("Tài chính"	),
									("Phó giám đốc"	),
									("Giám đốc"		),
									("Thư kí"		),
									("Bán hàng"		);

INSERT INTO `Position`				(PositionName	) 
VALUES 								('Dev'			),
									('Test'			),
									('Scrum Master'	),
									('PM'			); 

INSERT INTO `Account`				(Email								, Username			, FullName				, DepartmentID	, PositionID, CreatDate)
VALUES 								('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyễn hải Đăng'		,   '5'			,   '1'		,'2020-03-05'),
									('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,   '1'			,   '2'		,'2020-03-05'),
									('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
									('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
									('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
									('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
									('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
									('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
									('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
									('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

INSERT INTO `Group`					(  GroupName			, CreatorID		, CreatDate)
VALUES 								('Testing System'		,   5			,'2019-03-05'),
									('Development'			,   1			,'2020-03-07'),
									('VTI Sale 01'			,   2			,'2020-03-09'),
									('VTI Sale 02'			,   3			,'2020-03-10'),
									('VTI Sale 03'			,   4			,'2020-03-28'),
									('VTI Creator'			,   6			,'2020-04-06'),
									('VTI Marketing 01'		,   7			,'2020-04-07'),
									('Management'			,   8			,'2020-04-08'),
									('Chat with love'		,   9			,'2020-04-09'),
									('Vi Ti Ai'				,   10			,'2020-04-10');

INSERT INTO `GroupAccount`			(  GroupID	, AccountID	, JoinDate	 )
VALUES 								(	1		,    1		,'2019-03-05'),
									(	1		,    2		,'2020-03-07'),
									(	3		,    3		,'2020-03-09'),
									(	3		,    4		,'2020-03-10'),
									(	5		,    5		,'2020-03-28'),
									(	1		,    3		,'2020-04-06'),
									(	1		,    7		,'2020-04-07'),
									(	8		,    3		,'2020-04-08'),
									(	1		,    9		,'2020-04-09'),
									(	10		,    10		,'2020-04-10');

INSERT INTO TypeQuestion			(TypeName			) 
VALUES 								('Essay'			), 
									('Multiple-Choice'	); 

INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);

INSERT INTO Question				(Content			, CategoryID, TypeID		, CreatorID	, CreatDate )
VALUES 								('Câu hỏi về Java' 	,	1		,   '1'			,   '2'		,'2020-04-05'),
									('Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
									('Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
									('Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
									('Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
									('Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
									('Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
									('Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
									('Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
									('Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

INSERT INTO Answer					(  Content		, QuestionID	, isCorrect	)
VALUES 								('Trả lời 01'	,   1			,	0		),
									('Trả lời 02'	,   1			,	1		),
									('Trả lời 03'	,   1			,	0		),
									('Trả lời 04'	,   1			,	1		),
									('Trả lời 05'	,   2			,	1		),
									('Trả lời 06'	,   3			,	1		),
									('Trả lời 07'	,   4			,	0		),
									('Trả lời 08'	,   8			,	0		),
									('Trả lời 09'	,   9			,	1		),
									('Trả lời 10'	,   10			,	1		);
                    
INSERT INTO Exam					(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreatDate )
VALUES 								('VTIQ001'		, 'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
									('VTIQ002'		, 'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
									('VTIQ003'		, 'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
									('VTIQ004'		, 'Đề thi Java'			,	6			,	60		,   '3'			,'2020-04-08'),
									('VTIQ005'		, 'Đề thi Ruby'			,	5			,	120		,   '4'			,'2020-04-10'),
									('VTIQ006'		, 'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
									('VTIQ007'		, 'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
									('VTIQ008'		, 'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
									('VTIQ009'		, 'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
									('VTIQ010'		, 'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
INSERT INTO ExamQuestion			(ExamID	, QuestionID	) 
VALUES 								(	1	,		5		),
									(	2	,		10		), 
									(	3	,		4		), 
									(	4	,		3		), 
									(	5	,		7		), 
									(	6	,		10		), 
									(	7	,		2		), 
									(	8	,		10		), 
									(	9	,		9		), 
									(	10	,		8		); 

/*================================ QUERY DATABASE =============================*/
/*======================================================================================*/
-- Question2: lấy ra tất cả các phòng ban

SELECT 		* 
FROM 		Department;

-- Question 3: lấy ra id của phòng ban "Sale"

SELECT 		DepartmentID, DepartmentName
FROM 		Department
WHERE 		DepartmentName = "sale";

-- Question 4: lấy ra thông tin account có full name dài nhất

SELECT 		Fullname, length(Fullname) `COUNT` 
FROM 		`Account`
WHERE 		length(Fullname) = (SELECT MAX(length(Fullname)) FROM `Account`) ;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

SELECT 		*, length(Fullname) 
FROM 		`Account`
WHERE 		DepartmentID = 3
HAVING 		length(Fullname) = (SELECT MAX(length(Fullname)));

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

SELECT 		GroupName, Creatdate 
FROM 		`Group`
WHERE 		Creatdate < 2010/12/20;

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT 		QuestionID 
FROM 		`Answer`
GROUP BY 	QuestionID
HAVING 		Count(QuestionID) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT 		ExamID
FROM		Exam
WHERE 		Duration >= 60
GROUP BY 	Creatdate
HAVING 		Creatdate > 20/12/2019;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất

SELECT 		* 
FROM 		`Group`
ORDER BY 	Creatdate DESC 
LIMIT 		5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT 		COUNT(AccountID)
FROM 		`account`
WHERE		departmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT 		Fullname
FROM		`Account`
WHERE		Fullname like "D%" "%O";

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

DELETE FROM 	exam
WHERE 			Creatdate < 20/12/2019;

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"

DELETE FROM		question
WHERE			Content like "câu hỏi%";



