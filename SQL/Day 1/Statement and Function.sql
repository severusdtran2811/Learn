USE deesev;

-- SELECT + SELECT DISTINCT --
SELECT * FROM `group`;
SELECT * FROM accounts where department_id = 2 Order by account_id asc;
SELECT * FROM accounts order by account_id asc;
SELECT DISTINCT department_id from accounts;

-- IN + NOT IN --
SELECT * FROM accounts
WHERE department_id IN (2,3,5);

SELECT * FROM accounts
WHERE department_id NOT IN (2,3,5);

-- BETWEEN AND --
SELECT * FROM accounts
WHERE age BETWEEN 20 AND 23;

-- LIKE --
SELECT * FROM accounts
WHERE fullname LIKE 'D%';

-- ORDER BY --
SELECT * FROM accounts
ORDER BY account_id;

SELECT * FROM accounts
ORDER BY username;

-- LIMIT --
SELECT * FROM accounts ORDER BY account_id DESC LIMIT 5 ;

-- COUNT() NOW(): Hàm, aggregate function, phương thức -- 
SELECT COUNT(*) FROM accounts;
SELECT NOW();
SELECT COUNT(1) FROM accounts;

-- SUM() --
CREATE TABLE Student (
	student_id INT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    subjects VARCHAR(30) NOT NULL,
    points  TINYINT NOT NULL
);

INSERT INTO Student(student_id, student_name, subjects, points)
VALUES	(1, 'Julian Peterson', 'Python', '2'),
		(2, 'Tanjiro Kamado', 'Java', '10'),
        (3, 'Monkey D Luffy', 'MySQL', '10'),
        (4, 'Gregory House', 'Ruby', '9'),
        (5, 'Saitama', 'Java', '2'),
		(6, 'Kanao Shineru', 'Python', '5'),
        (7, 'Lucifer Morningstar', 'Ruby', '6'),
        (8, 'Henry Marks', 'MySQL', '4'),
        (9, 'Jerry Smith', 'MySQL', '1');

SELECT * FROM Student;
SELECT SUM(points) FROM Student;
SELECT MIN(points) FROM Student;
SELECT MAX(points) FROM Student;
SELECT AVG(points) FROM Student;

-- LẤY RA DANH SÁCH HỌC VIÊN HỌC MÔN MYSQL --
SELECT * FROM Student
WHERE subjects = 'MySQL';
-- LẤY RA DANH SÁCH HỌC VIÊN HỌC MÔN PYTHON --
SELECT * FROM Student
WHERE subjects = 'Python';
-- LẤY RA DANH SÁCH HỌC VIÊN HỌC MÔN RUBY --
SELECT * FROM Student
WHERE subjects = 'Ruby';
-- LẤY RA DANH SÁCH HỌC VIÊN HỌC MÔN JAVA --
SELECT * FROM Student
WHERE subjects = 'Java';

-- TÌM ĐIỂM SỐ LỚN NHẤT TRONG MÔN HỌC MYSQL --
SELECT subjects,MAX(points) FROM Student
WHERE subjects = 'MySQL';

-- TÌM ĐIỂM SỐ LỚN NHẤT TRONG MÔN HỌC JAVA --
SELECT subjects,MAX(points) FROM Student
WHERE subjects = 'JAVA';

-- TÌM ĐIỂM SỐ LỚN NHẤT TRONG MÔN HỌC PYTHON --
SELECT subjects,MAX(points) FROM Student
WHERE subjects = 'PYTHON';

-- TÌM ĐIỂM SỐ LỚN NHẤT TRONG MÔN HỌC RUBY --
SELECT subjects,MAX(points) FROM Student
WHERE subjects = 'RUBY';

-- AS hoặc không có chữ gì --
SELECT subjects AS MonHoc ,MAX(points) AS TongDiem FROM Student
WHERE subjects = 'RUBY';
SELECT subjects MonHoc ,MAX(points) TongDiem FROM Student
WHERE subjects = 'RUBY';

-- GROUP BY + HAVING --
-- TỔNG KẾT BẢNG KẾT QUẢ --
SELECT subjects Monhoc, Max(points) Tongdiem
FROM Student
GROUP BY subjects;

-- ĐẾM SỐ HỌC VIÊN TRONG MỖI MÔN HỌC --
SELECT Subjects Monhoc, count(student_id) Sohocvien
FROM Student
GROUP BY subjects;

-- ĐẾM SỐ HỌC VIÊN TRONG MỖI MÔN HỌC VÀ CHỈ IN RA MÔN HỌC CÓ SỐ LƯỢNG LỚN HƠN 3 --
SELECT Subjects Monhoc, count(student_id) Sohocvien
FROM Student
GROUP BY subjects
HAVING count(1) >= 3;

