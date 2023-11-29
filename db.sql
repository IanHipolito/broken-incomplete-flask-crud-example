CREATE USER 'A'@'%' IDENTIFIED BY 'B';
GRANT ALL PRIVILEGES ON *.* to 'A'@'%';

CREATE DATABASE student;
USE student;

CREATE TABLE students (
    studentID INT NOT NULL AUTO_INCREMENT,
    studentName VARCHAR(255),
    email VARCHAR(255),
    course VARCHAR(255),
    year INT,
    PRIMARY KEY(studentID)
);

DELIMITER //
CREATE PROCEDURE AddStudent(IN p_studentName VARCHAR(255), IN p_course VARCHAR(255), IN p_year INT)
BEGIN
    INSERT INTO students (studentName, course, year) VALUES (p_studentName, p_course, p_year);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM students;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetStudentByID(IN p_studentID INT)
BEGIN
    SELECT * FROM students WHERE studentID = p_studentID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStudent(IN p_studentID INT, IN p_studentName VARCHAR(255), IN p_course VARCHAR(255), IN p_year INT)
BEGIN
    UPDATE students SET studentName = p_studentName, course = p_course, year = p_year WHERE studentID = p_studentID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteStudent(IN p_studentID INT)
BEGIN
    DELETE FROM students WHERE studentID = p_studentID;
END //
DELIMITER ;


CALL AddStudent('John Doe', 'Computer Science', 2023);
CALL AddStudent('Jane Smith', 'Biology', 2022);

CALL GetAllStudents();

CALL GetStudentByID(1);

CALL UpdateStudent(1, 'John Updated', 'Mathematics', 2024);

CALL DeleteStudent(1);

