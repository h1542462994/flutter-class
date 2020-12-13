import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/routes/homePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(MyApp());
}

/// 构建MyApp，整个应用的入口
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // 注册全局状态管理Provider
      providers: [
        ChangeNotifierProvider.value(value: TimeTableModel()),
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel())
      ],
      // consumer是一个statefulWidget
      child: Consumer2<ThemeModel, LocaleModel> (
        builder: (BuildContext context, themeModel, localeModel, Widget child) =>
            MaterialApp(
              theme: ThemeData(
                primarySwatch: themeModel.theme
              ),
              locale: Locale('zh', 'CN'),
              localeResolutionCallback: (Locale _locale, Iterable<Locale> supportedLocales) {
                if (localeModel.getLocale() != null) {
                  return localeModel.getLocale();
                } else {
                  Locale locale;
                  // app语言跟随系统语言，如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  // print(supportedLocales);
                  print("currentLocale: $_locale");
                  if(supportedLocales.contains(_locale)) {
                    locale = _locale;
                    Global.defaultLocale = _locale;
                  } else {
                    locale = Locale('en', 'US');
                    Global.defaultLocale = locale;
                  }
                  return locale;
                }
              },
              localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GmLocalizationsDelegate()
              ],
              supportedLocales: [
                const Locale('zh', 'CN'),
                const Locale('en', 'US'),
                const Locale('ja', 'JP')
              ],
              onGenerateTitle: (context) {
                return GmLocalizations.of(context).appTitle;
              },
              home: HomePage()
            )
      )
    );
  }
}
