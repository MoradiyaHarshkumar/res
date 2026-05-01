class BankAccount:
    def __init__(self, name, account_number, balance):
        self.name = name
        self.account_number = account_number
        self.balance = balance

    def deposit(self, amount):
        self.balance = self.balance + amount

    def withdraw(self, amount):
        if amount <= self.balance:
            self.balance = self.balance - amount
        else:
            print("Insufficient balance")

    def display_account(self):
        print("Name:", self.name)
        print("Account Number:", self.account_number)
        print("Balance:", self.balance)


account1 = BankAccount("Raj", 123456, 5000)
account1.deposit(2000)
account1.withdraw(1000)
account1.display_account()
