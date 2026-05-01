"""
Set 1 - Q1
Line class program
"""

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
        print("Point 1:", (self.x1, self.y1))
        print("Point 2:", (self.x2, self.y2))


line1 = Line(2, 3, 6, 7)

line1.display_points()
print("Length of line:", line1.length())
print("Slope of line:", line1.slope())
