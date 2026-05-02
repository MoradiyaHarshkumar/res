class Room:
    def __init__(self, room_number, room_type, price):
        self.room_number = room_number
        self.room_type = room_type
        self.price = price
        self.booked = False

    def book_room(self):
        self.booked = True

    def display_booking(self):
        print("\nBooking Details")
        print("Room Number:", self.room_number)
        print("Room Type:", self.room_type)
        print("Price:", self.price)
        print("Booked:", self.booked)


room_number = int(input("Enter room number: "))
room_type = input("Enter room type: ")
price = float(input("Enter room price: "))

room = Room(room_number, room_type, price)

choice = input("Do you want to book this room? (yes/no): ")
if choice.lower() == "yes":
    room.book_room()

room.display_booking()
