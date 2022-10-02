# Bartender
Automated bartender

### Client

The client code is designed to run on an esp32 devkit board. 
The pinout diagram below shows which gpio pints are are use for this project.


```

                                         +-----------------------+
                                         | O      | USB |      O |
                                         |        -------        |
                                     3V3 | [ ]               [1] | VIN
                                     GND | [ ]               [1] | GND 
                     pump-one ... GPIO15 | [1]               [ ] | GPIO13
                     pump-two .... GPIO2 | [1]               [ ] | GPIO12 
                     pump-three .. GPIO4 | [1]               [ ] | GPIO14
                     pump-four .. GPIO16 | [1]               [ ] | GPIO27
                     pump-five .. GPIO17 | [1]               [ ] | GPIO26
                     pump-six .... GPIO5 | [1]  ___________  [ ] | GPIO25 
                     pump-seven . GPIO18 | [1] |           | [ ] | GPIO33
                     pump-eight . GPIO19 | [1] |           | [ ] | GPIO32
                     pump-nine .. GPIO21 | [1] |           | [ ] | GPIO35 
                     pump-ten .... GPIO3 | [1] |           | [ ] | GPIO34 
                                   GPIO1 | [ ] |           | [ ] | GPIO39 
                                  GPIO22 | [ ] |           | [ ] | GPIO36 
                                  GPIO23 | [ ] |___________| [ ] | EN 
                                         |                       |
                                         |  |  |  ____  ____  |  |
                                         |  |  |  |  |  |  |  |  |
                                         |  |__|__|  |__|  |__|  |
                                         | O                   O |
                                         +-----------------------+

```

For more details on the esp32 devkit board see links below

https://www.espressif.com/en/products/hardware/esp32/overview

https://lastminuteengineers.com/esp32-arduino-ide-tutorial/#esp32-development-board-pinout

### Api

The client has 2 endpoints:

`POST` `/activate` - activates a specifed gpio pin for a given duration 
`GET` `/data` - returns mappings of the pump to gpio pin

`/activate` expects the following json request

```
{
	"state":true, // enable/disable gpio pin
	"pin": 15,    // the pin to enable/disable
	"duration": 5000 // the duration in millisecond the pin will remain enabled/disabled
}
```



