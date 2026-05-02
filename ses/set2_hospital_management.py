class Patient:
    def __init__(self, name, age, disease):
        self.name = name
        self.age = age
        self.disease = disease
        self.doctor = ""

    def assign_doctor(self, doctor_name):
        self.doctor = doctor_name

    def display_patient(self):
        print("\nPatient Details")
        print("Patient Name:", self.name)
        print("Age:", self.age)
        print("Disease:", self.disease)
        print("Doctor:", self.doctor)


name = input("Enter patient name: ")
age = int(input("Enter patient age: "))
disease = input("Enter disease: ")
doctor = input("Enter doctor name: ")

patient = Patient(name, age, disease)
patient.assign_doctor(doctor)
patient.display_patient()
