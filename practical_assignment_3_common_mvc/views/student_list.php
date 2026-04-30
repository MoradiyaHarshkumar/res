<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h2>Student Record Management</h2>
    <a href="index.php">Home</a> |
    <a href="index.php?module=student&action=add">Add Student</a>

    <form method="get" action="index.php">
        <input type="hidden" name="module" value="student">
        <input type="text" name="keyword" placeholder="Search name, email, course" value="<?php echo htmlspecialchars($keyword); ?>">
        <select name="sort">
            <option value="id">ID</option>
            <option value="name">Name</option>
            <option value="course">Course</option>
            <option value="semester">Semester</option>
        </select>
        <select name="order">
            <option value="ASC">ASC</option>
            <option value="DESC">DESC</option>
        </select>
        <button type="submit">Search / Sort</button>
    </form>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Semester</th>
            <th>Contact Number</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <?php foreach ($students as $student): ?>
            <tr>
                <td><?php echo htmlspecialchars($student['id']); ?></td>
                <td><?php echo htmlspecialchars($student['name']); ?></td>
                <td><?php echo htmlspecialchars($student['email']); ?></td>
                <td><?php echo htmlspecialchars($student['course']); ?></td>
                <td><?php echo htmlspecialchars($student['semester']); ?></td>
                <td><?php echo htmlspecialchars($student['contact_no']); ?></td>
                <td><a href="index.php?module=student&action=edit&id=<?php echo $student['id']; ?>">Edit</a></td>
                <td><a href="index.php?module=student&action=delete&id=<?php echo $student['id']; ?>">Delete</a></td>
            </tr>
        <?php endforeach; ?>
    </table>

    <p>Delete hides record from screen only. It sets is_deleted = 1.</p>
</body>
</html>
