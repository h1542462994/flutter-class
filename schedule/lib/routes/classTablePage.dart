import 'package:flutter/material.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/widgets/index.dart';

// 课表页（对应于主页第2个菜单）
class ClassTablePage extends StatefulWidget {
  @override
  _ClassTablePageState createState() => _ClassTablePageState();
}

class _ClassTablePageState extends State<ClassTablePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleBar("第 1 周"), // 标题栏
          ClassTableElement() // 主体
        ],
      )
    );
  }
}
