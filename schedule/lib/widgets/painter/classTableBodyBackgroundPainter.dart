import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

// 绘制课表主体的背景
class ClassTableBodyBackgroundPainter extends CustomPainter {
  ClassTableBodyBackgroundPainter(this.pageIndex, this.timeTableModel);

  final TimeTableModel timeTableModel;
  final int pageIndex;
  // TODO: 修复timeTable的不一致性。
  TimeTable get timeTable => timeTableModel.getTimeTableFromPageIndex(pageIndex);

  @override
  void paint(Canvas canvas, Size size) {
    print("classTableBodyBackgroundPainter: paint");
    _paintLines(canvas, size);
    _paintLeftTexts(canvas, size);
    _paintCenterDecoration(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  // paint lines such as the horizontal lines and vertical lines.
  void _paintLines(Canvas canvas, Size size){
    // draw horizontal lines.
    var accumulateHeight = 0.0;
    // print(accumulateHeight);
    int groupIndex = 0;
    for(var groupCount in [timeTable.amCountMax, timeTable.pmCountMax, timeTable.eveningCountMax]){
      for(int i = 0; i < groupCount; ++i){
        accumulateHeight += Const.cellHeight;
        canvas.drawLine(
            Offset(0, accumulateHeight),
            Offset(size.width, accumulateHeight),
            MyPaints.graySquarePaint);
      }
      // groupIndex < 2 ensures not painting the last horizontal line.
      // you could rewrite 2 to 3 to show the effect.
      if(groupIndex < 2){
        accumulateHeight += Const.splitHeight;
        canvas.drawLine(
            Offset(0, accumulateHeight),
            Offset(size.width, accumulateHeight),
            MyPaints.graySquarePaint);
        ++groupIndex;
      }
    }

    // draw first vertical line
    canvas.drawLine(
        Offset(Const.cornerWidth, 0),
        Offset(Const.cornerWidth, size.height),
        MyPaints.graySquarePaint);

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
          MyPaints.graySquarePaint);

      accumulateHeight1 = accumulateHeight2 + Const.splitHeight;
      accumulateHeight2 = accumulateHeight1 + timeTable.pmCountMax * Const.cellHeight;
      canvas.drawLine(
          Offset(accumulateWidth, accumulateHeight1),
          Offset(accumulateWidth, accumulateHeight2),
          MyPaints.graySquarePaint);

      accumulateHeight1 = accumulateHeight2 + Const.splitHeight;
      accumulateHeight2 = accumulateHeight1 + timeTable.eveningCountMax * Const.cellHeight;
      canvas.drawLine(
          Offset(accumulateWidth, accumulateHeight1),
          Offset(accumulateWidth, accumulateHeight2),
          MyPaints.graySquarePaint);
    }
  }

  // to paint text(s) left of the table. contains the @index , @timeStart and @timeEnd
  void _paintLeftTexts(Canvas canvas, Size size) {
    // to generate the box and measure the height.
    var timeRow = timeTable.dayOfWeekTimeRow(timeTableModel.currentDate.weekday);
    int totalIndex = 0;
    double space1 = 4.0;
    double space2 = 0.0;
    // the tops of the texts
    var accumulateTops = [
      0,
      timeTable.amCountMax * Const.cellHeight + Const.splitHeight,
      (timeTable.amCountMax + timeTable.pmCountMax) * Const.cellHeight + 2 * Const.splitHeight];
    // the bottom of the texts
    var accumulateBottoms = [
      timeTable.amCountMax * Const.cellHeight,
      (timeTable.amCountMax + timeTable.pmCountMax) * Const.cellHeight + Const.splitHeight,
      size.height
    ];
    for(int groupIndex = 0; groupIndex < accumulateTops.length; ++groupIndex){
      var timeType = [TimeType.Am, TimeType.Pm, TimeType.Evening][groupIndex]; // get the timeType of the group.
      int index = 0;
      for (var cell in timeRow.cellsOfTimeType(timeType)) { // draw each group
        var paragraph1 = MyPaints.buildParagraph((totalIndex + 1).toString(), Const.cornerWidth, fontSize: 12, bold: true);
        var paragraph2 = MyPaints.buildParagraph(cell.beginTime.shortHourMinuteString, Const.cornerWidth);
        var paragraph3 = MyPaints.buildParagraph(cell.endTime.shortHourMinuteString, Const.cornerWidth);
        var _measureHeight = paragraph1.height + paragraph2.height + paragraph3.height + space1 + space2;
        var _offset = (Const.cellHeight - _measureHeight) / 2;
        var _top = accumulateTops[groupIndex] + _offset + Const.cellHeight * index;
        canvas.drawParagraph(paragraph1,
            Offset(0, _top));
        canvas.drawParagraph(paragraph2,
            Offset(0, _top + paragraph1.height + space1));
        canvas.drawParagraph(paragraph3,
            Offset(0, _top + paragraph1.height + space1 + paragraph2.height + space2));
        ++index;
        ++totalIndex;
      }
    }
  }

  // to paint decoration text(s). contains "lunch" and "dinner" in split area.
  void _paintCenterDecoration(Canvas canvas, Size size) {
    var _tops = [
      timeTable.amCountMax * Const.cellHeight,
      (timeTable.amCountMax + timeTable.pmCountMax) * Const.cellHeight + Const.splitHeight
    ]; //calculate the top of two elements.
    var _texts = [
      "午餐",
      "晚餐"
    ];
    for(var index in [0, 1]){
      canvas.drawRect(
          Rect.fromLTWH(
              Const.cornerWidth + 1, // 1 means not cover the border.
              (_tops[index] + 1.0),
              size.width - Const.cornerWidth - 2,
              Const.splitHeight - 2), MyPaints.lightRoseSquarePaint);
      Paragraph paragraph = MyPaints.buildParagraph(_texts[index], size.width - Const.cornerWidth);
      var _offset = (Const.splitHeight - paragraph.height) / 2;
      canvas.drawParagraph(paragraph,
          Offset(Const.cornerWidth, _tops[index] + _offset - 1)); // 1 means adjust the text position.
    }
  }
}