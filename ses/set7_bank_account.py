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
        print("\nAccount Details")
        print("Name:", self.name)
        print("Account Number:", self.account_number)
        print("Balance:", self.balance)


name = input("Enter account holder name: ")
account_number = int(input("Enter account number: "))
balance = float(input("Enter opening balance: "))

account = BankAccount(name, account_number, balance)

deposit_amount = float(input("Enter deposit amount: "))
account.deposit(deposit_amount)

withdraw_amount = float(input("Enter withdraw amount: "))
account.withdraw(withdraw_amount)

account.display_account()
