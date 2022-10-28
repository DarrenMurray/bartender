import 'package:bartender_ui/io/fileReader.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';
import '../global/logger.dart' as logs;
import 'drink.dart';
import 'ingredient.dart';

class Drinks {

  static List<Drink> Get() {
    List<Ingredient> mockIngreds = List.of([Ingredient("ice", "garnish", 1)]);

    return List.of([
      Drink("passionfruit-martini", "Passionfruit Martini",
          passionfruitDescription, "assets/images/real-drink-1.jpg",
          mockIngreds),
      Drink("g&t", "Gin & Ginger", gintonicDescription, "assets/images/real-drink-6.jpg",
          mockIngreds),
      Drink("old-fashioned", "Old Fashioned", "test",
          "assets/images/real-drink-2.jpg", mockIngreds),
      Drink("whiskey-sour", "Whiskey Sour", "test",
          "assets/images/real-drink-3.jpg", mockIngreds),
      // Drink("Rum & Orange", "test", "assets/images/real-drink-4.jpg", mockIngreds),
      // Drink("Margarita", "test", "assets/images/real-drink-5.jpg", mockIngreds),
      // Drink("Strawberry Daquiri", "test", "assets/images/real-drink-7.jpg", mockIngreds),
    ]);
  }

  static Future<List<Drink>> fromYaml(BuildContext context) async {
    List<Drink> drinks = [];
    var yamlString = await FileReader().loadAsset(context);
    try {
      final dynamic drinkYaml = loadYaml(yamlString.toString());
      var drinkList = Drinks.yaml(drinkYaml);
      drinks.addAll(drinkList);
    } catch (e) {
      logs.error(e, "unable to read drinks.yaml",);
    }

    return drinks;
  }

  static List<Drink> yaml(YamlMap yml) {
    List<Drink> drinks = [];
    for (var entry in yml.entries) {
      var nested = entry.value as YamlList;
      for (var e in nested[0]) {
        List<Ingredient> ingredients = Ingredient.yaml(
            e.value["ingredients"]);
        var drink = Drink(
            e.value["id"], e.value["name"], e.value["description"],
            e.value["imgPath"], ingredients);
        drinks.add(drink);
      }
    }
    return drinks;
  }

  static String passionfruitDescription = """ 
 This easy passion fruit cocktail is bursting with zingy flavours and is perfect for celebrating with friends. 
 Top with prosecco for a special drink
 
 Ingredients:
    - 50ml Vanilla Vodka
    - 50ml Passoa
    - 15ml Lime Juice
    - 50ml Syrup
    
  Garnishes:
    - 1 Passionfruit
    - Ice
    """;

  static String gintonicDescription = """ 
 A zesty gin cocktail with fresh ginger and lime, then topped off with ginger ale
 
 Ingredients:
    - 50ml Gin
    - 300ml Ginger Ale
    
  Garnishes:
    - 1 Honeycomb
    - 1 Lime Wedge
    - Ice
    """;
}
