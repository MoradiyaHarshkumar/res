"""
Set 2 - Q1
Bill invoice program
"""


class Bill:
    def __init__(self):
        self.product_name = ""
        self.quantity = 0
        self.price = 0
        self.total = 0

    def getDetails(self):
        self.product_name = input("Enter product name: ")
        self.quantity = int(input("Enter quantity: "))
        self.price = float(input("Enter price: "))

    def billGenerate(self):
        self.total = self.quantity * self.price
        print("Bill generated successfully")

    def display(self):
        print("\nInvoice")
        print("Product Name:", self.product_name)
        print("Quantity:", self.quantity)
        print("Price:", self.price)
        print("Total Amount:", self.total)


bill = Bill()

while True:
    print("\n1. Enter purchase details")
    print("2. Final Bill")
    print("3. Display details")
    print("4. Exit")

    choice = int(input("Enter the choice for operation: "))

    if choice == 1:
        bill.getDetails()
    elif choice == 2:
        bill.billGenerate()
    elif choice == 3:
        bill.display()
    elif choice == 4:
        break
    else:
        print("Invalid choice")