-- TỔNG KẾT ĐIỂM SỐ LỚN NHẤT CỦA MỖI HỌC VIÊN --
SELECT Student_name Hocvien , Max(points) Diemso
FROM Student
GROUP BY Student_name;

-- TỔNG KẾT SỐ HỌC VIÊN THEO SỐ ĐIỂM --
SELECT * FROM student;
SELECT points Diem, count(student_id) Sohocvien
FROM Student
GROUP BY points;

-- UPDATE HOẶC SỬA TRÊN GRID --
UPDATE student
SET points = 7
WHERE student_id = 2;

-- DELETE --
DELETE FROM Student WHERE Student_id = 8;
DELETE FROM Student WHERE subjects = 'MySQL';

-- JOIN --
SELECT * FROM accounts a
INNER JOIN department d ON a.department_id = d.department_id;

-- LẤY RA THÔNG TIN ACCOUNT CỦA NHÂN VIÊN TƯƠNG ỨNG VỚI TÊN PHÒNG BAN --
SELECT a.account_id, a.fullname, d.department_name, p.position_name FROM accounts a
INNER JOIN department d ON a.department_id = d.department_id
INNER JOIN position p ON a.position_id = p.position_id;

-- Question1 --
INSERT INTO Accounts(account_id, email, age, gender, username, fullname, department_id, position_id, createdate)
VALUES	(6, 'account6@gmail.com', 31, 'Male', 'Sunwukong', 'Lucky Simpson',3, 2, '2024-06-24'),
		(7, 'account7@gmail.com', 20, 'Male', 'mylovelypenis', 'Marvin Gale', 2, 2, '2024-06-24'),
        (8, 'account8@gmail.com', 19, 'Female', 'friendwithbenefit', 'Sarah Lewith', 4, 3, '2024-06-24'),
        (9, 'account9@gmail.com', 23, 'Female', 'dontkillmyvibe', 'Rachel Phillips', 5, 4, '2024-06-24'),
        (10, 'account10@gmail.com', 28, 'Male', 'colddaycoldnight', 'Jerome Jackson', 2, 5, '2024-06-24'),
		(11, 'account11@gmail.com', 22, '3rd', 'question11', 'Dee Mero', 1, 5, '2024-06-24'),
        (12, 'account12@gmail.com', 24, 'Female', 'unknown12', 'Mister Nobody', NULL, NULL, NULL);
INSERT INTO GroupAccount(group_id, account_id, join_date)
VALUES	(2, 6, '2024-06-24'),
		(3, 6, '2024-06-24'),
        (4, 7, '2024-06-24'),
        (5, 7, '2024-06-24'),
        (3, 7, '2024-06-24'),
        (1, 8, '2024-06-24'),
        (2, 8, '2024-06-24'),
        (3, 9, '2024-06-24'),
        (4, 9, '2024-06-24'),
        (2, 10, '2024-06-24'),
        (5, 10, '2024-06-24');

-- Question 2 --
SELECT * From Department;

-- Question 3 --
SELECT department_id From department where department_name = 'Sale';

-- Question 4 --
SELECT * FROM accounts
WHERE length(Fullname) = (SELECT MAX(length(Fullname)) FROM accounts);

SELECT length(username) FROM accounts;

SELECT * FROM accounts
WHERE length(username) = 10;

SELECT MAX(length(fullname))
FROM accounts;

-- Question 5 --
WITH dep3 AS (SELECT * FROM accounts WHERE department_id = 3)
SELECT * FROM dep3
WHERE Length(fullname) = (SELECT MAX(length(fullname)) FROM dep3);

-- Question 6 --
SELECT group_name from `group` where create_date < '2019-12-20';

-- Question 7 --
SELECT * FROM answer;
SELECT question_id, count(question_id)  FROM answer
GROUP BY Question_id
HAVING count(question_id) >= 4;

-- Question 8 --
SELECT exam_code from exam where duration >= '001:59:59' and create_date >= '2024-06-24';

-- Question 9 --
SELECT * FROM `group` ORDER BY create_date DESC
LIMIT 5;

-- Question 10 --
SELECT * FROM accounts;
SELECT COUNT(account_id) FROM accounts
WHERE department_id = 2;

-- Question 11 --
SELECT fullname from accounts where fullname Like 'D%' '%o';

-- Question 12 --
DELETE FROM exam WHERE create_date <= '2010-12-20';

-- Question 13 --
DELETE FROM question WHERE content LIKE '%câu hỏi';

-- Question 14 --
SELECT * FROM accounts;
UPDATE accounts
SET fullname = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;

-- Question 15 --
SELECT * FROM GroupAccount;
UPDATE GroupAccount
SET group_id = 4
WHERE account_id = 5;