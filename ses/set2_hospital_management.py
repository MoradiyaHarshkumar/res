class Patient:
    def __init__(self, name, age, disease):
        self.name = name
        self.age = age
        self.disease = disease
        self.doctor = ""

    def assign_doctor(self, doctor_name):
        self.doctor = doctor_name

    def display_patient(self):
        print("Patient Name:", self.name)
        print("Age:", self.age)
        print("Disease:", self.disease)
        print("Doctor:", self.doctor)


patient1 = Patient("Amit", 45, "Fever")
patient1.assign_doctor("Dr. Mehta")
patient1.display_patient()
