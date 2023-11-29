CREATE USER 'A'@'%' IDENTIFIED BY 'B';
GRANT ALL PRIVILEGES ON *.* TO 'A'@'%';

CREATE DATABASE student;
USE student;

CREATE TABLE students (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO students (studentName, email) VALUES (%s, %s);

UPDATE students SET studentName = %s, email = %s WHERE studentID = %s;

DELETE FROM students WHERE studentName = %s;

SELECT * FROM students;

