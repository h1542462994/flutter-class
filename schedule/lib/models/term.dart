import 'package:schedule/models/index.dart';

class Term {
  final String key;
  final String title;
  final String timeTableKey;
  final DateTime startDate;
  final int lasting;
  final ClassTable classTable;

  Term(this.key, this.title, this.timeTableKey, this.startDate, this.lasting, this.classTable);
}