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
        print("\nStudent Details")
        print("Student Name:", self.name)
        print("Roll No:", self.roll_no)
        print("Marks:", self.marks)
        print("Average Marks:", self.average_marks())


name = input("Enter student name: ")
roll_no = int(input("Enter roll number: "))

marks = []
n = int(input("Enter number of subjects: "))
for i in range(n):
    mark = float(input("Enter marks: "))
    marks.append(mark)

student = Student(name, roll_no, marks)
student.display_student()
