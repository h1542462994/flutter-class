import 'dart:ui' as ui;


import 'package:flutter/widgets.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';


class ClassTableBodyCellPainter extends CustomPainter {
  final int pageIndex;
  final TimeTableModel timeTableModel;
  TimeTable get timeTable => timeTableModel.getTimeTableFromPageIndex(pageIndex);
  double cellWidth;
  //ColorPalette colorPalette;

  ClassTableBodyCellPainter(this.pageIndex, this.timeTableModel);

  @override
  void paint(Canvas canvas, Size size) {
    print("classTableBodyCellPainter: paint");
    cellWidth = (size.width - Const.cornerWidth) / timeTableModel.daysCount;
    //colorPalette = ColorPalette();
    // TODO: FIX, 函数太复杂了，有待提高函数的可阅读性。
    var cells = timeTableModel.getShownCellsFromPageIndex(pageIndex);
    //print("classTableBodyCellPainter: paint ${cells.length} cell(s)");
    //var cells = this.timeTableModel.term.classTable.getShownCells(timeTableModel.pageIndex);
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
    double dy = 50; // 50 will be replaced
    if(range.end <= timeTable.amCountMax){
      dy = (range.start - 1) * Const.cellHeight;
    } else if(range.end <= timeTable.amCountMax + timeTable.pmCountMax) {
      dy = (range.start - 1) * Const.cellHeight + Const.splitHeight;
    } else {
      dy = (range.start - 1) * Const.cellHeight + 2 * Const.splitHeight;
    }

    double height = (range.end - range.start + 1) * Const.cellHeight;

    double squareMargin = Const.cellMargin;

    canvas.drawRRect(
        ui.RRect.fromRectAndRadius(
          Rect.fromLTWH(
            dx + squareMargin,
            dy + squareMargin,
            cellWidth - 2 * squareMargin,
            height - 2 * squareMargin),
        Radius.circular(Const.cellRadius)),
        MyPaints.colorSquarePaint(timeTableModel.colorPalette.generateBackground(cell.title))); // 根据title生成颜色，也就是说，同一个title对应的颜色是一致的。


    double paragraphMarginHorizontal = Const.paragraphMarginHorizontal;
    double paragraphLeft = dx + paragraphMarginHorizontal;
    double paragraphWidth = cellWidth - 2 * paragraphMarginHorizontal;

    Color color = timeTableModel.colorPalette.generateForeground(cell.title);
    ui.Paragraph paragraphTitle = MyPaints.buildParagraph(cell.title, paragraphWidth, fontSize: Const.fontSizeTitle, bold: true, color: color);
    ui.Paragraph paragraphDest = MyPaints.buildParagraph("@${cell.dest}", paragraphWidth, fontSize: Const.fontSizeSmallText, bold: false, color: color);
    ui.Paragraph paragraphTeacher = MyPaints.buildParagraph(cell.teacher, paragraphWidth, fontSize: Const.fontSizeSmallText, bold: false, color: color);
    double space = 1.0;

    // TODO: 解决高度溢出单元格的问题（动态调整cellHeight），将在1.1版本中解决 author:@cht
    double paragraphHeight = paragraphTitle.height + paragraphDest.height + paragraphTeacher.height + space;
    double _offset = dy + (height - paragraphHeight) / 2;
    canvas.drawParagraph(paragraphTitle, Offset(paragraphLeft, _offset));
    _offset += paragraphTitle.height + space;
    canvas.drawParagraph(paragraphDest, Offset(paragraphLeft, _offset));
    _offset += paragraphDest.height;
    canvas.drawParagraph(paragraphTeacher, Offset(paragraphLeft, _offset));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}