import '../global/logger.dart' as logs;
import 'package:flutter/material.dart';

class FileReader {

  Future<String> loadAsset(BuildContext context) async {
    final yamlString = await DefaultAssetBundle.of(context)
        .loadString("assets/config/drinks.yaml");
        logs.info("reading drinks: $yamlString");
        return yamlString;
  }
}


