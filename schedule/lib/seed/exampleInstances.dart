import 'package:schedule/common/dateTimeExtension.dart';
import 'package:schedule/models/index.dart';

/// 测试用例生成器，用于前期开发
class ExampleGenerator {
  //课表生成器1，用于测试学校的标准时刻表
  TimeTable generateTimeTable() {
    return TimeTable(
        "test",
        DateTime.parse("2020-09-28"),
        16,
        "上学期",
        [
          TimeRow(1,7,
            [
              TimeCell.s(TimeType.Am, "8:00", "8:45"),
              TimeCell.s(TimeType.Am, "8:55", "9:40"),
              TimeCell.s(TimeType.Am, "9:55", "10:40"),
              TimeCell.s(TimeType.Am, "10:50", "11:35"),
              TimeCell.s(TimeType.Am, "11:45", "12:30"),
              TimeCell.s(TimeType.Pm, "13:30", "14:15"),
              TimeCell.s(TimeType.Pm, "14:25", "15:10"),
              TimeCell.s(TimeType.Pm, "15:25", "16:10"),
              TimeCell.s(TimeType.Pm, "16:20", "17:05"),
              TimeCell.s(TimeType.Evening, "18:30", "19:15"),
              TimeCell.s(TimeType.Evening, "19:25", "20:10"),
              TimeCell.s(TimeType.Evening, "20:20", "21:05")
            ]
          )
        ]
    );
  }

  //课表
}