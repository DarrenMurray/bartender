# Bartender
Automated bartender

### Components

The following components are required for this project
##### client
- [esp32-devkit](https://www.amazon.co.uk/gp/product/B07VJ34N2Q/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)
- [12v peristaltic pump](https://www.amazon.co.uk/gp/product/B07D7TN1BW/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) x 10
- [step down regulator](https://www.amazon.co.uk/gp/product/B089KBS5XR/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1)
- [irf520 mosfet module](https://www.amazon.co.uk/gp/product/B07F7SV84V/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1) x 10
- [12v power supply & power distribution board](https://www.amazon.co.uk/gp/product/B07R1YNG8Y/ref=ewc_pr_img_3?smid=A6FTR3WNTF6EM&psc=1)
- [food safe tubing(inner 2mm x outer 4mm)](https://tinyurl.com/food-grade-tubing) x 20meters

##### server
- [raspberry pi 4b](https://thepihut.com/products/raspberry-pi-4-model-b)
- [raspberry pi touchscreen display](https://thepihut.com/collections/latest-raspberry-pi-products/products/2-8-ips-capacitive-touch-dsi-display-for-raspberry-pi-480x640)

## Client

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



