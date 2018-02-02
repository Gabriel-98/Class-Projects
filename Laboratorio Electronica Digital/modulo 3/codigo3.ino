#include <LiquidCrystal.h>

LiquidCrystal lcd(8, 9, 10, 11, 12, 13);

// Identificacion de pines
const int pinPotenciometro = 5;
const int pinFototransistor = 4;
const int pinBotones[2] = {1, 2};
// Variables
const int numBotones = 2;
const int numOpciones = 3;
int valorBotones[3] = {0, 0};
int valorPotenciometro = 0;
int nuevoValorPotenciometro = 0;
int valorFototransistor = 0;
int cambiaPantalla = 0;
int idOpcion = 0;
int opciones[3] = {0,0,0};

void setup() {
  lcd.begin(16, 2);
  pinMode(pinPotenciometro, INPUT);
  pinMode(pinFototransistor, INPUT);
  pinMode(pinBotones[0], INPUT);
  pinMode(pinBotones[1], INPUT);
  pinMode(pinBotones[2], INPUT);
  lcd.print("OPCION 1: ");
  lcd.print(opciones[idOpcion]);
}

void clearRow(int i){
  lcd.setCursor(0, i);
  if(i==0)
  lcd.setCursor(10,i);
  lcd.print("    ");
}

void pulsoBoton(int n){
  int b1;
  b1 = digitalRead(pinBotones[n]);
  if(b1==HIGH){
    if(valorBotones[n]==LOW){
      cambiaPantalla = 1;
      if(n==0)
      idOpcion = (idOpcion+1) % numOpciones;
      else if(n==1)
      idOpcion = (numOpciones + idOpcion - 1) % numOpciones;
    }
  }
  valorBotones[n] = b1;
}

void cambioFototransistor(){
  valorFototransistor = analogRead(pinFototransistor);
    if(valorFototransistor > 235){
        if(valorPotenciometro != opciones[idOpcion]){
            opciones[idOpcion] = valorPotenciometro;
          cambiaPantalla = 1;
        }
    }
}

void actualizarPantalla(){
  if(cambiaPantalla==1){
    clearRow(0);
    lcd.setCursor(7, 0);
    lcd.print(idOpcion+1);
    lcd.print(": ");
    lcd.print(opciones[idOpcion]);
  }
  nuevoValorPotenciometro = analogRead(pinPotenciometro);
  if(nuevoValorPotenciometro != valorPotenciometro){
    clearRow(1);
    valorPotenciometro = nuevoValorPotenciometro;
    lcd.setCursor(0, 1);
    lcd.print(valorPotenciometro);
  }
}

void loop() {
  cambiaPantalla = 0;
  for(int i=0; i<numBotones; i++){
    pulsoBoton(i);
  }
  cambioFototransistor();
  actualizarPantalla();
}

