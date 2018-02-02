#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5 , 4, 3, 2);
const int pinFocus = 8;
const int pinShutter = 10;
const int pinPotenciometro = A4;
const int pinFotoresistencia = A1;
const int pinBotones = A0;
const int analogBotones[3] = {820, 280, 130};
const int numOpciones = 4;
int valorPotenciometro = 0;
int valorActualPotenciometro = 0;
int valorFotoresistencia = 0;
int valorActualFotoresistencia = 0;
int valorBotones = 0;
int valorActualBotones = 0;
int valorBoton1 = 0;
int valorBoton2 = 0;
int valorBoton3 = 0;
int opciones[3];
int idopcion = 0;
int totalOpciones = 4;
int idOpcion = 0;
int valorOpciones[numOpciones] = {0,0,0,0};    // Intervalo, Exposicion, Cantidad, Iniciar
int Intervalo = 0;
int Exposicion = 0;
int Cantidad = 0;
int activaCamara = 0;
int activeShutter = 0;
// tiempos
int tiempo = 0;
int tiempoActual = 0;

#define CAMERA_FLASH_PIN 4

void setup(){
    lcd.begin(16, 2);
    pinMode(pinBotones, INPUT);
    pinMode(pinFocus, OUTPUT);
    pinMode(pinShutter, OUTPUT);
    digitalWrite(CAMERA_FLASH_PIN, LOW);
    Serial.begin(9600); // open serial
    imprimirOpcion();
}

void leerPotenciometro(){
    if(idOpcion != 3){
        valorActualPotenciometro = analogRead(pinPotenciometro) / 100;
        if(valorActualPotenciometro != valorPotenciometro){
            clearRow(1);
            lcd.setCursor(0, 1);
            valorPotenciometro = valorActualPotenciometro;
            lcd.print(valorPotenciometro);
        }
    }
}

void leerFotoresistencia(){
    valorActualFotoresistencia = analogRead(pinFotoresistencia) / 540;
    if(valorActualFotoresistencia != valorFotoresistencia){
        valorFotoresistencia = valorActualFotoresistencia;
        if(valorFotoresistencia == 1){
          if(valorOpciones[idOpcion] != valorPotenciometro || idOpcion == 3)
            guardar();
      }
    }   
}

void clearRow(int n){
    lcd.setCursor(0, n);
    for(int i=0; i<16; i++){
        lcd.print(" ");
    }
}

void imprimirOpcion(){
    clearRow(0);
    clearRow(1);
    lcd.setCursor(0, 0);
  if(idOpcion == 0)
    lcd.print("INTERVALO: ");
    else if(idOpcion == 1)
    lcd.print("EXPOSICION: ");
    else if(idOpcion == 2)
    lcd.print("CANTIDAD: ");
    else{
      lcd.print("INICIAR()");
    }
    
    if(idOpcion <= 2){
        lcd.print(valorOpciones[idOpcion]);
        lcd.setCursor(0, 1);
        lcd.print(valorPotenciometro);
    }
}

void subir(){
    idOpcion = (idOpcion+1)%numOpciones;
    imprimirOpcion();
}

void bajar(){
    idOpcion = (numOpciones + idOpcion - 1)%numOpciones;
    imprimirOpcion();
}

void guardar(){
    if(idOpcion != 3){
        valorOpciones[idOpcion] = valorPotenciometro;
        imprimirOpcion();
        valorOpciones[3] = 0;
    }
    else{
      valorOpciones[3] = 1;
        clearRow(1);
        if(activaCamara == 0){
          Intervalo = valorOpciones[0];
          Exposicion = valorOpciones[1];
          Cantidad = valorOpciones[2];
        activaCamara = 1;
        tiempo = millis() + (Intervalo+Exposicion)*1000;
        }
        else{
          activaCamara = 0;
            activeShutter = 0;
            Intervalo = 0;
          Exposicion = 0;
          Cantidad = 0;
        }
    }
}

int inicio(){
  if(valorOpciones[3]==1 || valorFotoresistencia>=1)
    return(1);
    return(0);
}

void presionoBoton(){
    valorActualBotones = analogRead(pinBotones);
    int boton;
    for(boton=0; boton<3; boton++){
        if(valorBotones >= analogBotones[boton]-50 && valorBotones <= analogBotones[boton]+50)
        break;
    }
    int b1=boton;
    for(boton=0; boton<3; boton++){
        if(valorActualBotones >= analogBotones[boton]-50 && valorActualBotones <= analogBotones[boton]+50)
        break;
    }
    int b2= boton;
    valorBotones = valorActualBotones;
    if(boton == 0 && b1!=b2)
    subir();
    else if(boton == 1 && b1!=b2)
    bajar();
    else if(boton == 2 && b1!=b2)
    guardar();
}

void camara(){
    if(activaCamara == 1 && Cantidad >= 1){
        tiempoActual= millis();
        if(tiempoActual >= tiempo){
            digitalWrite(pinFocus, LOW);
            digitalWrite(pinShutter, LOW);
            tiempo= tiempoActual + (Intervalo+Exposicion)*1000;
            Cantidad--;
            activeShutter = 0;
        }
        else if(tiempoActual >= tiempo-(Exposicion*1000) && activeShutter == 0){
            digitalWrite(pinFocus, HIGH);
            digitalWrite(pinShutter, HIGH);
            activeShutter = 1;
        }
    }
    else{
        digitalWrite(pinFocus, LOW);
        digitalWrite(pinShutter, LOW);
        activaCamara = 0;
    }
}
  
void loop(){
    Serial.print(activaCamara);
    Serial.print(" ");
    Serial.println(Cantidad);
    presionoBoton();
    leerPotenciometro();
    leerFotoresistencia();
    camara();
}

