import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/global.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/classTableBodyBackgroundPainter.dart';
import 'package:schedule/widgets/classTableHeaderPainter.dart';

// 用于显示课表的空间，状态依赖于timeTableModel
class ClassTableElement extends StatefulWidget {
  @override
  _ClassTableElementState createState() => _ClassTableElementState();
}

class _ClassTableElementState extends State<ClassTableElement> {

  //int dayCount = 7;
  TimeTableModel timeTableModel;
  TimeTable get timeTable => timeTableModel.timeTable;
  Size size;

  @override
  Widget build(BuildContext context) {
    timeTableModel = Provider.of<TimeTableModel>(context);
    size = MediaQuery.of(context).size;
    return Expanded(
      child: PageView.custom( // PageView to show the all week of classTable
          childrenDelegate: SliverChildBuilderDelegate( // child builder delegate
            (context, index) {
              return Column(
                children: [
                  _buildHeader(index),
                  _buildBody(index)
                ],
              );
            },
            childCount: timeTable.lasting
          ),
        onPageChanged: _onPageViewPageChanged,
      )
    );
  }

  // 构建标题栏
  Widget _buildHeader(int index){
    return CustomPaint(
      painter: ClassTableHeaderPainter(index, timeTableModel), // header painter
      size: Size(size.width, Const.cornerHeight)
    );
  }

  // 构建表格栏
  Widget _buildBody(int index){
    return Expanded(
      child: SingleChildScrollView( // 可以滚动，以适应列表过长的情况
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            CustomPaint(
                painter: ClassTableBodyBackgroundPainter(timeTableModel), // table painter
                size: Size(size.width, _measureHeight())
            )
          ],
        ),
      )
    );
  }

  double _measureHeight(){ // measure the height of the body, it must matches the ::classTableBodyBackgroundPainter
    return Const.cellHeight * timeTable.CountMax + 2 * Const.splitHeight;
  }

  void _onPageViewPageChanged(int value) {
    timeTableModel.index = value;
  }
}
