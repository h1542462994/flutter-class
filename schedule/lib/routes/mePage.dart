import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

// 个人信息页（对应于主页第3个菜单）
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {


  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleBar(GmLocalizations.of(context).me),
            // 用户设置
            UserComponent(),
            // 全局设置
            SettingsComponent(),
          ],
        )
      ),
    );
  }
}
