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

INSERT INTO students (name, email) VALUES (%s, %s);

UPDATE students SET name = %s, email = %s WHERE id = %s;

DELETE FROM students WHERE name = %s;

SELECT * FROM students;

