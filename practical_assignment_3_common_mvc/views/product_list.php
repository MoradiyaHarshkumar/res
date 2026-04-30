<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h2>Product Inventory Management</h2>
    <a href="index.php">Home</a> |
    <a href="index.php?module=product&action=add">Add Product</a>

    <form method="get" action="index.php">
        <input type="hidden" name="module" value="product">
        <input type="text" name="keyword" placeholder="Search product or category" value="<?php echo htmlspecialchars($keyword); ?>">
        <select name="sort">
            <option value="id">ID</option>
            <option value="product_name">Product Name</option>
            <option value="price">Price</option>
            <option value="quantity">Quantity</option>
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
            <th>Product Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Created At</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <?php foreach ($products as $product): ?>
            <tr>
                <td><?php echo htmlspecialchars($product['id']); ?></td>
                <td><?php echo htmlspecialchars($product['product_name']); ?></td>
                <td><?php echo htmlspecialchars($product['category']); ?></td>
                <td><?php echo htmlspecialchars($product['price']); ?></td>
                <td><?php echo htmlspecialchars($product['quantity']); ?></td>
                <td><?php echo htmlspecialchars($product['created_at']); ?></td>
                <td><a href="index.php?module=product&action=edit&id=<?php echo $product['id']; ?>">Edit</a></td>
                <td><a href="index.php?module=product&action=delete&id=<?php echo $product['id']; ?>">Delete</a></td>
            </tr>
        <?php endforeach; ?>
    </table>

    <p>Delete hides record from screen only. It sets is_deleted = 1.</p>
</body>
</html>
