extension DateTimeExtension on DateTime {
  // get the date part of the datetime instance
  DateTime get date {
    return DateTime.utc(this.year, this.month, this.day);
  }

  // get the time part of the datetime instance
  DateTime get time {
    return DateTime.fromMicrosecondsSinceEpoch((this.difference(this.date)).inMicroseconds);
  }

  String get shortMonthString {
    return "${this.month}/${this.day}";
  }

  static DateTime fromDate(int year, int month, int day){
    return DateTime.utc(year, month, day);
  }

  static DateTime fromTime(int hour, int minute,  {int second = 0 ,int millisecond = 0, int microsecond = 0}){
    return DateTime.utc(1970, 1, 1, hour, minute, second, millisecond, microsecond);
  }


}