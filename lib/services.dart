import 'package:flutter/services.dart' show rootBundle;

Future<String> getJson() {
  return rootBundle.loadString('json_data.json');
}