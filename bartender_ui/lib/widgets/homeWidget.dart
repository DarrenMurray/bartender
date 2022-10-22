import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../alerts/alerts.dart';
import '../drinks/drink.dart';
import '../drinks/drinks.dart';
import '../global/order.dart' as order;
import '../global/logger.dart' as logs;
import 'drinkWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Homepage> {
  double _counter = 0.0;
  bool _isLoading = false;
  bool _alert = false;
  bool _selected = false;
  List<Drink> _drinksList = Drinks.Get();

  Future<void> _orderDrink() async {
    logs.info("pouring drink: ${order.drinkSelected.name}");
    if (!order.DrinkSelected()) {
      setState(() {
        _alert = true;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        _alert = false;
      });
      return;
    }

    double inc = 0.25;
    setState(() {
      _counter = _counter + inc;
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _counter = 1;
    });

    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      _counter = 0.0;
    });
  }

  // void _sendRequest() async {
  //   var url = Uri.parse("https://catfact.ninja/fact");
  //   var response = await http.get(url);
  //   setState(() {
  //     _response = response.body;
  //   });
  // }

  void selectDrink() {
    setState(() {
      _selected = true;
    });
  }

  Widget build(BuildContext context) {
    void rebuildAllChildren(BuildContext context) {
      void rebuild(Element el) {
        el.markNeedsBuild();
        el.visitChildren(rebuild);
      }
      (context as Element).visitChildren(rebuild);
    }

    rebuildAllChildren(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(widget.title,
            style: GoogleFonts.niconne(
              color: Color.fromRGBO(148, 59, 65, 1),
              fontSize: 100,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 0.4,
                  color: Color.fromARGB(255, 245, 244, 244),
                )
              ],
            )),
        backgroundColor: Color.fromRGBO(250, 128, 114, 1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              0.4,
              0.65,
              0.95,
            ],
            colors: [
              Colors.white,
              Colors.white70,
              Color.fromRGBO(241, 232, 139, 0.6),
              Color.fromRGBO(243, 228, 121, 0.7),
            ],
          )),
          child:
      Stack(children: [
        // Drinks Grid
        GridView.builder(
          itemCount: _drinksList.length,
          itemBuilder: (context, index) => DrinkTile(
              index,
              " ${_drinksList[index].name} ",
              _drinksList[index].description,
              _drinksList[index].imgPath,
              false,
              selectDrink),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 16),
        ),
        if (_isLoading || _alert)
          const Opacity(
            opacity: 0.7,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isLoading)
          Center(
            child: LoadingSpinner(_counter),
          ),
        if (_alert)
          Center(
            child: Alert(),
          ),
      ]),

            //
          // stack ends
          // ,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _orderDrink,
          tooltip: 'Order',
          hoverColor: Color.fromRGBO(251, 129, 115, 1),
          backgroundColor: Color.fromRGBO(250, 128, 114, 100),
          icon: Icon(Icons.local_drink),
          label: Text("Order")),
    );
  }
}
