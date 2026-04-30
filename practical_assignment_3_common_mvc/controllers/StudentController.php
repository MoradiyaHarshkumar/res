<?php
require_once 'config/database.php';
require_once 'models/Student.php';

class StudentController
{
    private Student $model;

    public function __construct()
    {
        global $conn;
        $this->model = new Student($conn);
    }

    public function handle(string $action): void
    {
        if ($action === 'add') {
            require 'views/student_add.php';
        } elseif ($action === 'save') {
            $this->model->insert($_POST);
            header('Location: index.php?module=student');
        } elseif ($action === 'edit') {
            $student = $this->model->find((int)$_GET['id']);
            require 'views/student_edit.php';
        } elseif ($action === 'update') {
            $this->model->update((int)$_POST['id'], $_POST);
            header('Location: index.php?module=student');
        } elseif ($action === 'delete') {
            $this->model->delete((int)$_GET['id']);
            header('Location: index.php?module=student');
        } else {
            $keyword = $_GET['keyword'] ?? '';
            $sort = $_GET['sort'] ?? 'id';
            $order = $_GET['order'] ?? 'DESC';
            $students = $this->model->getAll($keyword, $sort, $order);
            require 'views/student_list.php';
        }
    }
}
