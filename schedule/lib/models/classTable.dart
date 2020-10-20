import 'package:schedule/models/index.dart';

class ClassTable {
  ClassTable(this.cells);
  List<ClassCell> cells;

  Iterable<ClassCell> getShownCells(int index){
    //print(index);
    // TODO: FIX, 已经解决了缺少个别项的问题。
    return cells.where((value) => value.shown(index));
  }
}