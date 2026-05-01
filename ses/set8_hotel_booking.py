class Room:
    def __init__(self, room_number, room_type, price):
        self.room_number = room_number
        self.room_type = room_type
        self.price = price
        self.booked = False

    def book_room(self):
        self.booked = True

    def display_booking(self):
        print("Room Number:", self.room_number)
        print("Room Type:", self.room_type)
        print("Price:", self.price)
        print("Booked:", self.booked)


room1 = Room(101, "Deluxe", 2500)
room1.book_room()
room1.display_booking()
