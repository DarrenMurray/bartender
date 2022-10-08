import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:animated_background/animated_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bartender mk1',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'Bartender'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _response = "";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _sendRequest() async {
    var url = Uri.parse("https://catfact.ninja/fact");
    var response = await http.get(url);
    setState(() {
      _response = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
        title: Text(widget.title,
          style: TextStyle(
          color: Colors.white,
            fontSize: 100)),
        backgroundColor: Color.fromRGBO(250, 128, 114 ,100),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16),
          children: [
            // drink card
            Card(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/real-drink-1.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align( alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(250, 128, 114 ,100),
                          ),
                          child: Text(' Passionfruit Martini ', style: TextStyle(color: Colors.white70))))
                      ,
                ),
              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            ),
            // end drink card
            // drink card
            Card(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/real-drink-2.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align( alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(250, 128, 114 ,100),
                          ),
                          child: Text(' Old Fashioned ', style: TextStyle(color: Colors.white70)))),
                ),
              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            ),
            // end drink card
            // drink card
            Card(
              child:
              InkWell(
                onTap: () {
                  print("test");
                },
                child:
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/real-drink-7.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align( alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(250, 128, 114 ,100),
                          ),
                          child: Text(' Strawberry Daquiri ', style: TextStyle(color: Colors.white70)))),
                ),
              ),
              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            ),
            // end drink card
            // drink card
            Card(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/real-drink-6.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align( alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(250, 128, 114 ,100),
                      ),
                      child: Text(' Gin & Tonic ', style: TextStyle(color: Colors.white70)))),
                ),
              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            ),
            // end drink card
            // drink card
            Card(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/real-drink-5.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align( alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(250, 128, 114 ,100),
                          ),
                          child: Text(' Margarita ', style: TextStyle(color: Colors.white70)))),
                ),
              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            ),
            // end drink card
            // drink card
            Card(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/real-drink-4.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align( alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(250, 128, 114 ,100),
                          ),
                          child: Text(' Rum & Orange ', style: TextStyle(color: Colors.white70))))),
              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            )
            // end drink card

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Order',
        hoverColor: Color.fromRGBO(251, 129, 115 , 1),
        backgroundColor: Color.fromRGBO(250, 128, 114 ,100),
        icon: Icon(Icons.local_drink),
        label: Text("Order")
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
