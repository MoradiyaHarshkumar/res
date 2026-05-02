class Employee:
    def __init__(self, employee_id, name, salary):
        self.employee_id = employee_id
        self.name = name
        self.salary = salary

    def calculate_salary(self):
        return self.salary

    def display_employee(self):
        print("\nEmployee Details")
        print("Employee ID:", self.employee_id)
        print("Name:", self.name)
        print("Salary:", self.calculate_salary())


employee_id = int(input("Enter employee ID: "))
name = input("Enter employee name: ")
salary = float(input("Enter employee salary: "))

employee = Employee(employee_id, name, salary)
employee.display_employee()
