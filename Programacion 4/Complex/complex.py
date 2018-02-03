class Complex(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __str__(self):
        return "Complex(" + str(self.x) + "," + str(self.y) + ")"
    def __add__(self, complejo):
        return Complex(self.x + complejo.x, self.y + complejo.y)
    def __sub__(self, complejo):
        return Complex(self.x - complejo.x, self.y - complejo.y)
    def __mul__(self, complejo):
        a = self.x
        b = self.y
        c = complejo.x
        d = complejo.y
        return Complex(a*c - b*d, a*d + b*c)
    def __truediv__(self, complejo):
        a = self.x*complejo.x + self.y*complejo.y
        b = self.y*complejo.x - self.x*complejo.y
        c = complejo.x*complejo.x + complejo.y*complejo.y
        return Complex(a/c, b/c)
    
a = Complex(1,1)
b = Complex(3,2)
c = a + b
d = a - b
e = a * b
f = a / b
print(c)
print(d)
print(e)
print(f)
