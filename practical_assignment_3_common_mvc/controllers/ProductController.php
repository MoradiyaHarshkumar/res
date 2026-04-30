<?php
require_once 'config/database.php';
require_once 'models/Product.php';

class ProductController
{
    private Product $model;

    public function __construct()
    {
        global $conn;
        $this->model = new Product($conn);
    }

    public function handle(string $action): void
    {
        if ($action === 'add') {
            require 'views/product_add.php';
        } elseif ($action === 'save') {
            $this->model->insert($_POST);
            header('Location: index.php?module=product');
        } elseif ($action === 'edit') {
            $product = $this->model->find((int)$_GET['id']);
            require 'views/product_edit.php';
        } elseif ($action === 'update') {
            $this->model->update((int)$_POST['id'], $_POST);
            header('Location: index.php?module=product');
        } elseif ($action === 'delete') {
            $this->model->delete((int)$_GET['id']);
            header('Location: index.php?module=product');
        } else {
            $keyword = $_GET['keyword'] ?? '';
            $sort = $_GET['sort'] ?? 'id';
            $order = $_GET['order'] ?? 'DESC';
            $products = $this->model->getAll($keyword, $sort, $order);
            require 'views/product_list.php';
        }
    }
}
