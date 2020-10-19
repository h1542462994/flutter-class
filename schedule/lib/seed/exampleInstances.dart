import 'package:schedule/common/dateTimeExtension.dart';
import 'package:schedule/models/index.dart';

/// 测试用例生成器，用于前期开发
class ExampleGenerator {
  static final String zjutNormal = "zjut.normal";
  static final String zjutExam = "zjut.exam";
  
  //课表生成器1，用于测试学校的标准时刻表
  TimeTable generateTimeTableNormal() {
    return TimeTable(
        zjutNormal,
        "浙江工业大学[日常]",
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

  //课表生成器2，用于生成考试的标准时刻表
  TimeTable generateTimeTableExam() {
    return TimeTable(
      zjutExam,
      "浙江工业大学[考试]",
      [
        TimeRow(1, 7, [
          TimeCell.s(TimeType.Am, "8:15", "9:45"),
          TimeCell.s(TimeType.Am, "9:45", "10:15"),
          TimeCell.s(TimeType.Pm, "13:30", "15:00"),
          TimeCell.s(TimeType.Pm, "15:00", "15:15"),
          TimeCell.s(TimeType.Evening, "18:30", "20:00"),
          TimeCell.s(TimeType.Evening, "20:00", "20:15")
        ])
      ]
    );
  }
  
  TermGroup generateTermGroup() {
    return TermGroup(
      "cht",
      [
        generateTimeTableNormal(),
        generateTimeTableExam()
      ],
      [
        Term(
          "2020#1", 
          "2020 上学期",
          zjutNormal, 
          DateTimeExtension.fromDate(2020, 9, 28),
          16,
          null),
        Term(
          "2020#1E",
          "2020 上学期(考试)",
          zjutExam,
          DateTimeExtension.fromDate(2021, 1, 18),
          2,
          null
        )
      ]
    );
  }
}