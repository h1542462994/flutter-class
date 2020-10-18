import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// 国际化资源类，当前适配了中文
class GmLocalizations{
  Locale locale;
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

  String get appTitle => "课程表";
  String get progress => "进度";
  String get classTable => "课程表";
  String get me => "我的";
}

/// 国际化代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  @override
  bool isSupported(Locale locale) => ['zh'].contains(locale.languageCode);

  @override
  Future<GmLocalizations> load(Locale locale) {
    return SynchronousFuture<GmLocalizations>(
      GmLocalizations(Locale('zh','CN'))
    );
  }

  @override
  bool shouldReload(LocalizationsDelegate<GmLocalizations> old) => false;

}