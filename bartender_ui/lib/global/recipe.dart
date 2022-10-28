library recipe;
import 'package:bartender_ui/pins/pin.dart';

import '../global/logger.dart' as logs;

const String passionfruitMartini = "passionfruit-martini";

Map<String, Recipe> map = {
  passionfruitMartini: Recipe([Drink.Vodka, Drink.Passoa, Drink.LimeJuice]),
};

class Recipe {
  PinManager pm = PinManager();

  List<Drink> drinks;
  Recipe(this.drinks);

  Future<bool> Make() async {
    var sb = new StringBuffer();
    for (var drink in this.drinks) {
      logs.info("pouring drink: $drink");
      var res = await pm.activate(drink.pin, drink.duration);
      sb.write(res);
    }
    logs.info("request complete: ${sb.toString()}");

    return true;
  }
}

enum Drink {
  Vodka(15, 50000),
  Passoa(2, 30000),
  LimeJuice(5, 30000),
  Gin(22, 50000),
  Rum(18, 50000),
  GingerAle(19, 100000);

  const Drink(this.pin, this.duration);
  final int pin;
  final int duration;
}

extension DrinkExt on Drink {
  void Pour(){}

}

