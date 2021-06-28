/*

  Voltmeter für PC

  Version: 1.0.1
  Date: 2020-12-31

  MIT License
  
  Copyright (c) 2020 Andreas Exner
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/


//#include <ESP8266WiFi.h>

#include <Wire.h>
#include <Adafruit_ADS1015.h>

// device settings - change settings to match your requirements

//const char* ssid     = "HAL9000IOT"; // Wifi SSID
//const char* password = "J79tR3D5263zkdT52"; //Wifi password

bool debug = true; //true = debug to serial and output to serial1; false = no debug / output to serial
bool led = true; //enable external status LED on boot

int cycle = 330; //measure cycle in ms, MUST be even

float adc0_BIT = 0.001577298; // V per bit
float adc1_BIT = 0.001577298; // V per bit
float adc2_BIT = 0.001577298; // V per bit
float adc3_BIT = 0.001577298; // V per bit

int adc0_ZERO = 608;
int adc1_ZERO = 608;
int adc2_ZERO = 608;
int adc3_ZERO = 608;

// other definitions

#define LED D3 // gpio pin for external status LED
void(* HWReset) (void) = 0; // define reset function DO NOT CHANGE

Adafruit_ADS1115 ads1115(0x48);

//######################################### generic sensor functions #######################################################

void reboot_on_error() {

  if (debug) {Serial.println("\nPerforming reboot in 30 seconds....");}

  int i = 0;
  while (i < 30) {
    digitalWrite(LED, HIGH);
    delay(100);
    digitalWrite(LED, LOW);
    delay(200);
    digitalWrite(LED, HIGH);
    delay(100);
    digitalWrite(LED, LOW);
    delay(600);
    i++;
    if (debug) {Serial.print(String(i) + " ");}
  }

  HWReset();
}

String hex_to_string(uint8_t hex) {
  
  char hex_char[4];
  sprintf(hex_char, "%02x", hex);
  String hex_string = hex_char;
  hex_string.toUpperCase();
  return ("0x" + hex_string);
}

//######################################### setup ##############################################################

void setup(void) {

  Serial1.begin(115200);  
  delay(1000);

  Serial.begin(115200);  
  delay(1000);
  
  pinMode(LED, OUTPUT);

  if (debug) {Serial.println("### Initializing");}

  ads1115.begin();  // Initialize ads1115
  //ads1115.setGain(GAIN_TWOTHIRDS); 
  ads1115.setGain(GAIN_ONE); 
}

//######################################### loop ##############################################################

void loop(void)
{
  int16_t adc0, adc1, adc2, adc3;

  if (debug) {Serial.println("### Start measure");}
  
  //adc0 = ads1115.readADC_Differential_0_1();  
  //adc1 = ads1115.readADC_Differential_2_3();  
  adc0 = ads1115.readADC_SingleEnded(0);
  adc1 = ads1115.readADC_SingleEnded(1);
  adc2 = ads1115.readADC_SingleEnded(2);
  adc3 = ads1115.readADC_SingleEnded(3);

  if (adc0 < adc0_ZERO) {adc0 = adc0_ZERO;}
  if (adc1 < adc1_ZERO) {adc1 = adc1_ZERO;}
  if (adc2 < adc2_ZERO) {adc2 = adc2_ZERO;}
  if (adc3 < adc3_ZERO) {adc3 = adc3_ZERO;}

  uint16_t voltage0 = (adc0 - adc0_ZERO) * adc0_BIT * 1000;
  uint16_t voltage1 = (adc1 - adc1_ZERO) * adc1_BIT * 1000;
  uint16_t voltage2 = (adc2 - adc2_ZERO) * adc2_BIT * 1000;
  uint16_t voltage3 = (adc3 - adc3_ZERO) * adc3_BIT * 1000;

  double vOut0 = (adc0 - adc0_ZERO) * adc0_BIT;
  double vOut1 = (adc1 - adc1_ZERO) * adc1_BIT;
  double vOut2 = (adc2 - adc2_ZERO) * adc2_BIT;
  double vOut3 = (adc3 - adc3_ZERO) * adc3_BIT;

  if (debug) {
    
    String output = "    ADC0 = ";
    output += String(adc0);
    output += " - ";
    output += String(vOut0, 3);
    output += " -- ADC1 = ";
    output += String(adc1);
    output += " - ";
    output += String(vOut1, 3);
    output += " -- ADC2 = ";
    output += String(adc2);
    output += " - ";
    output += String(vOut2, 3);
    output += " -- ADC3 = ";
    output += String(adc3);
    output += " - ";
    output += String(vOut3, 3);
    
    Serial.println(output);
  }

  uint8_t voltage0_MSB = voltage0 >> 8;
  uint8_t voltage0_LSB = voltage0;
  uint8_t voltage1_MSB = voltage1 >> 8;
  uint8_t voltage1_LSB = voltage1;
  uint8_t voltage2_MSB = voltage2 >> 8;
  uint8_t voltage2_LSB = voltage2;
  uint8_t voltage3_MSB = voltage3 >> 8;
  uint8_t voltage3_LSB = voltage3;

  byte sendFrame[] = {0x01, 0xAE, voltage0_LSB, voltage0_MSB, voltage1_LSB, voltage1_MSB, voltage2_LSB, voltage2_MSB, voltage3_LSB, voltage3_MSB, 0x0A, 0x0D};
     
  if (debug) {

    Serial1.write(sendFrame, 12);
    
    String output = "Hex: ";
    for (int i = 0; i < 12; i++) {
      output += hex_to_string(sendFrame[i]) + ", ";
    }
    Serial.println(output);        
  }
  else {Serial.write(sendFrame, 12);}

  digitalWrite(LED, LOW);
  delay(cycle / 2);
  digitalWrite(LED, HIGH);
  delay(cycle / 2);
}
