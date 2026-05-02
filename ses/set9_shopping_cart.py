class CartItem:
    def __init__(self, name, price, quantity):
        self.name = name
        self.price = price
        self.quantity = quantity

    def item_total(self):
        return self.price * self.quantity

    def display_item(self):
        print("\nItem Details")
        print("Item Name:", self.name)
        print("Price:", self.price)
        print("Quantity:", self.quantity)
        print("Item Total:", self.item_total())


n = int(input("Enter number of items: "))
items = []

for i in range(n):
    print("\nEnter item", i + 1, "details")
    name = input("Enter item name: ")
    price = float(input("Enter item price: "))
    quantity = int(input("Enter item quantity: "))
    item = CartItem(name, price, quantity)
    items.append(item)

total_bill = 0
for item in items:
    item.display_item()
    total_bill = total_bill + item.item_total()

print("\nTotal Bill:", total_bill)
