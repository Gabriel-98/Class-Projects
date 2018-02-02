// Identificacion de pines
const int pinLed = 1;
const int pinLed2 = 2;
const int pinLed3 = 3;
const int pinBoton = 4;
const int pinPotenciometro = 0;

// Variables
const int vel=4;
int idVel = 0;
int x = 0;
int estadoLed = 0;
int nuevoValorPotenciometro=0;
int nuevoValorBoton=0;
int valorPotenciometro = 0;
int valorBoton = 0;
int retardoLedBoton = 500;
int retardoLedPotenciometro = 500;
unsigned long tiempoLed = 0;

const int Velocidades[vel] = {200,100,50,20};

void setup() {
  pinMode(pinBoton, INPUT);
  pinMode(pinPotenciometro, INPUT);
  pinMode(pinLed, OUTPUT);   
  pinMode(pinLed2, OUTPUT);
  pinMode(pinLed3, OUTPUT);
}

void alumbrar(long retardo){
    unsigned long tiempoActual = millis();
    if(tiempoActual >= tiempoLed + retardo){
      tiempoLed = tiempoActual;
        estadoLed = (estadoLed+1)%2;
        if(estadoLed == 0)
        digitalWrite(pinLed, LOW);
        else
        digitalWrite(pinLed, HIGH);       
    }
}

void loop(){
    if(x==0)
    alumbrar(retardoLedPotenciometro);
    else if(x==1)
    alumbrar(retardoLedBoton);
    
    nuevoValorBoton = digitalRead(pinBoton);
    nuevoValorPotenciometro = analogRead(pinPotenciometro);
    if(nuevoValorPotenciometro != valorPotenciometro){
        valorPotenciometro = nuevoValorPotenciometro;
        retardoLedPotenciometro = Velocidades[3 - round(valorPotenciometro / 256)];
        digitalWrite(pinLed, LOW);
        estadoLed = 0;
      x=0;
        digitalWrite(pinLed2, LOW);
        digitalWrite(pinLed3, HIGH);
    }
    if(nuevoValorBoton == HIGH && nuevoValorBoton != valorBoton){
        valorBoton= nuevoValorBoton;
        retardoLedBoton = Velocidades[idVel];
        idVel = (idVel+1)%vel;
        digitalWrite(pinLed, LOW);
        estadoLed = 0;
        x=1;
        digitalWrite(pinLed2, HIGH);
        digitalWrite(pinLed3, LOW);
    }
    valorBoton= nuevoValorBoton;
}

