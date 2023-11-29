CREATE USER 'A'@'%' IDENTIFIED BY 'B';
GRANT ALL PRIVILEGES ON *.* TO 'A'@'%';

CREATE DATABASE student;
USE student;

CREATE TABLE students (
    studentID INT NOT NULL AUTO_INCREMENT,
    studentName VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (studentID)
);

INSERT INTO students (studentName, email) VALUES ('{studentName}', '{email}');

UPDATE students SET studentName = '{studentName}', email = '{email}' WHERE studentID = {studentID};

DELETE FROM students WHERE studentName = '{studentName}';

SELECT * FROM students;

