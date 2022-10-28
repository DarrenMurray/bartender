import 'package:yaml/yaml.dart';

class Ingredient {
  String name;
  String type;
  int amount;

  Ingredient(this.name, this.type, this.amount);

  static List<Ingredient> yaml(YamlList yml){
    List<Ingredient> ingredients = [];
    for (var entry in yml) {
      var ingredient = Ingredient(entry.value["name"], entry.value["type"], entry.value["amount"]);
      ingredients.add(ingredient);
    }
    return ingredients;
  }
}
