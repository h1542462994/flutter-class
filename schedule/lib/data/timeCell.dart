import 'package:schedule/data/index.dart';

class TimeCell {
  TimeType timeType; // timeType, 0 means a.m, 1 means p.m, 2 mean evening
  DateTime beginTime; // begin time
  DateTime endTime;

  TimeCell(this.timeType, this.beginTime, this.endTime); // end time
}