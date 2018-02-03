import sys

class Observador(object):
    def __init__(self, nombre, objeto):
        self.nombre = nombre
        self.valor = 0
        objeto.add(self)
    def actualizar(self, valor):
        self.valor = valor
        print(self.nombre, "fue actualizado")
        print("valor de", self.nombre + ":", self.valor)
        print()

class Objeto(object):
    def __init__(self):
        self.observadores = []
    def add(self, observador):
        self.observadores.append(observador)
    def eliminar(self, observador):
        self.observadores.remove(observador)
    def actualizar_observadores(self, nuevo_valor):
        for observador in self.observadores:
            observador.actualizar(nuevo_valor)

objeto = Objeto()
observador1 = Observador("observador1", objeto)
observador2 = Observador("observador2", objeto)
observador3 = Observador("observador3", objeto)

for line in sys.stdin:
    x = int(line)
    objeto.actualizar_observadores(x)
