class Student:
    def __init__(self, name, roll_no, marks):
        self.name = name
        self.roll_no = roll_no
        self.marks = marks

    def average_marks(self):
        total = sum(self.marks)
        average = total / len(self.marks)
        return average

    def display_student(self):
        print("Student Name:", self.name)
        print("Roll No:", self.roll_no)
        print("Marks:", self.marks)
        print("Average Marks:", self.average_marks())


student1 = Student("Meera", 21, [80, 75, 90])
student1.display_student()
