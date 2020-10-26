// 存储全局信息
import 'package:flutter/material.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/repository/index.dart';
import 'package:schedule/seed/exampleGenerator.dart';

class Global {
  /// initialize the global services for the application.
  static Future init() async {
    // To initialize the global state
    ExampleGenerator exampleGenerator = ExampleGenerator();
    termGroup = exampleGenerator.generateTermGroup();
    color = Colors.lime;
  }

  static DbManager dbManager;
  static TermGroup termGroup;
  static MaterialColor color;

}

class BaseChangeNotifier extends ChangeNotifier {

}