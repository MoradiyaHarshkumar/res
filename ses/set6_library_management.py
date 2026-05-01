class Book:
    def __init__(self, title, author, publisher):
        self.title = title
        self.author = author
        self.publisher = publisher
        self.issued = False

    def issue_book(self):
        self.issued = True

    def display_book(self):
        print("Title:", self.title)
        print("Author:", self.author)
        print("Publisher:", self.publisher)
        print("Issued:", self.issued)


book1 = Book("Python Programming", "Guido", "Tech Press")
book2 = Book("Data Science", "John", "ABC Publisher")
book1.issue_book()

book1.display_book()
print()
book2.display_book()
