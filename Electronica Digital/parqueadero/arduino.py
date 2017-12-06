import serial, time, pygame, sys
from pygame.locals import *

pygame.init()

class Graficos(object):
    def __init__(self, height, width):
        self.width = height
        self.height = width
        self.ventana = pygame.display.set_mode((self.width,self.height))
        pygame.display.set_caption("PROYECTO DIGITAL")
        self.fuente = pygame.font.Font(None, 20)
    def update(self):
        pygame.display.update()
    def insertar(self, img, posX, posY):
        imagen = pygame.image.load(img).convert_alpha()
        self.ventana.blit(imagen, (posX,posY))
    def erase(self, posX, posY, width, height):
        pygame.draw.rect(self.ventana, (0,0,0) , [posX, posY, width, height])
    def clearScreen(self):
        pygame.draw.rect(self.ventana, (0,0,0) , [0, 0, self.width, self.height])
        self.update()
    def rectangulo(self, color, posX, posY, width, height):
        pygame.draw.rect(self.ventana, color , [posX, posY, width, height])
        self.update()
    def printTexto(self, texto, posX, posY):
        fuente = pygame.font.Font(None, 30)
        texto1 = fuente.render(texto, 0, (255, 255, 255))
        self.ventana.blit(texto1, (posX, posY))
    def quit(self):
        pygame.quit()

class Eventos(object):
    def __init__(self):
        self.close = False
        self.observadoresMouse = []
        self.observadoresTexto = []
        self.observadoresTeclado = []
    def addObserverMouse(self, observador):
        self.observadoresMouse.append(observador)
    def deleteObserverMouse(self, observador):
        self.observadoresMouse.remove(observador)
    def actualizarMouse(self, posX, posY, clic):
        for observador in self.observadoresMouse:
            observador.actualizarMouse(posX, posY, clic)
    def addObserverTeclado(self, observador):
        self.observadoresTeclado.append(observador)
    def deleteObserverTeclado(self, observador):
        self.observadoresTeclado.remove(observador)
    def actualizarTeclado(self, tecla):
        for observador in self.observadoresTeclado:
            observador.actualizarTeclado(tecla)
    def leer(self):
        for event in pygame.event.get():
            pos = pygame.mouse.get_pos()
            posX = pos[0]
            posY = pos[1]
            clic = pygame.mouse.get_pressed()[0]
            self.actualizarMouse(posX, posY, clic)
            if event.type == pygame.KEYDOWN:
                key_name = pygame.key.name(event.key)
                key_name = key_name.upper()
                self.tecla = key_name
                tecla = None
                if(event.key == K_UP):
                    tecla = "UP"
                elif(event.key == K_DOWN):
                    tecla = "DOWN"
                elif(event.key == K_LEFT):
                    tecla = "LEFT"
                elif(event.key == K_RIGHT):
                    tecla = "RIGHT"
                if(tecla != None):
                    self.actualizarTeclado(tecla)
            if event.type == pygame.QUIT:
                self.close = True
                pygame.quit()
class Puesto(object):
    def __init__(self, graficos, cod, posX, posY, width, height):
        self.graficos = graficos
        self.inicioX = 260
        self.inicioY = 120
        self.cod = cod
        self.posX = posX
        self.posY = posY
        self.width = width
        self.height = height
        self.estado = 0
    def printOcupado(self):
        self.graficos.rectangulo((133, 129, 129), self.inicioX + self.posX, self.inicioY + self.posY, self.width, self.height)
        self.estado = 1
    def printDisponible(self):
        self.graficos.rectangulo((0, 200, 0), self.inicioX + self.posX, self.inicioY + self.posY, self.width, self.height)
        self.estado = 0
    def printCambio(self):
        if(self.estado == 0):
            self.printOcupado()
        else:
            self.printDisponible()


graficos = Graficos(800,600)
eventos = Eventos()
puestos = []
puestos.append(Puesto(graficos,1,220,320,60,40))
puestos.append(Puesto(graficos,2,220,270,60,40))
puestos.append(Puesto(graficos,3,220,220,60,40))
puestos.append(Puesto(graficos,4,220,170,60,40))
puestos.append(Puesto(graficos,5,220,120,60,40))
puestos.append(Puesto(graficos,6,220,70,60,40))
puestos.append(Puesto(graficos,7,70,0,40,60))
puestos.append(Puesto(graficos,8,120,0,40,60))
puestos.append(Puesto(graficos,9,170,0,40,60))
puestos.append(Puesto(graficos,10,0,70,60,40))
puestos.append(Puesto(graficos,11,0,120,60,40))
puestos.append(Puesto(graficos,12,0,170,60,40))
puestos.append(Puesto(graficos,13,0,220,60,40))

graficos.insertar("Fondo_Digital2.png", 0, 0)

for puesto in puestos:
    puesto.printOcupado()
arduino = serial.Serial('/dev/ttyACM0', 9600)
while True:
    entrada = str(arduino.readline(), 'utf-8')
    idPuesto = int(entrada)
    puestos[idPuesto-1].printCambio()
    eventos.leer()
    if eventos.close:
        break
arduino.close()
