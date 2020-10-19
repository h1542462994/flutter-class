import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';

class TimeTableModel extends BaseChangeNotifier {
  TimeTableModel(){
    currentDate = DateTime.now().date;
  }


  TermGroup get termGroup => Global.termGroup;
  /// the current term
  Term get term => termGroup.getTermFromIndex(_pageIndex);
  /// the current timeTable of term
  TimeTable get timeTable => termGroup.getTimeTableFromTerm(term);
  /// the index of the @term
  int get currentIndex => termGroup.currentIndexOfPageIndex(_pageIndex);
  //DateTime get startDate => termGroup.weekStartOfIndex(_index);

  /// the days shown in a week, it should be 5 or 7.
  int daysCount = 7;
  DateTime currentDate;
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex (int value) {
    _pageIndex = value;
    notifyListeners();
  }

}