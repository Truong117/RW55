CREATE DATABASE TestingSystem;
USE TestingSystem;

CREATE TABLE Department(
department_ID		INT,
department_name		VARCHAR(30)
);

CREATE TABLE position (
	position_ID		INT,
    position_name	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

CREATE TABLE `account` (
	account_ID		INT,
    email			VARCHAR(50),
    user_name		VARCHAR(50),
	full_name		VARCHAR(50),
    department_ID	INT,
    position_ID		INT,
    create_date		DATETIME
);

CREATE TABLE `	Group`(
	group_ID		INT,
    group_name		VARCHAR(30),
    creator_ID		INT,
    create_date		DATETIME
);

CREATE TABLE GroupAccount(
	group_ID 		INT,
    account_ID		INT,
    join_date		DATETIME
);
CREATE TABLE TypeQuestion(
	type_ID			INT,
    type_name		ENUM('Essay', 'Multiple-Choice')
);

CREATE TABLE CategoryQuestion(
	category_ID		INT,
    category_name	VARCHAR(50)
);

CREATE TABLE Question(
	question_ID		INT,
    content			VARCHAR(100),
    category_ID		INT,
    type_ID			INT,
    creator_ID		INT,
    create_date		DATE
);

CREATE TABLE Answer(
	answer_ID		INT,
    content			VARCHAR(200),
    question_ID		INT,
    iscorrect		VARCHAR(20)
);

CREATE TABLE Exam (
	exam_ID		INT,
    `code`		INT,
    title		VARCHAR(100),
    category_ID	INT,
    duration	INT,
    creator_ID	INT,
    create_date	DATETIME
);

CREATE TABLE ExamQuestions (
	exam_ID		INT,	
    question_ID	INT
);