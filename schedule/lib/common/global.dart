// 存储全局信息
import 'package:flutter/material.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/seed/exampleInstances.dart';

class Global {
  static Future init() async {
    // To initialize the global state
    ExampleGenerator exampleGenerator = ExampleGenerator();
    termGroup = exampleGenerator.generateTermGroup();
    color = Colors.lime;
  }

  static TermGroup termGroup;
  static MaterialColor color;
}

class BaseChangeNotifier extends ChangeNotifier {

}