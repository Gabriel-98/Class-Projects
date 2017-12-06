const int pinFototransistor[6] = {A0, A1, A2, A3, A4, A5};
const int pinLed[6] = {1, 2, 3, 4, 5, 6};
int estados[6] = {0, 0, 0, 0, 0, 0};
int puestos[6] = {0, 9, 0, 8, 0, 7};

void setup() {
    for(int i=0; i<6; i++){
        pinMode(pinLed[i], OUTPUT);
    }
    Serial.begin(9600);
}

void detectarEspacios(){
    for(int i=0; i<6; i++){
        delay(100);
        int x = analogRead(pinFototransistor[i]);
        if(x < 100){
            digitalWrite(pinLed[i], HIGH);
            if(estados[i] == 0)
            Serial.println(puestos[i]);
            estados[i] = 1;
        }
        else{
            digitalWrite(pinLed[i], LOW);
            if(estados[i] == 1)
            Serial.println(puestos[i]);
            estados[i] = 0;
        }
    }
    
}



void loop() {
    detectarEspacios();
}
