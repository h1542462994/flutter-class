import 'package:schedule/common/index.dart';

class ClassCell {
  /// weekday of the class.
  final int row;
  /// start section of the day.
  final int column;
  /// section length.
  final int length;
  /// weeks, matches pattern 1-8,10...
  final String weeks;
  /// title
  final String title;
  /// destination
  final String dest;
  /// teacher
  final String teacher;

  /// to justify whether the cell is shown by index.
  bool shown(int index){
    Ranges ranges = Ranges.s(weeks);
    return ranges.contains(index + 1);
  }

  ClassCell(this.row, this.column, this.length, this.weeks, this.title, this.dest, this.teacher);

  @override
  String toString() {
    // TODO: implement toString
    return "row:${this.row},column:${this.column},length:${this.length},weeks:${this.weeks},title:${this.title},dest:${this.dest},teacher:${this.teacher}";
  }
}