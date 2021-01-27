USE testing_system;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT 		* 
FROM 		`Account` a
JOIN 		Department d 
ON 			a.DepartmentID = d.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010

SELECT 		* 
FROM 		`Account` a 
JOIN 		Department d
ON 			a.DepartmentID = d.DepartmentID
WHERE		Creatdate > 20/12/2010;

-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT 		* 
FROM 		`Account` a
JOIN		`Position` p
ON 			a.PositionID = p.PositionID
WHERE 		p.PositionID = 1;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên

SELECT 		D.DepartmentID, D.DepartmentName, COUNT(A.DepartmentID) AS 'SO LUONG'
FROM 		`Account` A 
INNER JOIN 	Department  D ON D.DepartmentID = A.DepartmentID
GROUP BY 	A.DepartmentID
HAVING 		COUNT(A.DepartmentID) < 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT  * FROM exam;
SELECT 	* FROM examquestion;

SELECT 		*
FROM 		question q
Join		examquestion eq
on			q.QuestionID = eq.QuestionID
GROUP BY	q.Content
HAVING		count(q.QuestionID) = (SELECT	MAX(CountQ)
								   FROM		
										(SELECT 		COUNT(Q.QuestionID) AS CountQ
										FROM			ExamQuestion EQ 
										INNER JOIN 		Question Q ON EQ.QuestionID = Q.QuestionID
										GROUP BY		Q.QuestionID) AS MaxContent);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT 		cate.CategoryID, CategoryName,COUNT(CategoryName) as "SO LUONG"
FROM		categoryquestion cate
LEFT JOIN	question q
on			cate.CategoryID = q.CategoryID
GROUP BY	CategoryName
ORDER BY	Cate.CategoryID ASC;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT * FROM examquestion;

SELECT 		q.QuestionID, q.content, count(eq.QuestionID) as "so luong"
From 		Question q
left join	examquestion eq
on 			eq.questionid = q.questionid
group by 	q.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT * FROM answer;

SELECT 		q.questionID, q.Content, COUNT(a.QuestionID) AS 'So luong'
FROM		Question q
LEFT JOIN 	answer a 
ON 			a.QuestionID = q.QuestionID
GROUP BY 	q.QuestionID
HAVING 		COUNT(a.QuestionID) = (SELECT MAX(countq)
								   FROM 		(SELECT 	COUNT(a.QuestionID) AS countq
												FROM 		answer a
												RIGHT JOIN question q ON a.QuestionID = q.QuestionID
												GROUP BY a.QuestionID) AS MaxCountQ);

-- Question 9: Thống kê số lượng account trong mỗi group

SELECT * FROM `groupaccount`;

SELECT DISTINCT 	g.GroupID,g.Groupname, count(ga.AccountID) as "So luong"
FROM				`Group` g
LEFT JOIN			groupaccount ga
ON					ga.GroupID = g.GroupID
GROUP BY			g.GroupID
ORDER BY			g.GroupID ASC;

-- Question 10: Tìm chức vụ có ít người nhất

SELECT				p.PositionID, p.PositionName, count(accountid) as "so luong"
FROM				`position` p
LEFT JOIN			 `account` a
ON					a.PositionID = p.PositionID
GROUP BY			p.PositionID
HAVING				count(AccountID) = (SELECT Min(countp)
										FROM 		(SELECT 	COUNT(p.PositionID) AS countp
													FROM 		`position` P
													LEFT JOIN 	`account` a
                                                    ON 			a.PositionID = p.PositionID
													GROUP BY	p.PositionID) AS MinCountp);
                                                    
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT 
    t1.DepartmentID,
    t1.PositionID,
    IF((t2.number_of_account IS NULL),
        0,
        t2.number_of_account) AS number_of_account
FROM
    (SELECT 
        d.DepartmentID, p.PositionID
    FROM
        department d
    CROSS JOIN `position` p
    WHERE
        p.positionname IN ('Developer' , 'Tester', 'Scrum Master', 'Project Manager')
    ORDER BY d.DepartmentID , p.PositionID) AS t1
        LEFT JOIN
    (SELECT 
        d.DepartmentID,
            p.PositionID,
            COUNT(a.AccountID) AS number_of_account
    FROM
        position p
    LEFT JOIN `account` a ON p.PositionID = a.PositionID
    RIGHT JOIN department d ON a.DepartmentID = d.DepartmentID
    WHERE
        p.PositionName IN ('Developer' , 'Tester', 'Scrum Master', 'Project Manager')
    GROUP BY d.DepartmentID , p.PositionID) AS t2 ON t1.DepartmentID = t2.DepartmentID
        AND t1.PositionID = t2.PositionID
GROUP BY t1.DepartmentID , t1.PositionID
ORDER BY t1.DepartmentID , t1.PositionID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

SELECT * FROM question;

SELECT DISTINCT	q.QuestionID, q.Content, q.CreatorID, tq.TypeName, a.Content, q.CreatDate
FROM 			question q
RIGHT JOIN 		typequestion tq
ON				tq.TypeID = q.TypeID
LEFT JOIN		answer a
ON				a.questionID = q.QuestionID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT * FROM 	typequestion;

SELECT 			tq.TypeName, COUNT(tq.TypeName) as "so luong"
FROM			question q
INNER JOIN		typequestion tq
ON				tq.TypeID = q.TypeID
GROUP BY		tq.TypeID;

-- Question 14:Lấy ra group không có account nào

SELECT * FROM groupaccount;

SELECT			groupname, ga.AccountID
From			`group` g
LEFT join		`groupaccount` ga
on				ga.GroupID = g.GroupID
where			ga.AccountID is null;

-- Question 15: Lấy ra group không có account nào
-- Question 16: Lấy ra question không có answer nào (Xem lai)

SELECT			*
FROM			question
WHERE			QuestionID NOt IN (SELECT		QuestionID
									 FROM		answer);

