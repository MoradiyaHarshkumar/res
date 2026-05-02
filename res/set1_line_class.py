import math


class Line:
    def __init__(self, x1, y1, x2, y2):
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2

    def length(self):
        ans = math.sqrt((self.x2 - self.x1) ** 2 + (self.y2 - self.y1) ** 2)
        return ans

    def slope(self):
        if self.x2 - self.x1 == 0:
            return "Slope is not defined"
        ans = (self.y2 - self.y1) / (self.x2 - self.x1)
        return ans

    def display_points(self):
        print("\nLine Points")
        print("Point 1:", (self.x1, self.y1))
        print("Point 2:", (self.x2, self.y2))


x1 = float(input("Enter x1: "))
y1 = float(input("Enter y1: "))
x2 = float(input("Enter x2: "))
y2 = float(input("Enter y2: "))

line = Line(x1, y1, x2, y2)
line.display_points()
print("Length of line:", line.length())
print("Slope of line:", line.slope())
