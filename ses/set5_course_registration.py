class Course:
    def __init__(self, course_name, code, credits):
        self.course_name = course_name
        self.code = code
        self.credits = credits
        self.students = []

    def register_student(self, student_name):
        self.students.append(student_name)

    def display_course(self):
        print("Course Name:", self.course_name)
        print("Course Code:", self.code)
        print("Credits:", self.credits)
        print("Registered Students:", self.students)


course1 = Course("Data Science", "DS101", 4)
course1.register_student("Karan")
course1.register_student("Neha")
course1.display_course()
