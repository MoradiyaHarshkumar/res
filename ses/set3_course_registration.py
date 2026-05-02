class Course:
    def __init__(self, course_name, code, credits):
        self.course_name = course_name
        self.code = code
        self.credits = credits
        self.students = []

    def register_student(self, student_name):
        self.students.append(student_name)

    def display_course(self):
        print("\nCourse Details")
        print("Course Name:", self.course_name)
        print("Course Code:", self.code)
        print("Credits:", self.credits)
        print("Registered Students:", self.students)


course_name = input("Enter course name: ")
code = input("Enter course code: ")
credits = int(input("Enter credits: "))

course = Course(course_name, code, credits)

n = int(input("Enter number of students to register: "))
for i in range(n):
    student_name = input("Enter student name: ")
    course.register_student(student_name)

course.display_course()
