class Fabrica(object):
    def getProducto(self, idProducto):
        if idProducto == 1:
            return Producto1()
        elif idProducto == 2:
            return Producto2()
        elif idProducto == 3:
            return Producto3()

class Producto(object):
    def __init__(self):
        self.nombre = None
        self.precio = None
        self.iva = 0.19
    def comprar(self, cantidad):
        print("nombre producto:", self.nombre)
        print("precio unitario sin iva:", self.precio)
        print("precio unitario con iva:", self.precio * (1+self.iva))
        print("cantidad:", cantidad)
        print("precio total sin iva:", cantidad * self.precio)
        print("precio total con iva:", cantidad * self.precio * (1+self.iva))

class Producto1(Producto):
    def __init__(self):
        Producto.__init__(self)
        self.nombre = "producto1"
        self.precio = 1500

class Producto2(Producto):
    def __init__(self):
        Producto.__init__(self)
        self.nombre = "producto2"
        self.precio = 2000

class Producto3(Producto):
    def __init__(self):
        Producto.__init__(self)
        self.nombre = "producto 3"
        self.precio = 3500
        self.iva = 0.05
        
fabrica = Fabrica()
producto = fabrica.getProducto(1)
producto.comprar(3)
