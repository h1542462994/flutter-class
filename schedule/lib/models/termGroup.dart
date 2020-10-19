import 'package:flutter/cupertino.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/common/index.dart';

class TermGroup {
  TermGroup(this.userId, List<TimeTable> timeTables, this.terms){
    this.timeTables.clear();
    for(var item in timeTables){
      this.timeTables[item.key] = item;
    }
  }

  String userId;
  Map<String,TimeTable> timeTables = {};
  List<Term> terms = [];

  /// get the term from the index. the index means pageIndex shown in the pageViewer
  Term getTermFromIndex(int index) {
    if(index < 0 || index >= weekCount) {
      throw IndexError(index, terms);
    }
    int accumulateIndex = 0;
    for(var term in terms){
      accumulateIndex += term.lasting;
      if(index < accumulateIndex){
        return term;
      }
    }
    return null;
  }

  TimeTable getTimeTableFromTerm(Term term){
    return timeTables[term.timeTableKey];
  }

  DateTime weekStartOfIndex(int index) {
    if(index < 0 || index >= weekCount) {
      throw IndexError(index, terms);
    }
    int accumulateIndex0 = 0; // the last record of accumulateIndex.
    int accumulateIndex = 0; // the current record of accumulateIndex.
    for(var term in terms){
      accumulateIndex0 = accumulateIndex;
      accumulateIndex += term.lasting;

      if(index < accumulateIndex){
        var time = term.startDate.toStartWeekOfDay(DateTime.monday);
        time = time.add(Duration(days: 7 * (index - accumulateIndex0)));
        return time;
      }
    }

  }

  // get the total weekCount
  int get weekCount => terms.map((e) => e.lasting).reduce((value, element) => value + element);

  int currentIndexOfPageIndex(int index) {
    if(index < 0 || index >= weekCount) {
      throw IndexError(index, terms);
    }
    int accumulateIndex0 = 0; // the last record of accumulateIndex.
    int accumulateIndex = 0; // the current record of accumulateIndex.
    for(var term in terms){
      accumulateIndex0 = accumulateIndex;
      accumulateIndex += term.lasting;

      if(index < accumulateIndex){
        return index - accumulateIndex0;
      }
    }
    return -1;
  }
}