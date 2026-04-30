<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
</head>
<body>
    <h2>Add Student</h2>

    <form method="post" action="index.php?module=student&action=save">
        Name:<br>
        <input type="text" name="name" required><br><br>

        Email:<br>
        <input type="email" name="email" required><br><br>

        Course:<br>
        <input type="text" name="course" required><br><br>

        Semester:<br>
        <input type="number" name="semester" required><br><br>

        Contact Number:<br>
        <input type="text" name="contact_no" required><br><br>

        <button type="submit">Save</button>
        <a href="index.php?module=student">Back</a>
    </form>
</body>
</html>
