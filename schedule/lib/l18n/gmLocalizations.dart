import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmResources.dart';
import 'package:schedule/notifier/index.dart';

/// 国际化资源类，当前适配了中文
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
}

/// 国际化代理类
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