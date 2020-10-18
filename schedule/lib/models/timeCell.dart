class TimeCell {
  TimeCell(this.id, this.timeCellId, this.timeType, this.beginTime, this.endTime);
  final int id; // id
  final int timeCellId; // references to timeCell
  final int timeType; // timeType, 0 means a.m, 1 means p.m, 2 mean evening
  final DateTime beginTime; // begin time
  final DateTime endTime; // end time
}