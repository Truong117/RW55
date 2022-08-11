DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department(
	department_ID		INT PRIMARY KEY AUTO_INCREMENT,
	department_name		VARCHAR(30) NOT NULL
);
INSERT INTO Department(department_name )
VALUES	('Maketting'),
		('Sale'),
		('Bảo vệ'),
		('Nhân sự'),
		('Kỹ thuật'),
        ('Tài chính'),
        ('Giám đốc'),
        ('Thư kí'),
        ('No person'),
        ('Bán hàng');
       

CREATE TABLE position (
	position_ID		INT PRIMARY KEY AUTO_INCREMENT,
    position_name	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);
INSERT INTO position (position_name)
VALUES	('Dev'),
		('Test'),
		('Scrum Master'),
		('PM'),
		('Dev');


CREATE TABLE `account` (
	account_ID		INT PRIMARY KEY AUTO_INCREMENT,
    email			VARCHAR(255) NOT NULL,
    user_name		VARCHAR(100) NOT NULL,
	full_name		VARCHAR(200) NOT NULL,
    department_ID	INT NOT NULL,
    position_ID		INT NOT NULL,
    create_date		DATETIME NOT NULL,
	CONSTRAINT fk_account_department FOREIGN KEY (department_ID) REFERENCES department (department_ID),
	CONSTRAINT fk_account_position FOREIGN KEY (position_ID) REFERENCES position (position_ID)
);

INSERT INTO `account` (email, user_name, full_name, department_ID, position_ID, create_date)
VALUES	('truongdo117@gmail.com', 'Tristan', 'Đỗ Quang Trường', 4, 1, '2022-08-02 20:57:13'),
		('Email1@gmail.com' ,'Username1' ,'Fullname1' , 5 , 1, '2022-08-03 11:07:02'),
		('Email2@gmail.com' ,'Username2' ,'Fullname2' , 1 , 2, '2022-08-03 11:07:02'),
		('Email3@gmail.com' , 'Username3' ,'Fullname3', 2 , 2 , '2022-08-03 11:07:02'),
        ('Email4@gmail.com' , 'Username4' ,'Fullname4', 3 , 4 , '2022-08-03 11:07:02'),
        ('Email5@gmail.com' , 'Username5' ,'Fullname5', 4 , 4 , '2022-08-03 11:07:02'),
        ('Email6@gmail.com' , 'Username6' ,'Fullname6', 6 , 3 , '2022-08-03 11:07:02'),
        ('Email7@gmail.com' , 'Username7' ,'Fullname7', 2 , 2 , '2022-08-03 11:07:02' ),
        ('Email8@gmail.com' , 'Username8' ,'Fullname8', 8 , 1 , '2022-08-03 11:07:02'),
        ('Email10@gmail.com' , 'Username10' ,'Fullname10', 10 , 1 , '2022-08-03 11:07:02'),
        ('Email11@gmail.com' , 'Username11' ,'Fullname11', 10 , 1 , '2022-08-03 11:07:02'),
        ('Email12@gmail.com' , 'Username12','Fullname12' , 10 , 1 , '2022-08-03 11:07:02');


CREATE TABLE `Group` (
	group_ID		INT PRIMARY KEY AUTO_INCREMENT,
    group_name		VARCHAR(30) NOT NULL,
    creator_ID		INT NOT NULL,
    create_date		DATETIME NOT NULL,
	CONSTRAINT fk_group_account FOREIGN KEY (creator_ID) REFERENCES `account` (account_ID)

);
INSERT INTO `Group`(group_name , creator_ID , create_date)
VALUES 	('Testing System' , 1, '2022-08-03 11:07:02'),
		('Development' , 2, '2022-08-03 11:07:02'),
		('VTI Sale 01' , 3 , '2022-08-03 11:07:02'),
		('VTI Sale 02' , 4 , '2022-08-03 11:07:02'),
		('VTI Sale 03' , 5 , '2022-08-03 11:07:02'),
		('VTI Creator' , 6 , '2022-08-03 11:07:02'),
		('VTI Marketing 01' , 7 , '2022-08-03 11:07:02'),
		('VTI Marketing 02' , 8 , '2022-08-03 11:07:02'),
		('VTI Marketing 03' , 9 , '2022-08-03 11:07:02'),
        ('Management' , 10 , '2022-08-03 11:07:02');
		
        

CREATE TABLE GroupAccount(
	group_ID 		INT,
    account_ID		INT PRIMARY KEY,
    join_date		DATETIME NOT NULL,
    CONSTRAINT fk_GroupAccount_group FOREIGN KEY (group_ID) REFERENCES `Group` (group_ID),
    CONSTRAINT fk_GroupAccount_account FOREIGN KEY (account_ID) REFERENCES `account` (account_ID)
);
INSERT INTO `GroupAccount`(group_ID , account_ID , join_date)
VALUES 	(1 , 5, '2022-08-04 19:54:46'),
		(2 , 4, '2022-08-04 19:54:46'),
		(3 , 3, '2022-08-04 19:54:46'),
		(4 , 9, '2022-08-04 19:54:46'),
		(5 , 2, '2022-08-04 19:54:46'),
		(6 , 6, '2022-08-04 19:54:46'),
		(7 , 1, '2022-08-03 11:07:02'),
		(8 , 8, '2022-08-03 11:07:02'),
		(9 , 7, '2022-08-04 19:54:46'),
		(10, 10,'2022-08-04 19:54:46');


CREATE TABLE TypeQuestion(
	type_ID			INT PRIMARY KEY AUTO_INCREMENT,
    type_name		ENUM('Essay', 'Multiple-Choice')
);
INSERT INTO TypeQuestion ( type_name )
VALUES 	('Essay'),
		('Multiple-Choice');


