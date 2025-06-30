USE EcommerceDB;

CREATE TABLE Vendors (
    vendor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

ALTER TABLE Orders
ADD COLUMN vendor_id INT,
ADD FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id);

INSERT INTO Vendors (name, country) VALUES
('Amazon', 'USA'),
('Flipkart', 'India'),
('Alibaba', 'China');

UPDATE Orders SET vendor_id = 1 WHERE order_id = 201;
UPDATE Orders SET vendor_id = 2 WHERE order_id = 202;
UPDATE Orders SET vendor_id = 3 WHERE order_id = 203;

-- INNER JOIN:
SELECT o.order_id, v.name AS vendor
FROM Orders o
INNER JOIN Vendors v ON o.vendor_id = v.vendor_id;

-- LEFT JOIN:
SELECT o.order_id, v.name AS vendor
FROM Orders o
LEFT JOIN Vendors v ON o.vendor_id = v.vendor_id;

-- RIGHT JOIN:
SELECT o.order_id, v.name AS vendor
FROM Orders o
RIGHT JOIN Vendors v ON o.vendor_id = v.vendor_id;

-- FULL OUTER JOIN:
SELECT o.order_id, v.name AS vendor
FROM Orders o
LEFT JOIN Vendors v ON o.vendor_id = v.vendor_id
UNION
SELECT o.order_id, v.name AS vendor
FROM Orders o
RIGHT JOIN Vendors v ON o.vendor_id = v.vendor_id;
