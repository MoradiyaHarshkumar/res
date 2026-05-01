class CartItem:
    def __init__(self, name, price, quantity):
        self.name = name
        self.price = price
        self.quantity = quantity

    def item_total(self):
        return self.price * self.quantity

    def display_item(self):
        print("Item Name:", self.name)
        print("Price:", self.price)
        print("Quantity:", self.quantity)
        print("Item Total:", self.item_total())


item1 = CartItem("Notebook", 50, 4)
item2 = CartItem("Pen", 10, 5)
total_bill = item1.item_total() + item2.item_total()

item1.display_item()
print()
item2.display_item()
print("Total Bill:", total_bill)
