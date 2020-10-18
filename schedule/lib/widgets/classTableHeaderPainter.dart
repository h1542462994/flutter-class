import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

// 绘制课表的标题
class ClassTableHeaderPainter extends CustomPainter {
  ClassTableHeaderPainter(this.index, this.timeTableModel);

  final int index;
  final TimeTableModel timeTableModel;
  /// property. the timeTable instance in model.
  TimeTable get timeTable => timeTableModel.timeTable;
  /// property. the days in a week.
  int get daysCount => timeTableModel.daysCount;
  /// calculating property. the start date of the week at this index.
  DateTime get dateStart {
    return timeTable.startDate.toStartWeekOfDay(DateTime.monday)
      .add(Duration(days: 7 * index));
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), MyPaints.grayLinePaint);
    double cellWidth = (size.width - Const.cornerWidth) / daysCount;
    for(int i = 0; i < daysCount; ++i){
      ui.Paragraph paragraph = MyPaints.buildParagraph("周${getWeekOfDayText(i)}", cellWidth); // 构造一个Paragraph
      double offsetHeight = 8;
      double space = 2;
      double height = paragraph.height; // 周x的高度
      canvas.drawParagraph(
          paragraph,
          Offset(Const.cornerWidth + cellWidth * i, offsetHeight)
      );
      var paragraph2 = MyPaints.buildParagraph(dateStart.add(Duration(days: i)).shortMonthString, cellWidth, fontSize: 8);
      canvas.drawParagraph(
          paragraph2,
          Offset(Const.cornerWidth + cellWidth * i, height + offsetHeight + space));
    }

  }
  


  String getWeekOfDayText(int index){
    List<String> list = ["一","二","三","四","五","六","日"];
    return list[index];
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}