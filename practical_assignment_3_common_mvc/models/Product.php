<?php
class Product
{
    private PDO $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getAll(string $keyword = '', string $sort = 'id', string $order = 'DESC'): array
    {
        $allowedSort = ['id', 'product_name', 'price', 'quantity'];
        $allowedOrder = ['ASC', 'DESC'];

        if (!in_array($sort, $allowedSort, true)) {
            $sort = 'id';
        }
        if (!in_array($order, $allowedOrder, true)) {
            $order = 'DESC';
        }

        $sql = "SELECT * FROM products WHERE is_deleted = 0";
        $params = [];

        if ($keyword !== '') {
            $sql .= " AND (product_name LIKE :keyword OR category LIKE :keyword)";
            $params[':keyword'] = "%$keyword%";
        }

        $sql .= " ORDER BY $sort $order";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function find(int $id): ?array
    {
        $stmt = $this->conn->prepare("SELECT * FROM products WHERE id = :id AND is_deleted = 0");
        $stmt->execute([':id' => $id]);
        $product = $stmt->fetch(PDO::FETCH_ASSOC);
        return $product ?: null;
    }

    public function insert(array $data): void
    {
        $stmt = $this->conn->prepare(
            "INSERT INTO products (product_name, category, price, quantity)
             VALUES (:product_name, :category, :price, :quantity)"
        );
        $stmt->execute([
            ':product_name' => $data['product_name'],
            ':category' => $data['category'],
            ':price' => $data['price'],
            ':quantity' => $data['quantity'],
        ]);
    }

    public function update(int $id, array $data): void
    {
        $stmt = $this->conn->prepare(
            "UPDATE products
             SET product_name = :product_name, category = :category,
                 price = :price, quantity = :quantity
             WHERE id = :id"
        );
        $stmt->execute([
            ':id' => $id,
            ':product_name' => $data['product_name'],
            ':category' => $data['category'],
            ':price' => $data['price'],
            ':quantity' => $data['quantity'],
        ]);
    }

    public function delete(int $id): void
    {
        $stmt = $this->conn->prepare("UPDATE products SET is_deleted = 1 WHERE id = :id");
        $stmt->execute([':id' => $id]);
    }
}
