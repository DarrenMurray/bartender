import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Drinks {

static List<Drink> FromYaml(){
  return List.of([
    Drink("Passionfruit Martini", "test", "assets/images/real-drink-1.jpg"),
    Drink("Old Fashioned", "test", "assets/images/real-drink-2.jpg"),
    Drink("Whiskey Sour", "test", "assets/images/real-drink-3.jpg"),
    Drink("Rum & Orange", "test", "assets/images/real-drink-4.jpg"),
    Drink("Margarita", "test", "assets/images/real-drink-5.jpg"),
    Drink("Gin & Tonic", "test", "assets/images/real-drink-6.jpg"),
    Drink("Strawberry Daquiri", "test", "assets/images/real-drink-7.jpg"),
    Drink("Passionfruit Martini", "test", "assets/images/real-drink-8.jpg"),

  ]);
}
}

class Drink {
  String name;
  String description;
  String imgPath;

  Drink(this.name, this.description, this.imgPath);
}

class DrinkItem {
  String name;
  String description;
  int index;

  DrinkItem(this.name, this.description, this.index);
}

class DrinkTile extends StatefulWidget {
  final int itemNo;
  final String name;
  final String img;
  final String description;
  bool state;
  VoidCallback selectDrink;

  DrinkTile(this.itemNo, this.name, this.description, this.img, this.state, this.selectDrink);


  @override
  State<DrinkTile> createState() => _MyDrinkState(
      this.itemNo,
      this.name,
      this.description,
      this.img,
      this.state,
      this.selectDrink
  );
}

class _MyDrinkState extends State<DrinkTile> {
  final int itemNo;
  final String name;
  final String img;
  final String description;
  bool state;
  VoidCallback selectDrink;

  _MyDrinkState(this.itemNo, this.name, this.description, this.img, this.state, this.selectDrink);

  double selectedState(int item) {
    return item == globals.drinkSelected.index ? 1 : 0;
  }

  bool selectedStateBool(int item) {
    return item == globals.drinkSelected.index;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => {
          this.state = false,
        this.selectDrink(),
        globals.drinkSelected = DrinkItem(this.name, this.description, this.itemNo)
      },
        child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Color.fromRGBO(
                        250, 128, 114, selectedState(this.itemNo)),
                    width: 3),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(this.img))),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(250, 128, 114, 1),
                          ),
                          child: Text(this.name,
                              style: TextStyle(color: Colors.white70)))),
                ),
                Visibility(
                    visible: selectedStateBool(this.itemNo),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(250, 128, 114, 0.4),
                                ),
                                child: Text(this.description,
                                    style: TextStyle(color: Colors.white70))))))
              ],
            )),
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
    );
  }
}

