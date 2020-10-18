

import 'package:schedule/common/global.dart';
import 'package:schedule/data/index.dart';

class TimeTableModel extends BaseChangeNotifier {
  /// current timeTable, it is just a test instance.
  TimeTable get timeTable => Global.timeTable;
  /// the days shown in a week, it should be 5 or 7.
  int daysCount = 7;
  int dayOfWeek = 1;
  int _index = 0;
  int get index => _index;
  set index (int value) {
    _index = value;
    notifyListeners();
  }

}