DROP DATABASE IF EXISTS Final_Exam_Javacore;
CREATE DATABASE IF NOT EXISTS Final_Exam_Javacore;
USE Final_Exam_Javacore;
-- CREAT TABLE -- 

DROP TABLE IF EXISTS Candidate;
CREATE TABLE Candidate (
	id 				int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstName 		VARCHAR(30) NOT NULL,
    lastName 		VARCHAR(30) NOT NULL,
    phone			VARCHAR(30) NOT NULL UNIQUE,
    email 			VARCHAR(50) NOT NULL UNIQUE,
    `password`		VARCHAR(30) NOT NULL,
    `role` 			ENUM("ExperienceCandidate","FresherCandidate"),
    ExpInYear		TINYINT UNSIGNED ,
    ProSkill		VARCHAR(30),
    GraduationRank	VARCHAR(30)
);

-- INSERT DATA --
INSERT INTO  Candidate 	(firstName   ,lastName			, phone			,email						,	`password`		,`role`					, ExpInYear, ProSkill	,GraduationRank	)
VALUES					("Tiến "	 , "Nguyễn Thanh"	, "0363183780"	,"ngthanhtien@gmail.com	"	, 	"Ngyen@123"		,"ExperienceCandidate"	,    3		, 	"Java"	,		null	),
						(" Nam 	"	 ,	"Nguyễn Văn"	, "0232233223"	,"ngvannam@gmail.com	"	, 	"Ngyen@123"		,"FresherCandidate"		,	null	,	null	,   "excellent" ),
						(" Đức	"	 , 	"Nguyễn Văn"	, "0938383382"	,"ngvanduc@gmail.com	"	, 	"Ngyen@123"		,"ExperienceCandidate"	,	 5		,	'DEV'	,		null	),
						(" Chiến "	 , 	"Đỗ Đức"		, "0373737292"	,"doducchien@gmail.com	"	,  "Ngyen@123"		,"FresherCandidate"		,	null	,	null	,	 "great"	),
						(" Hiếu "	 , 	"Nguyễn Văn "	, "0888857575"	,"ngvanhieu@gmail.com	"	,	"Ngyen@123"		,"FresherCandidate"		,	null	,	null	,	"excellent"	),
						(" Anh "	 , 	"Trần Thị Minh"	, "0384376474"	,"minmin0702@gmail.com	"	, 	"Ngyen@123"		,"ExperienceCandidate"	,    5		, 	"TEST"	,		null	),
						(" Nghị "	 , 	"Lê Thanh"		, "0392929224"	,"lethanhnghi@gmail.com	"	, 	"Ngyen@123"		,"FresherCandidate"		,	null	,	null	, 	 "great"	),
						(" Phương"	 , 	"Nguyễn Minh"	, "0302030230"	,"ngminhphuong@gmail.com"	, 	"Ngyen@123"		,"FresherCandidate"		,	null	,	null	,	"excellent"	),
						(" Trọng "	 , 	"Trần Đình"		, "0202002022"	,"trdinhtrong@gmail.com" 	, 	"Ngyen@123"		,"FresherCandidate"		,	null	,	null	,	"excellent"	),
						(" Giang"	 ,	"Nguyễn Hoàng"	, "0938383838"	,"nghoanggiang@gmail.com"	, 	"Ngyen@123"		,"ExperienceCandidate"	,    3		, 	"SQL"	,		null	)