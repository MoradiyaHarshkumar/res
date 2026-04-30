Practical Assignment 3 Common MVC Structure

Folder:
D:\res\practical_assignment_3_common_mvc

Structure:
project/
  config/
    database.php
  models/
    Student.php
    Product.php
  controllers/
    StudentController.php
    ProductController.php
  views/
    home.php
    student_add.php
    student_edit.php
    student_list.php
    product_add.php
    product_edit.php
    product_list.php
  index.php
  database.sql

Database:
Import database.sql in phpMyAdmin.

Run:
http://localhost/practical_assignment_3_common_mvc/

Important:
Delete does not physically delete from database.
It only sets is_deleted = 1, so record is hidden from the screen.
Both tables include created_at and updated_at columns.

No Bootstrap and no styling is used.
