USE testing_system;

-- Question 1: 	Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

DELIMITER $$
CREATE TRIGGER 		log_in
BEFORE INSERT 
	ON				`group`
FOR EACH ROW
	BEGIN	
		SELECT		Creatdate
        FROM		`group`
        WHERE		Creatdate (yeah(Now) - yeah(creatdate) >= 1);
	END $$
    
DELIMITER ;
	
