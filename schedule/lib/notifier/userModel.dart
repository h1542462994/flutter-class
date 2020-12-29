import 'package:schedule/common/global.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';

class UserModel extends BaseChangeNotifier {
  num get userCount => Global.valueOrDefault(profile.userCount, 0);
  num get currentIndex => Global.valueOrDefault(profile.currentIndex, -1);
  List<UserRecord> get user => profile.users;
  String get server => Global.valueOrDefault(profile.server, Const.defaultServer);
  bool get developOpen => Global.valueOrDefault(profile.developOpen, false);

  set userCount(num userCount) {
    profile.userCount = userCount;
    notify();
  }

  set currentIndex(num currentIndex) {
    profile.currentIndex = currentIndex;
    notify();
  }

  set server(String server) {
    profile.server = server;
    notify();
  }

  set developOpen(bool developOpen) {
    profile.developOpen = developOpen;
    notify();
  }

  bool get noUser {
    if(userCount == null || userCount == 0) {
      return true;
    } else {
      return false;
    }
    notify();
  }

  void notify() {
    notifyListeners();
  }
}