import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/routes/homePage.dart';


void main() async {
  await Global.init();
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider.value(value: ThemeModel())
      ],
      // consumer是一个statefulWidget
      child: Consumer<ThemeModel> (
        builder: (BuildContext context, themeModel, Widget child) =>
            MaterialApp(
              theme: ThemeData(
                primarySwatch: themeModel.theme
              ),
              localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GmLocalizationsDelegate()
              ],
              supportedLocales: [
                const Locale('zh', 'CN')
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
