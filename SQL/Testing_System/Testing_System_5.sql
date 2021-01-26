USE testing_system;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale

CREATE OR REPLACE VIEW Account_sale  AS
SELECT		AccountID, Email, Username, Fullname, CreatDate, DepartmentName
FROM		`account` a
INNER JOIN	department d
ON			d.DepartmentID = a.DepartmentID
GROUP BY	d.DepartmentName
HAVING		d.DepartmentName = "sale";

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

CREATE OR REPLACE VIEW Account_maxgr  AS
SELECT		a.AccountID, Email, Username, Fullname, CreatDate, COUNT(ga.AccountID) as "so luong"
FROM		`account` a
LEFT JOIN	groupaccount ga
on 			ga.AccountID = a.AccountID
GROUP BY	ga.AccountID
HAVING		count(ga.AccountID) = (SELECT 		count(ga.AccountID)
								   FROM   		groupaccount ga
                                   inner join   `account` a
                                   on			a.AccountID = ga.AccountID
                                   GROUP BY		ga.AccountID 
                                   ORDER BY		COUNT(ga.AccountID) desc
                                   LIMIT 		1);

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi

CREATE OR REPLACE VIEW Ques_content  AS
Select	*
From 	question
WHERE	length(content) > 18;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

SELECT 		d.*, count(a.AccountID) 
FROM		department d
INNER JOIN `account` a
on 			a.DepartmentID = d.DepartmentID
GROUP BY	a.DepartmentID
HAVING		COUNT(a.AccountID) = (Select		a.*, count(a.AccountID)
								  FROM			`account` a 
                                  INNER JOIN	department d
                                  on 			d.deparmentID = a.DepartmentID
                                  GROUP BY		d.AccountID
                                  ORDER BY		count(a.AccountID) DESC
                                  LIMIT 		3);