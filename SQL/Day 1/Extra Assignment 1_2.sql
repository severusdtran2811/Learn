-- Exercise 1 --
-- Question 1 --
CREATE TABLE Trainee (
	TraineeID INT PRIMARY KEY,
	Full_name VARCHAR(30) UNIQUE KEY NOT NULL,
    Birth_date DATE NOT NULL,
    Gender ENUM('Male','Female','3rd') NOT NULL,
    ET_IQ DECIMAL(20,0) NOT NULL,
    ET_Gmath DECIMAL(20,0) NOT NULL,
    ET_English DECIMAL(20,0) NOT NULL,
    Training_class VARCHAR(30) NOT NULL,
    Evaluation_notes VARCHAR(50)
    );
    
-- Question 2 --
SELECT * FROM Trainee;
ALTER TABLE Trainee
ADD VTI_Account VARCHAR(20) NOT NULL UNIQUE KEY;

-- Exercise 2 --
CREATE TABLE Exercise2 (
	Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Item_name VARCHAR(30),
    Item_Code CHAR(5),
    Modified_date DATE
    );

-- Exercise 3 --
CREATE TABLE Exercise3 (
	Hero_ID INT AUTO_INCREMENT PRIMARY KEY,
    Hero_name VARCHAR(30),
    Birth_date DATE,
    Gender ENUM('Male','Female','3rd'),
    IsDeletedFlag BOOL
    );
    