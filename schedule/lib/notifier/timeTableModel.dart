import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';

class TimeTableModel extends BaseChangeNotifier {
  TimeTableModel(){
    currentDate = DateTime.now().date;
  }

  /// current timeTable, it is just a test instance.
  TimeTable get timeTable => Global.timeTable;
  /// the days shown in a week, it should be 5 or 7.
  int daysCount = 7;
  DateTime currentDate;
  int _index = 0;
  int get index => _index;
  set index (int value) {
    _index = value;
    notifyListeners();
  }

}