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

INSERT INTO students (name, email) VALUES ('p_name', 'p_email');

SELECT * FROM students;

SELECT * FROM students WHERE id = p_id;

UPDATE students SET name = 'p_name', email = 'p_email' WHERE id = p_id;

DELETE FROM students WHERE id = p_id;
