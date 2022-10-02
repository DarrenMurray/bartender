#include <Arduino.h>
#include <ArduinoJson.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <WiFi.h>
#include <ESPmDNS.h>
#include <map>
using namespace std;

String id = "esp-32/1";

const char* ssid = "";
const char* pass = "";

WebServer server(8080);

// gpio pin mappings
std::map<String, int> pins = {
 {"pump1", 15},
 {"pump2", 2}, 
 {"pump2", 4}, 
 {"pump4", 16}, 
 {"pump5", 17}, 
 {"pump6", 5}, 
 {"pump7", 18},
 {"pump8", 19},
 {"pump9", 21},
 {"pump10", 3}};

// set the output mode for gpio pins
void initPins() {
   for (auto pin : pins) {
    Serial.print("initializing pump ");
    Serial.println(pin.first);
    pinMode(pin.second, OUTPUT);
  }
}

StaticJsonDocument<250> jsonDocument;
char buffer[250];

String createJson(String key, String value) {  
  jsonDocument.clear();
  jsonDocument[key] = value;
  serializeJson(jsonDocument, buffer);  

  return String(buffer);
}

String createJson(String key, bool value) {  
  jsonDocument.clear();
  jsonDocument[key] = value;
  serializeJson(jsonDocument, buffer);  

  return String(buffer);
}

void addJsonObject(String key, String value) {
  JsonObject obj = jsonDocument.createNestedObject();
  obj[key] = value;
}

void addJsonObject(String key, bool value) {
  JsonObject obj = jsonDocument.createNestedObject();
  obj[key] = value;
}

String boolToString(bool state) {
  return state ? "true":"false";
}

bool stringToBool(String state) {
  return (state == "true") ? true : false;
}

bool intToBool(int state) {
  return (state == 1) ? true : false;
}

String pinCfg() {
  String mapString = "";
  int count = 0;
  for (auto pin : pins) {
    count ++;
    mapString += pin.first;
    mapString += ": ";
    mapString += pin.second;
    if (count < pins.size()) {
    mapString += ", ";
    }
  }
  return mapString;
}

void handlePost() {
  if (server.hasArg("plain") == false) {
  }
  String body = server.arg("plain");
  deserializeJson(jsonDocument, body);

  bool pinStateResponse = jsonDocument["state"];
  int pinResponse = jsonDocument["pin"];
  int durationResponse = jsonDocument["duration"];

  bool pumpCurrentState = intToBool(digitalRead(pinResponse));
  Serial.println("setting state...");  
  Serial.print(pumpCurrentState);
  Serial.print(" -> ");
  Serial.println(pinStateResponse);
  bool response = false;

// If state is true. Activate Pin
  if (pinStateResponse == 1) {
    Serial.print("activating pin ");
    Serial.print(pinResponse);
    Serial.print(" for ");
    Serial.println(durationResponse);

    digitalWrite (pinResponse, HIGH);
    // keep pump active for pour duration
    delay(durationResponse);
    digitalWrite (pinResponse, LOW);
    response = true;
    } else {
    digitalWrite (pinResponse, LOW);
    response = true;
  }

 String jsonResponse = createJson("success", response);
  server.send(200, "application/json", jsonResponse);
}

void getData() {
  Serial.println("getting pump config...");
  jsonDocument.clear();
  addJsonObject("controller-id", id);

  addJsonObject("pin-cfg", pinCfg());
  serializeJson(jsonDocument, buffer);
  server.send(200, "application/json", buffer);
}

void setupRouting() {     
  server.on("/data", getData);     
  server.on("/activate", HTTP_POST, handlePost);    
  server.begin();    
}

void wifiConnect() {
  const char * headerkeys[] = {"Content-Type"} ;
  size_t headerkeyssize = sizeof(headerkeys)/sizeof(char*);
  server.collectHeaders( headerkeys, headerkeyssize );

  Serial.print("Connecting to Wi-Fi...");
  WiFi.begin(ssid, pass);

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }

  Serial.println("esp-32/1 connected...");
  Serial.println("listening at ");
  Serial.print(WiFi.localIP());
  Serial.print(":8080...'\n");
}

void setup() {
  Serial.begin(9600);
  Serial.println("initializing...");
 
 // init pin outs
  initPins();

// connect to Wifi
  wifiConnect();

// init http endpoints
  setupRouting(); 
}

void loop() {
    server.handleClient();     
}
