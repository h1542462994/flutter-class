import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/widgets/index.dart';

class TimeTableModel extends BaseChangeNotifier {
  TimeTableModel(){
    currentDate = DateTime.now().date;
  }

  int _pageIndex = 0;
  ColorPalette _colorPalette = ColorPalette();

  TermGroup get termGroup => Global.termGroup;
  // 三个属性由于不一致性的问题，以全部移动到对应的简便方法。
  /// the current term
  // Term get term => termGroup.getTermFromPageIndex(_pageIndex);
  // /// the current timeTable of term
  // TimeTable get timeTable => termGroup.getTimeTableFromTerm(term);
  // /// the index of the @term
  // int get currentIndex => termGroup.currentIndexOfPageIndex(_pageIndex);
  // //DateTime get startDate => termGroup.weekStartOfIndex(_index);

  /// the days shown in a week, it should be 5 or 7.
  int daysCount = 7;
  DateTime currentDate;

  int get pageIndex => _pageIndex;
  ColorPalette get colorPalette => _colorPalette;

  set pageIndex (int value) {
    _pageIndex = value;
    notifyListeners();
  }

  Iterable<ClassCell> getShownCellsFromPageIndex(int pageIndex){
    Term term = termGroup.getTermFromPageIndex(pageIndex);
    return term.classTable.getShownCells(termGroup.currentIndexOfPageIndex(pageIndex));
  }
  Term getTermFromPageIndex(int pageIndex) => termGroup.getTermFromPageIndex(pageIndex);
  TimeTable getTimeTableFromPageIndex(int pageIndex) => termGroup.getTimeTableFromTerm(getTermFromPageIndex(pageIndex));
  int getCurrentIndexFromPageIndex(int pageIndex) => termGroup.currentIndexOfPageIndex(pageIndex);
  double getTableHeightFromPageIndex(int pageIndex) {
    TimeTable timeTable = getTimeTableFromPageIndex(pageIndex);
    return Const.cellHeight * timeTable.countMax + 2 * Const.splitHeight;
  }
}