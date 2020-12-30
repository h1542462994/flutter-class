
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/models/index.dart';


class Net {
  Net();
  static int get ok => 200;

  static Dio dio = new Dio(
    BaseOptions(
      // baseUrl: "http://nfcv.xyz:9001",
      baseUrl: "http://192.168.42.91:9001"
    )
  );

  void init(){
    var server = (Global.profile.developOpen != false) ? Global.valueOrDefault(Global.profile.server, Const.defaultServer) : Const.defaultServer;
    dio.options.baseUrl = "http://$server";
    log("current server address: ${dio.options.baseUrl}", level: 0);
  }

  Future<ApiResponseT<UserRecord>> login(String uid, String password) async {
    init();

    var response = await dio.post("/user/login", queryParameters: {
      "uid": uid,
      "password": password
    });

    var result = ApiResponse.fromJson(response.data);
    //print(result.toJson());
    return ApiResponseT<UserRecord>.part(result).apply(UserRecord.fromJson(result.data));
  }

}