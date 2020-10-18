import 'package:flutter/cupertino.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

// 绘制课表主体的背景
class ClassTableBodyBackgroundPainter extends CustomPainter {
  ClassTableBodyBackgroundPainter(this.timeTableModel);

  final TimeTableModel timeTableModel;
  TimeTable get timeTable => timeTableModel.timeTable;

  @override
  void paint(Canvas canvas, Size size) {
    _paintLines(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _paintLines(Canvas canvas, Size size){
    // draw horizontal lines.
    var accumulateHeight = 0.0;
    // print(accumulateHeight);
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

    // draw first vertical line
    canvas.drawLine(
        Offset(Const.cornerWidth, 0),
        Offset(Const.cornerWidth, size.height),
        MyPaints.grayLinePaint);

    var accumulateWidth = Const.cornerWidth;
    var cellWidth = (size.width - Const.cornerWidth) / timeTableModel.daysCount;
    // draw other vertical lines
    for(int i = 0; i < timeTableModel.daysCount; ++i){
      accumulateWidth += cellWidth;
      var accumulateHeight1 = 0.0;
      var accumulateHeight2 = timeTable.amCountMax * Const.cellHeight;
      canvas.drawLine(
          Offset(accumulateWidth, accumulateHeight1),
          Offset(accumulateWidth, accumulateHeight2),
          MyPaints.grayLinePaint);

      accumulateHeight1 = accumulateHeight2 + Const.splitHeight;
      accumulateHeight2 = accumulateHeight1 + timeTable.pmCountMax * Const.cellHeight;
      canvas.drawLine(
          Offset(accumulateWidth, accumulateHeight1),
          Offset(accumulateWidth, accumulateHeight2),
          MyPaints.grayLinePaint);

      accumulateHeight1 = accumulateHeight2 + Const.splitHeight;
      accumulateHeight2 = accumulateHeight1 + timeTable.eveningCountMax * Const.cellHeight;
      canvas.drawLine(
          Offset(accumulateWidth, accumulateHeight1),
          Offset(accumulateWidth, accumulateHeight2),
          MyPaints.grayLinePaint);
    }
  }
}