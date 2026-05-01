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
        print("Vehicle Type:", self.vehicle_type)
        print("Vehicle Number:", self.vehicle_number)
        print("Rent Per Day:", self.rent_per_day)
        print("Days:", self.days)
        print("Total Rent:", total_rent)


vehicle1 = Vehicle("Car", "GJ05AB1234", 1500)
vehicle1.rent_vehicle(3)
vehicle1.display_rental()
