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

  ClassCell(this.row, this.column, this.length, this.weeks, this.title, this.dest, this.teacher);
}