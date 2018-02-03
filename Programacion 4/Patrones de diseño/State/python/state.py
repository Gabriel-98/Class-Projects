class Personaje(object):
    def __init__(self):
        self.resistencia = 20
        self.estadoEscudo = EscudoInactivo()
    def getResistencia(self):
        return self.resistencia
    def activarEscudo(self):
        self.estadoEscudo = EscudoActivo()
    def desactivarEscudo(self):
        self.estadoEscudo = EscudoInactivo()
    def recibeAtaque(self):
        self.resistencia = self.estadoEscudo.actualizarResistencia(self.resistencia)
        print("La resistencia actual es:", self.resistencia)

class EstadoEscudo(object):
    def actualizarResistencia(self, resistencia):
        pass

class EscudoActivo(EstadoEscudo):
    def actualizarResistencia(self, resistencia):
        return resistencia

class EscudoInactivo(EstadoEscudo):
    def actualizarResistencia(self, resistencia):
        return resistencia - 1
    
if __name__ == "__main__":
    personaje = Personaje()
    print("La resistencia inicial es:", personaje.getResistencia())
    personaje.recibeAtaque()
    personaje.recibeAtaque()
    personaje.activarEscudo()
    personaje.recibeAtaque()
    personaje.desactivarEscudo()
    personaje.recibeAtaque()
    
