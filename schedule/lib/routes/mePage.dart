import 'package:flutter/material.dart';
import 'package:schedule/l18n/gmLocalizations.dart';

// 个人信息页（对应于主页第3个菜单）
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(GmLocalizations.of(context).me),
      ),
    );
  }
}
