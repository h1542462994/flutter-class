class TimeRow {
  TimeRow(this.id, this.timeTableId, this.rowStart, this.rowEnd);
  final int id; // id.
  final int timeTableId; // references  to timeTable.
  final int rowStart; // begin of dayOfWeek, 1 means Monday, 7 means Sunday, etc
  final int rowEnd; // end of dayOfWeek
}