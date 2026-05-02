class Vehicle:
    def __init__(self, vehicle_type, vehicle_number, rent_per_day):
        self.vehicle_type = vehicle_type
        self.vehicle_number = vehicle_number
        self.rent_per_day = rent_per_day
        self.days = 0

    def rent_vehicle(self, days):
        self.days = days

    def display_rental(self):
        total_rent = self.rent_per_day * self.days
        print("\nRental Details")
        print("Vehicle Type:", self.vehicle_type)
        print("Vehicle Number:", self.vehicle_number)
        print("Rent Per Day:", self.rent_per_day)
        print("Days:", self.days)
        print("Total Rent:", total_rent)


vehicle_type = input("Enter vehicle type: ")
vehicle_number = input("Enter vehicle number: ")
rent_per_day = float(input("Enter rent per day: "))
days = int(input("Enter number of days: "))

vehicle = Vehicle(vehicle_type, vehicle_number, rent_per_day)
vehicle.rent_vehicle(days)
vehicle.display_rental()
