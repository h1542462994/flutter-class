import 'dart:ui';

// globalization resource class
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
    "noLogin": ["未登录", "No Login"],
    "clickToLogin": ["点击登录或注册", "Click to login or register."],
    "login": ["登录", "Login"],
    "uid": ["用户名", "Uid"],
    "password": ["密码", "Password"],
    "uidEmpty": ["用户名不能为空", "username is empty"],
    "uidRange": ["用户名应在2-20位之间", "username length in [2-20]"],
    "uidReg": ["用户名仅包含数字，大小写字母，下划线", "username contains [dlL_]"],
    "passwordEmpty": ["密码不能为空", "password is empty"],
    "passwordRange": ["密码应在6-128位之间", "password length in [6-128]"],
    "register": ["注册", "Register"],
    "developSettings": ["开发者设置", "Develop Settings"],
    "serverDest": ["服务地址", "Server Dest"],
    "on": ["开启", "On"],
    "off": ["关闭", "Off"],
    "userStateOk": ["正常", "Normal"],
    "userStateFail": ["自动登录异常", "Auto login Failed"],
    "exitLogin": ["退出登录", "Exit Login"]
  };
  Map<int, List<String>> weekResources = {
    0: ["周一", "Mon.", "月曜日"],
    1: ["周二", "Tus.", "火曜日"],
    2: ["周三", "Wen.", "水曜日"],
    3: ["周四", "Thur.", "木曜日"],
    4: ["周五", "Fri.", "金曜日"],
    5: ["周六", "Sat.", "土曜日"],
    6: ["周日", "Sun.", "日曜日"]
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