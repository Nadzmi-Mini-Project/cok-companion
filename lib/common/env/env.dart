import 'dart:convert';

import 'package:flutter/services.dart';

abstract class Env {
  static Map<String, dynamic> _env = {};

  static Future init() async {
    final envString = await rootBundle.loadString('env.json');
    _env = json.decode(envString) as Map<String, dynamic>;
  }

  static String getEnvironment() {
    return _env['env'] as String;
  }
}
