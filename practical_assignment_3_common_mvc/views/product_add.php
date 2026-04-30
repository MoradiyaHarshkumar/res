<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h2>Add Product</h2>

    <form method="post" action="index.php?module=product&action=save">
        Product Name:<br>
        <input type="text" name="product_name" required><br><br>

        Category:<br>
        <input type="text" name="category" required><br><br>

        Price:<br>
        <input type="number" step="0.01" name="price" required><br><br>

        Quantity:<br>
        <input type="number" name="quantity" required><br><br>

        <button type="submit">Save</button>
        <a href="index.php?module=product">Back</a>
    </form>
</body>
</html>
