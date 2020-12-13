import 'package:schedule/common/global.dart';
import 'package:schedule/models/index.dart';

class UserModel extends BaseChangeNotifier {
  num get userCount => profile.userCount;
  num get currentIndex => profile.currentIndex;
  List<UserRecord> get user => profile.users;

  set userCount(num userCount) {
    profile.userCount = userCount;
  }

  set currentIndex(num currentIndex) {
    profile.currentIndex = currentIndex;
  }

  bool get noUser {
    if(userCount == null || userCount == 0) {
      return true;
    } else {
      return false;
    }
  }

  void notify() {
    notifyListeners();
  }
}