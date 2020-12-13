

import 'dart:ui';

class GmResources {
  int _defaultIndex = 1;

  Map<String, List<String>> resources = {
    "appTitle": ["计划", "schedule"],
    "progress": ["进度", "Progress"],
    "auto": ["跟随系统语言", "Auto"],
    "classTable": ["课程表", "ClassTable"],
    "me": ["我的", "Me"],
    "user": ["用户", "User"],
    "userSettings": ["用户设置", "UserSettings"],
    "globalSettings": ["全局设置", "GlobalSettings"],
    "language": ["语言", "Language"],
    "lunch": ["午餐", "Lunch"],
    "dinner": ["晚餐", "Dinner"],
  };
  Map<int, List<String>> weekResources = {
    0: ["周一", "Mon.", "月曜日"],
    1: ["周二", "Tus.", "火曜日"],
    2: ["周三", "Wen.", "水曜日"],
    3: ["周四", "Thur.", "木曜日"],
    4: ["周五", "Fri.", "金曜日"],
    5: ["周六", "Sat.", "土曜日"],
    6: ["周日", "Sum.", "日曜日"]
  };

  int index(Locale locale) {
    if(locale.languageCode == 'zh') {
      return 0;
    } else if(locale.languageCode == 'ja') {
      return 2;
    } else {
      return 1;
    }
  }

  String get(String key, int index) {
    var sequences = resources[key];
    if(index >= sequences.length) {
      index = _defaultIndex;
    }
    return sequences[index];
  }
  String getWeek(int weekDay, int index) {
    var sequences = weekResources[weekDay];
    if(index >= sequences.length) {
      index = _defaultIndex;
    }
    return sequences[index];
  }
}