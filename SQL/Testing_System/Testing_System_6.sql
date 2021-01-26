USE Testing_system;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DELIMITER $$
DROP PROCEDURE IF EXISTS get_account;
CREATE PROCEDURE get_account (IN in_department_name VARCHAR(50))
		BEGIN
			SELECT		A.Email, A.username, A.Fullname, A.creatdate
            FROM		department d
            INNER JOIN	`account` a
            ON			A.departmentid = d.departmentid
            WHERE		DepartmentName = in_department_name;
		END$$
DELIMITER $$ ;

CALL get_account ("sale");

-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DELIMITER $$
DROP PROCEDURE IF EXISTS get_account_group;
CREATE PROCEDURE get_account_group(in countaccount varchar (50))
		BEGIN
			SELECT  	g.Groupname, count(ga.AccountID) AS "SO LUONG" 
            FROM		`group` g
            LEFT JOIN	groupaccount ga
            ON			ga.GroupID = g.GroupID
            GROUP BY	g.Groupname;
		END$$
DELIMITER $$ ;

CALL get_account_group("Development");
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại	
DROP PROCEDURE IF EXISTS get_typeQuestion;
DELIMITER $$

CREATE PROCEDURE get_typeQuestion()
		BEGIN
			SELECT		COUNT(TypeID)
			FROM		Question
			WHERE		MONTH(CreatDate) = Month(NOW());
		END$$
DELIMITER ;

CALL get_account();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
                                         
DROP PROCEDURE IF EXISTS sp_TypeID_MaxQuestion;
DELIMITER $$
CREATE PROCEDURE sp_TypeID_MaxQuestion()
BEGIN

	WITH MAX_Count_TypeID AS(
		SELECT		COUNT(TypeID)
		FROM		Question 
		GROUP BY	TypeID
        ORDER BY	COUNT(TypeID) DESC
		LIMIT 		1)
    SELECT 		TypeID
    FROM		Question
    GROUP BY 	TypeID
    HAVING		COUNT(TypeID) = (SELECT * FROM MAX_Count_TypeID);	
	
END$$
DELIMITER ;

call sp_TypeID_MaxQuestion();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào

DROP PROCEDURE IF EXISTS insert_string;

DELIMITER $$

CREATE PROCEDURE 			insert_string(IN group_name VARCHAR (50) , type_resuilt ENUM(`Group`,"Username"))
	BEGIN	
        IF					type_resuilt = `Group` then
		SELECT				*
        FROM 				`Group`
        WHERE				Groupname like CONCAT('%', group_name , '%');
        ELSE				type_resuilt = "username"
        SELECT				username
        FROM				`account`
        WHERE				Username like concat('%', group_name, '%');
        END IF;
	END $$

DELIMITER ;
			
CALL insert_string("a", 2);

SELECT * From `group`;

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DROP PROCEDURE IF EXISTS insert_into_string;

DELIMITER $$

CREATE PROCEDURE 			insert_into_string(IN Fullname VARCHAR(50), Email VARCHAR(50))
	BEGIN		
    DECLARE Username VARCHAR(50) DEFAULT SUBSTRING_INDEX(email,'@',1);
    DECLARE PositionID TINYINT UNSIGNED DEFAULT 1;
    DECLARE DepartmentID TINYINT UNSIGNED DEFAULT 10;
    DECLARE CreatDate DATETIME DEFAULT NOW();
	
	INSERT INTO `Account` 	(Email		,Username, FullName		, DepartmentID,	PositionID,	CreatDate)
    VALUE					(email		,Username, fullName		, DepartmentID, PositionID, CreatDate);
	
    SELECT 	*
    FROM 	`Account`A
    WHERE	A.Username = Username;
	
END$$
DELIMITER ;

Call insert_into_string("thanhtien","thanhtien@gmail.com")

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice	để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS insert_typeques

DELIMITER $$

CREATE PROCEDURE			insert_typeques(IN type_question VARCHAR(50))
	BEGIN
		IF 					type_question = "Essay" then
        SELECT				* , max(length(content))
        FROM				question
        WHERE				TypeID = 1;
        ELSEIF				type_question = "Multiple-Choice" then
        SELECT				* , max(length(content))
        FROM				question
        WHERE				TypeID = 2;
        END IF;		
	END $$

DELIMITER ;

Call insert_typeques("Multiple-choice");

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DROP PROCEDURE IF EXISTS sp_DeleteExamWithID;
DELIMITER $$
CREATE PROCEDURE sp_DeleteExamWithID (IN in_ExamID TINYINT UNSIGNED)
BEGIN
	DELETE 	
    FROM 	Exam 
    WHERE	ExamID = in_ExamID;	
END$$
DELIMITER ;

-- Question 10 Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing

Drop PROCEDURE IF EXISTS Exam_Delete;

DELIMITER $$
CREATE PROCEDURE Exam_Delete (IN in_Exam_Create TINYINT)
BEGIN 
    Call Sp_DEleteExamWithID(SELECT 	 examID
							 FROM		 exam
							 WHERE 		 year(now()) - year(creatdate()) > 3)
                             
END$$

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và các account 
-- thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc

Drop PROCEDURE IF EXISTS insert_department;

DELIMITER $$
CREATE PROCEDURE insert_department (IN in_department VARCHAR(15))
Begin
	 DELETE 		
     FROM			department
     Where			departmentname = concat("%", in_department,"%");
END$$
DELIMITER ;