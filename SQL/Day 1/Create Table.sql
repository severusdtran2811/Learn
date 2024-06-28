CREATE DATABASE Deesev;
USE Deesev;

CREATE TABLE Department (
	department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL
);

CREATE TABLE `Position` (
	position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(20) NOT NULL
);

CREATE TABLE Accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(30) NOT NULL,
    age TINYINT UNSIGNED NOT NULL,
    gender ENUM('Male','Female','3rd') NOT NULL,
    username VARCHAR(30) NOT NULL,
    fullname VARCHAR(30) NOT NULL,
    department_id INT,
    position_id INT,
    createdate DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (position_id) REFERENCES `Position`(position_id)
);

CREATE TABLE `Group` (
	group_id INT AUTO_INCREMENT PRIMARY KEY,
	group_name VARCHAR(20) NOT NULL,
	creator_id INT NOT NULL,
    create_date DATE NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES Accounts(account_id)
);

CREATE TABLE GroupAccount (
	group_id INT,
    account_id INT NOT NULL,
    join_date DATE NOT NULL,
    FOREIGN KEY (group_id) REFERENCES `Group`(group_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE TypeQuestion (
	type_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(20) NOT NULL
);

CREATE TABLE CategoryQuestion (
	category_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL
);

CREATE TABLE Question (
	question_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(100) NOT NULL,
    category_id TINYINT NOT NULL,
    type_id TINYINT NOT NULL,
    creator_id INT NOT NULL,
    create_date DATE NOT NULL,
    FOREIGN KEY (category_id) REFERENCES CategoryQuestion(category_id),
    FOREIGN KEY (type_id) REFERENCES TypeQuestion(type_id),
    FOREIGN KEY (creator_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Answer (
	answer_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR (100) NOT NULL,
    question_id INT NOT NULL,
    isCorrect ENUM ('True', 'False') NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

CREATE TABLE Exam (
	exam_ID INT AUTO_INCREMENT PRIMARY KEY,
    exam_code TINYINT NOT NULL,
    exam_title VARCHAR(20) NOT NULL,
    category_id TINYINT NOT NULL,
    duration TIME NOT NULL,
    creator_id INT NOT NULL,
    create_date DATE NOT NULL,
    FOREIGN KEY (category_id) REFERENCES CategoryQuestion(category_id),
    FOREIGN KEY (creator_id) REFERENCES Accounts(account_id)
);

CREATE TABLE ExamQuestion (
	exam_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

INSERT INTO Department(department_id, department_name)
VALUES 	(1, 'CEO'),
		(2, 'Sale'),
        (3, 'Security'),
        (4, 'Human Resoures'),
        (5, 'Marketing');

INSERT INTO `Position`(position_id, position_name)
VALUES	(1, 'Chief Department'),
		(2, 'Manager'),
        (3, 'Team Leader'),
        (4, 'Worker'),
        (5, 'Intern');

INSERT INTO Accounts(account_id, email, age, gender, username, fullname, department_id, position_id, createdate)
VALUES	(1, 'account1@gmail.com', 29, 'Male', 'iamtheboss2811', 'Tran Duc Duy', 1, 1, '2024-06-24'),
		(2, 'account2@gmail.com', 28, 'Male', 'mrhammer01', 'Thor Odinson', 3, 1, '2024-06-24'),
        (3, 'account3@gmail.com', 27, 'Female', 'Bigbooty', 'Madison Parson', 2, 1, '2024-06-24'),
        (4, 'account4@gmail.com', 26, 'Female', 'sluttypumpkin', 'Arona Flowers', 4, 1, '2024-06-24'),
        (5, 'account5@gmail.com', 25, '3rd', 'loveableperson', 'Tyrone Fists', 5, 1, '2024-06-24');

INSERT INTO `Group`(group_id, group_name, creator_id, create_date)
VALUES	(1, 'Awesomeness', 1, '2024-06-24'),
		(2, 'Nerdyness', 5, '2024-06-24'),
        (3, 'Naughtyness', 3, '2024-06-24'),
        (4, 'Mightyness', 2, '2024-06-24'),
        (5, 'Sexyness', 4, '2024-06-24');
        
INSERT INTO GroupAccount(group_id, account_id, join_date)
VALUES	(1, 1, '2024-06-24'),
		(1, 2, '2024-06-24'),
        (2, 5, '2024-06-24'),
        (2, 1, '2024-06-24'),
        (3, 3, '2024-06-24'),
        (3, 4, '2024-06-24'),
        (3, 1, '2024-06-24'),
        (4, 1, '2024-06-24'),
        (4, 2, '2024-06-24'),
        (5, 3, '2024-06-24'),
        (5, 4, '2024-06-24'),
        (5, 1, '2024-06-24');

INSERT INTO TypeQuestion(type_id, type_name)
VALUES	(1, 'Tricky'),
		(2, 'Knowledge'),
        (3, 'Easy Point');

INSERT INTO CategoryQuestion(category_id, category_name)
VALUES	(1, 'Politics'),
		(2, 'Demographic'),
        (3, 'Entertainment'),
        (4, 'Technicial Skills'),
        (5, 'Customer Insight');

INSERT INTO Question(question_id, content, category_id, type_id, creator_id, create_date)
VALUES 	(1, 'Who is the president of Russia?', 1, 2, 1, '2024-06-24'),
		(2, 'What is the population of Vietname in 2024?', 2, 2, 1, '2024-06-24'),
        (3, 'Who is the King of Pop music?', 3, 3, 1, '2024-06-24'),
        (4, 'How to write Uppercase Lettes?', 4, 3, 1, '2024-06-24'),
        (5, 'Which Social Platform have the most participant in 2024?', 5, 1, 1, '2024-06-24');

INSERT INTO Answer(answer_id, content, question_id, isCorrect)
VALUES	(1, 'Puttin in the Jar', 1, 'True'),
		(2, '93 millions people', 2, 'True'),
        (3, 'Micheal Jackson', 3, 'True'),
        (4, 'Shift + letter you want to write', 4, 'True'),
        (5, 'Tiktok', 5, 'True');

INSERT INTO Exam(exam_id, exam_code, exam_title, category_id, duration, creator_id, create_date)
VALUES	(1, 1, 'Proc1', 1, '001:59:59', 1, '2024-06-24'),
		(2, 2, 'Proc2', 2, '001:59:59', 1, '2024-06-24'),
        (3, 3, 'Proc3', 3, '001:59:59', 1, '2024-06-24'),
        (4, 4, 'Proc4', 4, '001:59:59', 1, '2024-06-24'),
        (5, 5, 'Proc5', 5, '001:59:59', 1, '2024-06-24');

INSERT INTO ExamQuestion(exam_id, question_id)
VALUES	(1, 1),
		(2, 2),
		(3, 3),
        (4, 4),
        (5, 5);