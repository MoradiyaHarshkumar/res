-- Practical Assignment 3 SQL Queries
-- Common MVC project database.
-- Delete is soft delete: records are hidden from screen, not physically removed.

CREATE DATABASE IF NOT EXISTS practical_assignment_3;
USE practical_assignment_3;

DROP TABLE IF EXISTS students;
CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  course VARCHAR(100) NOT NULL,
  semester INT NOT NULL,
  contact_no VARCHAR(15) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_deleted TINYINT(1) NOT NULL DEFAULT 0
);

INSERT INTO students (name, email, course, semester, contact_no) VALUES
('Amit Patel', 'amit@example.com', 'MSc IT', 2, '9876543210'),
('Riya Shah', 'riya@example.com', 'MCA', 4, '9876543211'),
('Karan Mehta', 'karan@example.com', 'BSc IT', 6, '9876543212');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_deleted TINYINT(1) NOT NULL DEFAULT 0
);

INSERT INTO products (product_name, category, price, quantity) VALUES
('Keyboard', 'Electronics', 700.00, 15),
('Notebook', 'Stationery', 50.00, 100),
('Mouse', 'Electronics', 450.00, 25);

-- Student queries
-- INSERT INTO students (name, email, course, semester, contact_no)
-- VALUES ('Student Name', 'student@example.com', 'Course', 2, '9999999999');

-- SELECT * FROM students WHERE is_deleted = 0;

-- UPDATE students
-- SET name = 'Updated Name', email = 'updated@example.com',
--     course = 'Updated Course', semester = 3, contact_no = '8888888888'
-- WHERE id = 1;

-- Soft delete student
-- UPDATE students SET is_deleted = 1 WHERE id = 1;

-- SELECT * FROM students
-- WHERE is_deleted = 0
-- AND (name LIKE '%keyword%' OR email LIKE '%keyword%' OR course LIKE '%keyword%');

-- SELECT * FROM students WHERE is_deleted = 0 ORDER BY name ASC;
-- SELECT * FROM students WHERE is_deleted = 0 ORDER BY name DESC;
-- SELECT * FROM students WHERE is_deleted = 0 ORDER BY course ASC;
-- SELECT * FROM students WHERE is_deleted = 0 ORDER BY semester ASC;

-- Product queries
-- INSERT INTO products (product_name, category, price, quantity)
-- VALUES ('Product Name', 'Category', 100.00, 10);

-- SELECT * FROM products WHERE is_deleted = 0;

-- UPDATE products
-- SET product_name = 'Updated Product', category = 'Updated Category',
--     price = 150.00, quantity = 20
-- WHERE id = 1;

-- Soft delete product
-- UPDATE products SET is_deleted = 1 WHERE id = 1;

-- SELECT * FROM products
-- WHERE is_deleted = 0
-- AND (product_name LIKE '%keyword%' OR category LIKE '%keyword%');

-- SELECT * FROM products WHERE is_deleted = 0 ORDER BY product_name ASC;
-- SELECT * FROM products WHERE is_deleted = 0 ORDER BY price ASC;
-- SELECT * FROM products WHERE is_deleted = 0 ORDER BY quantity ASC;
