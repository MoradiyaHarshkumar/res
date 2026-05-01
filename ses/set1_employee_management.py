class Employee:
    def __init__(self, employee_id, name, salary):
        self.employee_id = employee_id
        self.name = name
        self.salary = salary

    def calculate_salary(self):
        return self.salary

    def display_employee(self):
        print("Employee ID:", self.employee_id)
        print("Name:", self.name)
        print("Salary:", self.calculate_salary())


emp1 = Employee(101, "Rahul", 25000)
emp2 = Employee(102, "Priya", 30000)

emp1.display_employee()
print()
emp2.display_employee()
