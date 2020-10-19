
extension DateTimeExtension on DateTime {
  // get the date part of the datetime instance
  DateTime get date {
    return DateTime(this.year, this.month, this.day);
  }

  // get the time part of the datetime instance
  DateTime get time {
    return DateTime.fromMicrosecondsSinceEpoch((this.difference(this.date)).inMicroseconds);
  }

  String get shortMonthDayString {
    return "${this.month}/${this.day}";
  }

  String get shortHourMinuteString {
    return "${this.hour}:${this.minute < 10 ? "0${this.minute}" : this.minute}";
  }

  static DateTime local([int year = 1970, int month = 1, int day = 1, int hour = 0, int minute = 0, int second = 0, int millisecond = 0, int microsecond = 0]){
    // var now = DateTime.now();
    var time = DateTime(year, month, day, hour, minute, second, millisecond, microsecond);
    // time = time.subtract(now.timeZoneOffset);
    return time;
  }

  static DateTime fromDate(int year, int month, int day){
    return local(year, month, day);
  }

  static DateTime fromTime(int hour, int minute,  {int second = 0 ,int millisecond = 0, int microsecond = 0}){
    return local(1970, 1, 1, hour, minute, second, millisecond, microsecond);
  }

  static DateTime fromHourMinuteString(String str){
    var parts = str.split(":").map((e) => int.parse(e));
    print(parts.elementAt(0));
    return local(1970, 1, 1, parts.elementAt(0), parts.elementAt(1));

  }

  /// fit the date to the week's start date
  DateTime toStartWeekOfDay(int weekday) {
    if(this.weekday > weekday) {
      return this.subtract(Duration(days: (this.weekday - weekday)));
    } else if(this.weekday < weekday) {
      return this.subtract(Duration(days: this.weekday - weekday + 7));
    } else {
      return this;
    }
  }

}