THIS IS A DRAFT

The project has two parts: 

1. Visual Studio repository for a w32 app to display the voltmeter on your pc
2. Arduino code (tested on a D1 Mini and a NodeMCU)

Short description: 

The NodeMCU uses an Adafruit_ADS1015 four channel 14 bit ADC for the voltage measurement. The data is send via serial1 to the PC, using an USB UART adapter. 
The w32 app displays the measured voltages and can be used for some basic configuration.
