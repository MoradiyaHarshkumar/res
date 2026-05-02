class Book:
    def __init__(self, title, author, publisher):
        self.title = title
        self.author = author
        self.publisher = publisher
        self.issued = False

    def issue_book(self):
        self.issued = True

    def display_book(self):
        print("\nBook Details")
        print("Title:", self.title)
        print("Author:", self.author)
        print("Publisher:", self.publisher)
        print("Issued:", self.issued)


title = input("Enter book title: ")
author = input("Enter author name: ")
publisher = input("Enter publisher name: ")

book = Book(title, author, publisher)

choice = input("Do you want to issue this book? (yes/no): ")
if choice.lower() == "yes":
    book.issue_book()

book.display_book()
