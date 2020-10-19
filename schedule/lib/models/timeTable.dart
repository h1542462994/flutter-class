import 'dart:math';
import 'package:schedule/models/index.dart';

class TimeTable {
  TimeTable(this.key, this.title,
      this.timeRows);

  // String userId; // references to User
  // DateTime startDate; // startDate
  // int lasting; // lasting week
  String key; // key
  String title; // title
  Iterable<TimeRow> timeRows;

  TimeRow dayOfWeekTimeRow(int dayOfWeek) {
    return timeRows.where((timeRow) => timeRow.rowStart <= dayOfWeek && timeRow.rowEnd >= dayOfWeek).first;
  }

  int countMaxOfTimeType(TimeType type) => timeRows.map((timeRow) => timeRow.cellsOfTimeType(type).length).reduce(max); // the max $type+Count in timeRows

  int get amCountMax => countMaxOfTimeType(TimeType.Am); // calculating property. the max amCount in timeRows
  int get pmCountMax => countMaxOfTimeType(TimeType.Pm); // calculating property. the max pmCount in timeRows
  int get eveningCountMax => countMaxOfTimeType(TimeType.Evening); // calculating property. the max pmCount in timeRows
  int get countMax => amCountMax + pmCountMax + eveningCountMax; // calculating property. the max Count in timeRows.
}