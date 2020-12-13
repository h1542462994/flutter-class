import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/notifier/index.dart';

import 'index.dart';

class Net {
  Net(this.userModel){
  }
  UserModel userModel;
  static Dio dio = new Dio(
    BaseOptions(
      baseUrl: "http://www.baidu.com",
    )
  );

  void init(){

  }

  Future<UserRecord> login(String uid, String password) async {
    var response = await dio.post("/user/login",queryParameters: {
      "uid": uid,
      "password": password
    });
    return UserRecord.fromJson(response.data);
  }

}