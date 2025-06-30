USE LIBRARYDB2;

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

ALTER TABLE Books
ADD COLUMN publisher_id INT,
ADD FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id);

INSERT INTO Publishers (name, country) VALUES
('Penguin Random House', 'USA'),
('HarperCollins', 'UK'),
('Bloomsbury', 'UK');

UPDATE Books SET publisher_id = 3 WHERE book_id = 1; 
UPDATE Books SET publisher_id = 1 WHERE book_id = 2; 
UPDATE Books SET publisher_id = 2 WHERE book_id = 3; 

# INNER JOIN
SELECT b.title, p.name AS publisher
FROM Books b
INNER JOIN Publishers p ON b.publisher_id = p.publisher_id;

# LEFT JOIN
SELECT b.title, p.name AS publisher
FROM Books b
LEFT JOIN Publishers p ON b.publisher_id = p.publisher_id;

# RIGHT JOIN
SELECT b.title, p.name AS publisher
FROM Books b
RIGHT JOIN Publishers p ON b.publisher_id = p.publisher_id;

# FULL OUTER JOIN 
SELECT b.title, p.name AS publisher
FROM Books b
LEFT JOIN Publishers p ON b.publisher_id = p.publisher_id
UNION
SELECT b.title, p.name AS publisher
FROM Books b
RIGHT JOIN Publishers p ON b.publisher_id = p.publisher_id;



