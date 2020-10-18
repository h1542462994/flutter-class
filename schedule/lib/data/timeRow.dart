import 'package:schedule/data/index.dart';

class TimeRow {
  int rowStart; // begin of dayOfWeek, 1 means Monday, 7 means Sunday, etc
  int rowEnd; // end of dayOfWeek
  Iterable<TimeCell> timeCells;
  Iterable<TimeCell> cellsOfTimeType(TimeType type) => timeCells.where((timeCell) => timeCell.timeType == type); // calculating property, means cells on $type

  Iterable<TimeCell> get amCells => cellsOfTimeType(TimeType.Am); // calculating property, means cells on a.m
  Iterable<TimeCell> get pmCells => cellsOfTimeType(TimeType.Pm); // calculating property, means cells on p.m
  Iterable<TimeCell> get eveningCells => cellsOfTimeType(TimeType.Evening);

  TimeRow(this.rowStart, this.rowEnd,
      this.timeCells); // calculating property, means cells on evening
}