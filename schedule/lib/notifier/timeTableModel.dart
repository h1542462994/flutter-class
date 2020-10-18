

import 'package:schedule/common/global.dart';
import 'package:schedule/data/index.dart';

class TimeTableModel extends BaseChangeNotifier {
  TimeTable get timeTable => Global.timeTable;
}