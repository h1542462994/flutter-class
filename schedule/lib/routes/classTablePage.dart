import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

// classTablePage View
class ClassTablePage extends StatefulWidget {
  @override
  _ClassTablePageState createState() => _ClassTablePageState();
}

class _ClassTablePageState extends State<ClassTablePage> {


  @override
  Widget build(BuildContext context) {
    TimeTableModel timeTableModel = Provider.of<TimeTableModel>(context);
    var term = timeTableModel.getTermFromPageIndex(timeTableModel.pageIndex);
    var currentIndex = timeTableModel.getCurrentIndexFromPageIndex(timeTableModel.pageIndex);
    return Container(
      child: Column(
        children: [
          TitleBar("${term.title} 第 ${currentIndex + 1} 周"), // 标题栏
          ClassTableElement() // 主体
        ],
      )
    );
  }
}
