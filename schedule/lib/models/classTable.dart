import 'package:schedule/models/index.dart';

class ClassTable {
  ClassTable(this.cells);
  List<ClassCell> cells;

  Iterable<ClassCell> getShownCells(int index){
    return cells.takeWhile((value) => value.shown(index));
  }
}