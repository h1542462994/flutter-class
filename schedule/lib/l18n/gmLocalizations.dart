import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmResources.dart';
import 'package:schedule/notifier/index.dart';

/// globalization class
class GmLocalizations{
  Locale locale;
  GmResources _resources = GmResources();
  GmLocalizations(this.locale){
    if(locale == null){
      this.locale = Locale('zh','CN');
    } else {
      this.locale = locale;
    }
  }



  static GmLocalizations of(BuildContext context){
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }
  int get index => _resources.index(locale);

  String localeName(Locale locale){
    if(locale == null) {
      return Const.chineseSimplified;
    }
    if(locale.languageCode == 'en') {
      return Const.english;
    } else if(locale.languageCode == 'ja') {
      return Const.japanese;
    } else {
      return Const.chineseSimplified;
    }
  }
  String weekDayText(int weekDay) {
    return _resources.getWeek(weekDay, this.index);
  }

  String get appTitle => _resources.get("appTitle", index);
  String get progress => _resources.get("progress", index);
  String get localeAuto => "${_resources.get("auto", index)}(${localeName(Global.defaultLocale)})";
  String get classTable => _resources.get("classTable", index);
  String get me => _resources.get("me", index);
  String get user => _resources.get("user", index);
  String get userSettings => _resources.get("userSettings", index);
  String get globalSettings => _resources.get("globalSettings", index);
  String get language => _resources.get("language", index);
  String get currentLocale => localeName(locale);
  String get lunch => _resources.get("lunch", index);
  String get dinner => _resources.get("dinner", index);
  String get noLogin => _resources.get("noLogin", index);
  String get clickToLogin => _resources.get("clickToLogin", index);
  String get login => _resources.get("login", index);
  String get uid => _resources.get("uid", index);
  String get password => _resources.get("password", index);
  String get uidEmpty => _resources.get("uidEmpty", index);
  String get uidRange => _resources.get("uidRange", index);
  String get uidReg => _resources.get("uidReg", index);
  String get passwordEmpty => _resources.get("passwordEmpty", index);
  String get passwordRange => _resources.get("passwordRange", index);
  String get register => _resources.get("register", index);
  String get developSettings => _resources.get("developSettings", index);
  String get serverDest => _resources.get("serverDest", index);
  String get on => _resources.get("on", index);
  String get off => _resources.get("off", index);
}

/// globalization delegate class
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  @override
  bool isSupported(Locale locale) => ['zh', 'ja', 'en'].contains(locale.languageCode);

  @override
  Future<GmLocalizations> load(Locale locale) {
    print("current locale: $locale");
    return SynchronousFuture<GmLocalizations>(
      GmLocalizations(locale)
    );
  }

  @override
  bool shouldReload(LocalizationsDelegate<GmLocalizations> old) => false;

}