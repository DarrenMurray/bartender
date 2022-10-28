import 'dart:convert';

import 'package:http/http.dart' as http;

String espActivateRequest = "http://192.168.1.114:8080/activate";
String espUrlDataRequest = "http://192.168.1.114:8080/data";

class Pin {
  bool state;
  int pin;
  int duration;

  Pin(this.state, this.pin, this.duration);
}

class PinManager {
    Future<String> activate(int pin, int duration) async {
      var url = Uri.parse(espActivateRequest);
      var response = await http.post(url,  headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },body: jsonEncode(<String, dynamic>{
        'state': true,
        'pin': pin,
        'duration': duration,
      }),);
      return response.body;
    }

    Future<String> data() async {
      var url = Uri.parse(espUrlDataRequest);
      var response = await http.get(url);
      return response.body;
    }
  }
