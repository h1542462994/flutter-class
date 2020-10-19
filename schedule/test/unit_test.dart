import 'package:flutter_test/flutter_test.dart';
import 'package:schedule/common/index.dart';

void main(){
  group('dateExtensionTest', () {
    DateTime now = DateTime.now();

    /// 搞不懂为什么hour是16.
    test("local func", () {
      DateTime timeInstance = DateTimeExtension.local(1970, 1, 1, 8, 0).subtract(now.timeZoneOffset); // there's something wrong in the unit test.

      print(now);
      print(timeInstance);
      expect(timeInstance.hour, 8);
      expect(timeInstance.minute, 0);
    });

    test("from", () {
      DateTime time = DateTimeExtension.fromTime(8, 0).subtract(now.timeZoneOffset);
      expect(time.hour, 8);
      expect(time.minute, 0);
    });
  });


}