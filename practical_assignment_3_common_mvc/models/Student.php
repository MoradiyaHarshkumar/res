<?php
class Student
{
    private PDO $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getAll(string $keyword = '', string $sort = 'id', string $order = 'DESC'): array
    {
        $allowedSort = ['id', 'name', 'course', 'semester'];
        $allowedOrder = ['ASC', 'DESC'];

        if (!in_array($sort, $allowedSort, true)) {
            $sort = 'id';
        }
        if (!in_array($order, $allowedOrder, true)) {
            $order = 'DESC';
        }

        $sql = "SELECT * FROM students WHERE is_deleted = 0";
        $params = [];

        if ($keyword !== '') {
            $sql .= " AND (name LIKE :keyword OR email LIKE :keyword OR course LIKE :keyword)";
            $params[':keyword'] = "%$keyword%";
        }

        $sql .= " ORDER BY $sort $order";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function find(int $id): ?array
    {
        $stmt = $this->conn->prepare("SELECT * FROM students WHERE id = :id AND is_deleted = 0");
        $stmt->execute([':id' => $id]);
        $student = $stmt->fetch(PDO::FETCH_ASSOC);
        return $student ?: null;
    }

    public function insert(array $data): void
    {
        $stmt = $this->conn->prepare(
            "INSERT INTO students (name, email, course, semester, contact_no)
             VALUES (:name, :email, :course, :semester, :contact_no)"
        );
        $stmt->execute([
            ':name' => $data['name'],
            ':email' => $data['email'],
            ':course' => $data['course'],
            ':semester' => $data['semester'],
            ':contact_no' => $data['contact_no'],
        ]);
    }

    public function update(int $id, array $data): void
    {
        $stmt = $this->conn->prepare(
            "UPDATE students
             SET name = :name, email = :email, course = :course,
                 semester = :semester, contact_no = :contact_no
             WHERE id = :id"
        );
        $stmt->execute([
            ':id' => $id,
            ':name' => $data['name'],
            ':email' => $data['email'],
            ':course' => $data['course'],
            ':semester' => $data['semester'],
            ':contact_no' => $data['contact_no'],
        ]);
    }

    public function delete(int $id): void
    {
        $stmt = $this->conn->prepare("UPDATE students SET is_deleted = 1 WHERE id = :id");
        $stmt->execute([':id' => $id]);
    }
}
