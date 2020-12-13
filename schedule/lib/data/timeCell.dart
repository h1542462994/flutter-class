import 'package:schedule/common/dateTimeExtension.dart';
import 'package:schedule/data/index.dart';

class TimeCell {
  TimeType timeType; // timeType, 0 means a.m, 1 means p.m, 2 mean evening
  DateTime beginTime; // begin time
  DateTime endTime;

  TimeCell(this.timeType, this.beginTime, this.endTime); // end time
  TimeCell.s(this.timeType, String begin, String end){
    beginTime = DateTimeExtension.fromHourMinuteString(begin);
    endTime = DateTimeExtension.fromHourMinuteString(end);
  }
}