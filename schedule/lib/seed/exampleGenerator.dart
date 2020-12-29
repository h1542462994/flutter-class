import 'package:flutter/material.dart';
import 'package:schedule/common/dateTimeExtension.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/models/profile.dart';

/// 测试用例生成器，用于前期开发
class ExampleGenerator {
  static final String zjutNormal = "zjut.normal";
  static final String zjutExam = "zjut.exam";
  
  /// 课表生成器1，用于测试学校的标准时刻表
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

  /// 课表生成器2，用于生成考试的标准时刻表
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

  /// 生成cht的测试课表样例
  ClassTable generateChtClassTable(){
    return ClassTable(
      [
        ClassCell(1, 1, 2, "1-16", "编译原理", "屏峰校区 仁和208", "产思贤"),
        ClassCell(1, 3, 2, "1-16", "JavaEE技术", "屏峰校区 广A313", "韩姗姗,李伟"),
        ClassCell(1, 6, 2, "1-16", "操作系统原理", "屏峰校区 广B209", "何玲娜"),
        ClassCell(2, 6, 2, "1-16", "软件工程", "屏峰校区 广B207", "江颉"),
        ClassCell(2, 10, 2, "1-8", "Linux系统及其应用", "屏峰校区 计C311", "李甜甜"),
        ClassCell(3, 1, 2, "1-8", "操作系统原理", "屏峰校区 广B302", "何玲娜"),
        ClassCell(3, 6, 2, "1-16", "JavaEE技术", "屏峰校区 健B209", "韩姗姗,李伟"),
        ClassCell(3, 10, 2, "1-8", "C#程序设计", "屏峰校区 博易C503", "王松"),
        ClassCell(5, 1, 2, "1-8", "Linux系统及其应用", "屏峰校区 广A415", "李甜甜"),
        ClassCell(5, 8, 2, "1-8", "C#程序设计", "屏峰校区 博易C503", "王松"),
        ClassCell(4, 8, 2, "9-16", "软件工程", "屏峰校区 广B109", "江颉"),
        ClassCell(4, 6, 2, "1-8", "编译原理", "屏峰校区 仁和109", "产思贤"),
      ]
    );
  }

  /// 生成样例termGroup，用于进行前期的假数据测试
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
          generateChtClassTable()),
        Term(
          "2020#1E",
          "2020 上学期(考试)",
          zjutExam,
          DateTimeExtension.fromDate(2021, 1, 18),
          2,
          ClassTable([])
        )
      ]
    );
  }


//   Profile initializeProfile(Profile profile) {
//     if (profile == null) {
//       profile = Profile();
//     }
//
//     if (profile.userCount == null){
//       profile.userCount = 0;
//     }
//     if (profile.currentIndex == null) {
//       profile.currentIndex = 0;
//     }
//     if (profile.users == null) {
//       profile.users = List();
//     }
//     return profile;
//   }
}