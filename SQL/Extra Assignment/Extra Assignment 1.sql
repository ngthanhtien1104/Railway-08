USE testing_system;

-- Question 1
SELECT * 
FROM `Account` a
JOIN Department d 
ON a.DepartmentID = d.DepartmentID;

-- Question 2
SELECT * FROM `Account` 
HAVING CreatDate > 20/12/2010;

-- Question 3
SELECT * FROM `Account` a
JOIN `Position` p 
ON a.PositionID = p.PositionID 
HAVING p.PositionName = "Dev";

-- Question 4

SELECT PositionName FROM `Position`p
JOIN `Account` a 
ON p.PositionName = a.PositionID
HAVING  > 3;

SELECT * from `group`;