import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

// 用于显示课表的空间，状态依赖于timeTableModel
class ClassTableElement extends StatefulWidget {
  @override
  _ClassTableElementState createState() => _ClassTableElementState();
}

class _ClassTableElementState extends State<ClassTableElement> {

  //int dayCount = 7;
  TimeTableModel timeTableModel;
  //TimeTable get timeTable => timeTableModel.timeTable;
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
            childCount: timeTableModel.termGroup.weekCount // to expand our terms to the pageViewer
          ),
        onPageChanged: _onPageViewPageIndexChanged,
        controller: PageController(initialPage: timeTableModel.pageIndex), // initialize the controller to make sure the state truly.
      )
    );
  }

  // 构建标题栏
  Widget _buildHeader(int pageIndex){
    return RepaintBoundary(
      child: CustomPaint(
          painter: ClassTableHeaderPainter(pageIndex, timeTableModel), // header painter
          size: Size(size.width, Const.cornerHeight)
      ),
    );
  }

  // 构建表格栏
  Widget _buildBody(int pageIndex){
    return Expanded(
      child: SingleChildScrollView( // 可以滚动，以适应列表过长的情况
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            RepaintBoundary(
              child: CustomPaint(
                  painter: ClassTableBodyBackgroundPainter(pageIndex, timeTableModel), // table painter
                  size: Size(size.width, timeTableModel.getTableHeightFromPageIndex(pageIndex))
              ),
            ) ,
            RepaintBoundary(
              child: CustomPaint(
                  painter: ClassTableBodyCellPainter(pageIndex, timeTableModel),
                  size: Size(size.width, timeTableModel.getTableHeightFromPageIndex(pageIndex))
              ),
            )
          ],
        ),
      )
    );
  }

  // the function has move to timeTableModel
  // double _measureHeight(){ // measure the height of the body, it must matches the ::classTableBodyBackgroundPainter
  //   return Const.cellHeight * timeTable.countMax + 2 * Const.splitHeight;
  // }

  void _onPageViewPageIndexChanged(int value) {
    timeTableModel.pageIndex = value;
  }
}
