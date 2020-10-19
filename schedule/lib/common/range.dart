import 'package:schedule/common/index.dart';

/// a range \start,end\
class Range{
  int start;
  int end;

  Range(this.start, this.end);
  Range.s(String value){
    var tokens = value.split("-");
    if(tokens.length == 1){
      this.start = int.parse(tokens[0]);
      this.end = this.start;
    } else {
      this.start = int.parse(tokens[0]);
      this.end = int.parse(tokens[1]);
    }
  }

  @override
  String toString() {
    if(start < end) {
      return "$start-$end";
    } else {
      return "$start";
    }
  }

  Ranges split(int value){
    if(start <= value && end > value){
      return Ranges([
        Range(start, value),
        Range(value + 1, end)
      ]);
    } else {
      return Ranges([
        Range(start, end)
      ]);
    }
  }

  bool contains(int value){
    return this.start <= value && this.end >= value;
  }
}