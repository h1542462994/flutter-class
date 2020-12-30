import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:schedule/common/global.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/models/index.dart';

class UserModel extends BaseChangeNotifier {

  bool _loginState = false;
  bool _userState = true;
  String _loginMsg = "";
  Net _net = Net();

  UserRecord get user => profile.user;
  String get server => Global.valueOrDefault(profile.server, Const.defaultServer);
  bool get developOpen => Global.valueOrDefault(profile.developOpen, false);
  bool get noUser => user == null;
  bool get loginState => _loginState;
  bool get userState => _userState;
  String get loginMsg => _loginMsg;

  set server(String server) {
    profile.server = server;
    notify();
  }

  set developOpen(bool developOpen) {
    profile.developOpen = developOpen;
    notify();
  }

  set user(UserRecord user) {
    profile.user = user;
    notify();
  }

  set loginState(bool loginState){
    this._loginState = loginState;
    notify();
  }

  set userState(bool userState) {
    this._userState = userState;
    notify();
  }

  /// 进行登录操作
  Future login(String uid, String password) async {
    try {
      var res = await _net.login(uid, password);
      if (res.code == 200) {
        _loginMsg = "";
        loginState = true;
        userState = true;
        this.user = res.data;
      } else {
        _loginMsg = res.message;
        loginState = false;
      }
    } on DioError catch(e){
      log(e.message);
      _loginMsg = "网络异常";
      loginState = false;
    }
  }

  void notify() {
    notifyListeners();
  }
}