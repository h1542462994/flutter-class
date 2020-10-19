import 'package:path/path.dart';
import 'package:schedule/common/range.dart';

/// to describe a collection of range
class Ranges {
  Ranges(this.ranges);
  Ranges.s(String value) {
    var tokens = value.split(",");
    ranges = [];
    for(var token in tokens) {
      ranges.add(Range.s(token));
    }
  }

  List<Range> ranges;

  bool contains(int value){
    return ranges.where((element) => !element.contains(value)).isEmpty;
  }

  Ranges split(int value) {
    var tokens = ranges.map((e) => e.split(value));
    List<Range> rs = [];
    for (var token in tokens){
      rs.addAll(token.ranges);
    }
    return Ranges(rs);
  }

  @override
  String toString() {
    return ranges.join(",");
  }
}