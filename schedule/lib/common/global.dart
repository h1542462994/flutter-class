// 存储全局信息
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/seed/exampleInstances.dart';

class Global {
  static Future init() async {
    // To initialze the global state
    ExampleGenerator exampleGenerator = ExampleGenerator();
    timeTable = exampleGenerator.generateTimeTable();
    color = Colors.lime;
  }

  static TimeTable timeTable;
  static MaterialColor color;
}

class BaseChangeNotifier extends ChangeNotifier {

}