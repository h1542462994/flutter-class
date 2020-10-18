import 'package:schedule/common/dateTimeExtension.dart';
import 'package:schedule/data/index.dart';

/// 测试用例生成器，用于前期开发
class ExampleGenerator {
  TimeTable generateTimeTable() {
    return TimeTable(
        "test",
        DateTime.parse("2020-09-28"),
        16,
        "上学期",
        [
          TimeRow(1,7,
            [
              TimeCell(TimeType.Am, DateTimeExtension.fromTime(8, 0), DateTimeExtension.fromTime(8, 45)),
              TimeCell(TimeType.Am, DateTimeExtension.fromTime(8, 55), DateTimeExtension.fromTime(9, 40)),
              TimeCell(TimeType.Am, DateTimeExtension.fromTime(9, 55), DateTimeExtension.fromTime(10, 40)),
              TimeCell(TimeType.Am, DateTimeExtension.fromTime(10, 50), DateTimeExtension.fromTime(11, 35)),
              TimeCell(TimeType.Am, DateTimeExtension.fromTime(11, 45), DateTimeExtension.fromTime(12, 30)),
              TimeCell(TimeType.Pm, DateTimeExtension.fromTime(13, 30), DateTimeExtension.fromTime(14, 15)),
              TimeCell(TimeType.Pm, DateTimeExtension.fromTime(14, 25), DateTimeExtension.fromTime(15, 10)),
              TimeCell(TimeType.Pm, DateTimeExtension.fromTime(15, 25), DateTimeExtension.fromTime(16, 10)),
              TimeCell(TimeType.Pm, DateTimeExtension.fromTime(16, 20), DateTimeExtension.fromTime(17, 05)),
              TimeCell(TimeType.Evening, DateTimeExtension.fromTime(18, 30), DateTimeExtension.fromTime(19, 15)),
              TimeCell(TimeType.Evening, DateTimeExtension.fromTime(19, 25), DateTimeExtension.fromTime(20, 10)),
              TimeCell(TimeType.Evening, DateTimeExtension.fromTime(20, 20), DateTimeExtension.fromTime(21, 05))
            ]
          )
        ]
    );
  }
}