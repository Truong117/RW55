DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

CREATE TABLE Department(
	department_ID		INT PRIMARY KEY AUTO_INCREMENT,
	department_name		VARCHAR(30) NOT NULL
);
INSERT INTO Department(department_name )
VALUES	('Maketting'),
		('Sale'),
		('Bảo vệ'),
		('Nhân sự'),
		('Kỹ thuật');


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
    department_ID	INT,
    position_ID		INT,
    create_date		DATETIME NOT NULL,
	CONSTRAINT fk_account_department FOREIGN KEY (department_ID) REFERENCES department (department_ID),
	CONSTRAINT fk_account_position FOREIGN KEY (position_ID) REFERENCES position (position_ID)
);

INSERT INTO `account` (email, user_name, full_name, department_ID, position_ID, create_date)
VALUES	('truongdo117@gmail.com', 'Tristan', 'Đỗ Quang Trường', 4, 1, '2022-08-02 20:57:13');
		

CREATE TABLE `Group` (
	group_ID		INT PRIMARY KEY AUTO_INCREMENT,
    group_name		VARCHAR(30) NOT NULL,
    creator_ID		INT NOT NULL,
    create_date		DATETIME NOT NULL,
	CONSTRAINT fk_group_account FOREIGN KEY (creator_ID) REFERENCES `account` (account_ID)

);


CREATE TABLE GroupAccount(
	group_ID 		INT,
    account_ID		INT PRIMARY KEY,
    join_date		DATETIME NOT NULL,
    CONSTRAINT fk_GroupAccount_group FOREIGN KEY (group_ID) REFERENCES `Group` (group_ID),
    CONSTRAINT fk_GroupAccount_account FOREIGN KEY (account_ID) REFERENCES `account` (account_ID)
    
);

CREATE TABLE TypeQuestion(
	type_ID			INT PRIMARY KEY AUTO_INCREMENT,
    type_name		ENUM('Essay', 'Multiple-Choice')
);


CREATE TABLE CategoryQuestion(
	category_ID		INT PRIMARY KEY AUTO_INCREMENT,
    category_name	VARCHAR(50) 
);

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


CREATE TABLE Answer(
	answer_ID		INT PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(200) NOT NULL,
    question_ID		INT,
    iscorrect		VARCHAR(20) NOT NULL,
	CONSTRAINT fk_Answer_question FOREIGN KEY (question_ID) REFERENCES QUESTION (question_ID)

);

CREATE TABLE Exam (
	exam_ID		INT PRIMARY KEY AUTO_INCREMENT,
    `code`		INT NOT NULL,
    title		VARCHAR(100),
    category_ID	INT ,
    duration	INT NOT NULL,
    creator_ID	INT ,
    create_date	DATETIME NOT NULL,
	CONSTRAINT fk_Exam_CategoryQuestion FOREIGN KEY (category_ID) REFERENCES CategoryQuestion (category_ID),
	CONSTRAINT fk_Exam_account FOREIGN KEY (creator_ID) REFERENCES `account` (account_ID)
	
);

CREATE TABLE ExamQuestions (
	exam_ID		INT,	
    question_ID	INT,
	CONSTRAINT fk_ExamQuestion_exam FOREIGN KEY (exam_ID) REFERENCES Exam (exam_ID),
	CONSTRAINT fk_ExamQuestion_question FOREIGN KEY (question_ID) REFERENCES Question (question_ID)

);