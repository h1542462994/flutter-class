import 'package:flutter/cupertino.dart';
import 'package:schedule/data/index.dart';

// 绘制课表主体的背景
class ClassTableBodyBackgroundPainter extends CustomPainter {
  ClassTableBodyBackgroundPainter(this.timeTable);

  final TimeTable timeTable;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _paintHorizontalLines(Canvas canvas, Size size){
    var accumulateHeight = 0.0;
    for(int i = 0; i < timeTable.amCountMax; ++i){

    }
  }
}