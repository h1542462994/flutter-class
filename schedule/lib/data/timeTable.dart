import 'dart:math';

import 'package:schedule/data/index.dart';

class TimeTable {
  TimeTable(this.userId, this.startDate, this.lasting, this.title,
      this.timeRows);

  String userId; // references to User
  DateTime startDate; // startDate
  int lasting; // lasting week
  String title; // title
  Iterable<TimeRow> timeRows;

  TimeRow dayOfWeekTimeRow(int dayOfWeek) {
    return timeRows.where((timeRow) => timeRow.rowStart <= dayOfWeek && timeRow.rowEnd >= dayOfWeek).first;
  }

  int countMaxOfTimeType(TimeType type) => timeRows.map((timeRow) => timeRow.cellsOfTimeType(type).length).reduce(max); // the max $type+Count in timeRows

  int get amCountMax => countMaxOfTimeType(TimeType.Am); // calculating property. the max amCount in timeRows
  int get pmCountMax => countMaxOfTimeType(TimeType.Pm); // calculating property. the max pmCount in timeRows
  int get eveningCountMax => countMaxOfTimeType(TimeType.Evening); // calculating property. the max pmCount in timeRows
  int get CountMax => amCountMax + pmCountMax + eveningCountMax;
}