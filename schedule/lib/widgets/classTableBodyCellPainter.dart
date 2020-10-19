import 'dart:ui' as ui;


import 'package:flutter/widgets.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';


class ClassTableBodyCellPainter extends CustomPainter {
  final int index;
  final TimeTableModel timeTableModel;
  TimeTable get timeTable => timeTableModel.timeTable;
  double cellWidth;

  ClassTableBodyCellPainter(this.index, this.timeTableModel);

  @override
  void paint(Canvas canvas, Size size) {
    cellWidth = (size.width - Const.cornerWidth) / timeTableModel.daysCount;
    var cells = this.timeTableModel.term.classTable.getShownCells(index);
    for(var cell in cells){
      int row = cell.row;
      int columnStart = cell.column;
      int columnEnd = cell.column + cell.length - 1;
      // ------ starts.. cut the cell to parts. ------
      Range range = Range(columnStart, columnEnd);
      Ranges r1 = range.split(timeTable.amCountMax);
      Ranges r2 = r1.split((timeTable.amCountMax + timeTable.pmCountMax)); // to split if the class cell is cross the lunch or dinner.
      // ------ ends.. cut the cell to parts. ------
      for(Range range in r2.ranges){
        _paintCell(canvas, cell, range);
      }
    }
  }

  void _paintCell(Canvas canvas, ClassCell cell, Range range){

    // print(cell);
    // print(range);
    double dx = Const.cornerWidth + (cell.row - 1) * cellWidth;
    double dy = 50;
    if(range.end <= timeTable.amCountMax){
      dy = (range.start - 1) * Const.cellHeight;
    } else if(range.end <= timeTable.amCountMax + timeTable.pmCountMax) {
      dy = (range.start - 1) * Const.cellHeight + Const.splitHeight;
    } else {
      dy = (range.start - 1) * Const.cellHeight + 2 * Const.splitHeight;
    }

    canvas.drawRect(
        ui.Rect.fromLTWH(
            dx + 2,
            dy + 2,
            cellWidth - 4,
            (range.end - range.start + 1) * Const.cellHeight - 4), MyPaints.graySquarePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}