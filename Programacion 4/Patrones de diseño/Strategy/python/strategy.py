class EstrategiaTriangulo(object):
    def __init__(self, tam):
        self.tam = tam
        self.triangulo = [i*"* " + "*" for i in range(tam)]

class EstrategiaTrianguloIzquierdo(EstrategiaTriangulo):
    def __init__(self, tam):
        EstrategiaTriangulo.__init__(self, tam)
    def dibujar(self):
        for fila in self.triangulo:
            print(fila)

class EstrategiaTrianguloCentro(EstrategiaTriangulo):
    def __init__(self, tam):
        EstrategiaTriangulo.__init__(self, tam)
    def dibujar(self):
        for fila in self.triangulo:
            x = self.tam - self.triangulo.index(fila) - 1
            print(x*" ", end="")
            print(fila)

class EstrategiaTrianguloDerecho(EstrategiaTriangulo):
    def __init__(self, tam):
        EstrategiaTriangulo.__init__(self, tam)
    def dibujar(self):
        for fila in self.triangulo:
            x = 2 * (self.tam - self.triangulo.index(fila) - 1)
            print(x*" ", end="")
            print(fila)

class Dibujo(object):
    def __init__(self):
        self.estrategiaTriangulo = EstrategiaTrianguloCentro(3)
    def setEstrategiaTriangulo(self, estrategiaTriangulo):
        self.estrategiaTriangulo = estrategiaTriangulo
    def dibujarTriangulo(self):
        self.estrategiaTriangulo.dibujar()

if __name__ == "__main__":
    dibujo = Dibujo()
    dibujo.dibujarTriangulo()
    dibujo.setEstrategiaTriangulo(EstrategiaTrianguloDerecho(5))
    dibujo.dibujarTriangulo()
    dibujo.setEstrategiaTriangulo(EstrategiaTrianguloIzquierdo(2))
    dibujo.dibujarTriangulo()
