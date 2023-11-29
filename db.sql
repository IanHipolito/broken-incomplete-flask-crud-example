CREATE USER 'A'@'%' IDENTIFIED BY 'B';
GRANT ALL PRIVILEGES ON *.* to 'A'@'%';

CREATE DATABASE student;
USE student;

CREATE TABLE students (
    studentID INT NOT NULL AUTOINCREMENT,
    studentName VARCHAR(255),
    course VARCHAR(255),
    year INT,
    PRIMARY KEY(studentID)
);

INSERT INTO students (studentName, course, year) VALUES (p_studentName, p_course, p_year);

SELECT * FROM students;

SELECT * FROM students WHERE studentID = p_studentID;

UPDATE students SET studentName = p_studentName, course = p_course, year = p_year WHERE studentID = p_studentID;

DELETE FROM students WHERE studentID = p_studentID;



