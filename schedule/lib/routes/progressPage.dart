import 'package:flutter/material.dart';
import 'package:schedule/l18n/gmLocalizations.dart';

/// 进度页（对应于主页第1个菜单）
class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(GmLocalizations.of(context).progress),
      ),
    );
  }
}
