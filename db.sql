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

INSERT INTO students (studentName, email) VALUES (%s, %s);

UPDATE students SET studentName = %s, email = %s WHERE studentID = %s;

DELETE FROM students WHERE studentName = %s;

