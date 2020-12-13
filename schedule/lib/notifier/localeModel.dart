import 'dart:ui';

import 'package:schedule/common/global.dart';

class LocaleModel extends BaseChangeNotifier {
  /// 获取Locale的配置
  Locale getLocale() {
    if(profile.locale == null) return null;
    var t = profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  String get locale => profile.locale;
  set locale(String locale) {
    if(locale != profile.locale) {
      profile.locale = locale;
      notifyListeners();
    }
  }
}