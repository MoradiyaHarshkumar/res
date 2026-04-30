<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <h2>Edit Product</h2>

    <?php if (!$product): ?>
        <p>Product not found.</p>
        <a href="index.php?module=product">Back</a>
    <?php else: ?>
        <form method="post" action="index.php?module=product&action=update">
            <input type="hidden" name="id" value="<?php echo htmlspecialchars($product['id']); ?>">

            Product Name:<br>
            <input type="text" name="product_name" value="<?php echo htmlspecialchars($product['product_name']); ?>" required><br><br>

            Category:<br>
            <input type="text" name="category" value="<?php echo htmlspecialchars($product['category']); ?>" required><br><br>

            Price:<br>
            <input type="number" step="0.01" name="price" value="<?php echo htmlspecialchars($product['price']); ?>" required><br><br>

            Quantity:<br>
            <input type="number" name="quantity" value="<?php echo htmlspecialchars($product['quantity']); ?>" required><br><br>

            <button type="submit">Update</button>
            <a href="index.php?module=product">Back</a>
        </form>
    <?php endif; ?>
</body>
</html>