CREATE TABLE CategoryQuestion(
	category_ID		INT PRIMARY KEY AUTO_INCREMENT,
    category_name	VARCHAR(50) 
);
INSERT INTO CategoryQuestion(category_name )
VALUES 	('Java'),
		('ASP.NET'),
		('ADO.NET'),
		('SQL'),
		('Postman'),
		('Ruby'),
		('Python'),
		('C++'),
		('C Sharp'),
		('PHP');




CREATE TABLE Question(
	question_ID		INT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(200) NOT NULL,
    category_ID		INT,
    type_ID			INT NOT NULL,
    creator_ID		INT NOT NULL,
    create_date		DATE NOT NULL,
	CONSTRAINT fk_Question_CategoryQuestion FOREIGN KEY (category_ID) REFERENCES CategoryQuestion (category_ID),
	CONSTRAINT fk_Question_TypeQuestion FOREIGN KEY (type_ID) REFERENCES TypeQuestion (type_ID),
	CONSTRAINT fk_question_account FOREIGN KEY (creator_ID) REFERENCES `account` (account_ID)	
);

INSERT INTO Question(Content , category_ID, type_ID , creator_ID, create_Date)
VALUES 	('Câu hỏi về Java' , 1 ,'1' , '2' ,'2022-08-05'),
		('Câu Hỏi về PHP' , 10 ,'2' , '2' ,'2022-08-05'),
		('Hỏi về C#' , 9 ,'2' , '3' ,'2022-08-05'),
		('Hỏi về Ruby' , 6 ,'1' , '4' ,'2022-08-05'),
		('Hỏi về Postman' , 5 ,'1' , '5' ,'2022-08-05'),
		('Hỏi về ADO.NET' , 3 ,'2' , '6' ,'2022-08-05'),
		('Hỏi về ASP.NET' , 2 ,'1' , '7' ,'2022-08-05'),
		('Hỏi về C++' , 8 ,'1' , '8' ,'2022-08-05'),
		('Hỏi về SQL' , 4 ,'2' , '9' ,'2022-08-05'),
		('Hỏi về Python' , 7 ,'1' , '10' ,'2022-08-05');


CREATE TABLE Answer(
	answer_ID		INT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(200) NOT NULL,
    question_ID		INT,
    isCorrect		VARCHAR(20) NOT NULL,
	CONSTRAINT fk_Answer_question FOREIGN KEY (question_ID) REFERENCES QUESTION (question_ID)
);
INSERT INTO Answer(content , question_ID , isCorrect)
VALUES 	('Trả lời 01' , 1 , 0),
		('Trả lời 02' , 1 , 1),
		('Trả lời 03', 1 , 0),
		('Trả lời 04', 1 , 1),
		('Trả lời 05', 2 , 1),
		('Trả lời 06', 3 , 1),
		('Trả lời 07', 4 , 0),
		('Trả lời 08', 8 , 0),
		('Trả lời 09', 9 , 1),
		('Trả lời 10', 10 , 1);


CREATE TABLE Exam (
	exam_ID		INT PRIMARY KEY AUTO_INCREMENT,
    `code`		CHAR(10) NOT NULL,
    title		VARCHAR(100),
    category_ID	INT ,
    duration	INT NOT NULL,
    creator_ID	INT ,
    create_date	DATETIME NOT NULL,
	CONSTRAINT fk_Exam_CategoryQuestion FOREIGN KEY (category_ID) REFERENCES CategoryQuestion (category_ID),
	CONSTRAINT fk_Exam_account FOREIGN KEY (creator_ID) REFERENCES `account` (account_ID)
);

INSERT INTO Exam (`code` , title , category_ID, duration , creator_ID , create_date )
VALUES 	('VTIQ001' , 'Đề thi C#' ,1 , 60 , '5' , '2016-08-06 13:54:46'),
		('VTIQ002' , 'Đề thi PHP' ,10 , 60 , '2' , '2022-08-06 12:54:46'),
		('VTIQ003' , 'Đề thi C++' , 9 ,120 , '2' , '2022-08-06 15:54:46'),
		('VTIQ004' , 'Đề thi Java' , 6 , 60, '3' , '2022-08-06 14:54:46'),
		('VTIQ005' , 'Đề thi Ruby' , 5 , 120, '4' , '2022-08-06 11:54:46'),
		('VTIQ006' , 'Đề thi Postman' , 3 ,60 , '6' , '2022-08-06 10:54:46'),
		('VTIQ007' , 'Đề thi SQL' , 2 ,60 , '7' , '2022-08-06 1:54:46'),
		('VTIQ008' , 'Đề thi Python' , 8 ,60 , '8' , '2022-08-06 8:54:46'),
		('VTIQ009' , 'Đề thi ADO.NET' , 4 ,90 , '9' , '2022-08-06 9:54:46'),
		('VTIQ010' , 'Đề thi ASP.NET' , 7 ,90 , '10' , '2022-08-06 16:54:46');


CREATE TABLE ExamQuestions (
	exam_ID		INT,	
    question_ID	INT,
	CONSTRAINT fk_ExamQuestion_exam FOREIGN KEY (exam_ID) REFERENCES Exam (exam_ID),
	CONSTRAINT fk_ExamQuestion_question FOREIGN KEY (question_ID) REFERENCES Question (question_ID)
);

INSERT INTO ExamQuestions(exam_ID , question_ID )
VALUES 	(1 , 5),
		(2 , 10),
		(3 , 4),
		(4 , 3),
		(5 , 7),
		(6 , 10),
		(7 , 2),
		(8 , 10),
		(9 , 9),
		(10 , 8);