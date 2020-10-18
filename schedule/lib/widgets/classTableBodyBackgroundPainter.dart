import 'package:flutter/cupertino.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/widgets/index.dart';

// 绘制课表主体的背景
class ClassTableBodyBackgroundPainter extends CustomPainter {
  ClassTableBodyBackgroundPainter(this.timeTable);

  final TimeTable timeTable;

  @override
  void paint(Canvas canvas, Size size) {
    _paintHorizontalLines(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _paintHorizontalLines(Canvas canvas, Size size){
    var accumulateHeight = 0.0;

    print(accumulateHeight);

    for(var groupCount in [timeTable.amCountMax, timeTable.pmCountMax, timeTable.eveningCountMax]){
      for(int i = 0; i < groupCount; ++i){
        accumulateHeight += Const.cellHeight;
        canvas.drawLine(
            Offset(0, accumulateHeight),
            Offset(size.width, accumulateHeight),
            MyPaints.grayLinePaint);
      }
      accumulateHeight += Const.splitHeight;
      canvas.drawLine(
          Offset(0, accumulateHeight),
          Offset(size.width, accumulateHeight),
          MyPaints.grayLinePaint);
    }
  }
}