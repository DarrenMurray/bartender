import 'package:bartender_ui/io/fileReader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import '../global/order.dart' as globals;
import 'ingredient.dart';

class Drink {
  String name;
  String description;
  String imgPath;
  List<Ingredient> ingredients;

  Drink(this.name, this.description, this.imgPath, this.ingredients);
}