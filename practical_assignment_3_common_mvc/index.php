<?php
require_once 'controllers/StudentController.php';
require_once 'controllers/ProductController.php';

$module = $_GET['module'] ?? 'home';
$action = $_GET['action'] ?? 'list';

if ($module === 'student') {
    $controller = new StudentController();
    $controller->handle($action);
} elseif ($module === 'product') {
    $controller = new ProductController();
    $controller->handle($action);
} else {
    require 'views/home.php';
}
