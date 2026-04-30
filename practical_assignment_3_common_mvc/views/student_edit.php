<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
</head>
<body>
    <h2>Edit Student</h2>

    <?php if (!$student): ?>
        <p>Student not found.</p>
        <a href="index.php?module=student">Back</a>
    <?php else: ?>
        <form method="post" action="index.php?module=student&action=update">
            <input type="hidden" name="id" value="<?php echo htmlspecialchars($student['id']); ?>">

            Name:<br>
            <input type="text" name="name" value="<?php echo htmlspecialchars($student['name']); ?>" required><br><br>

            Email:<br>
            <input type="email" name="email" value="<?php echo htmlspecialchars($student['email']); ?>" required><br><br>

            Course:<br>
            <input type="text" name="course" value="<?php echo htmlspecialchars($student['course']); ?>" required><br><br>

            Semester:<br>
            <input type="number" name="semester" value="<?php echo htmlspecialchars($student['semester']); ?>" required><br><br>

            Contact Number:<br>
            <input type="text" name="contact_no" value="<?php echo htmlspecialchars($student['contact_no']); ?>" required><br><br>

            <button type="submit">Update</button>
            <a href="index.php?module=student">Back</a>
        </form>
    <?php endif; ?>
</body>
</html>
