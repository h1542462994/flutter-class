
import 'package:dio/dio.dart';
import 'package:schedule/data/apiResponseT.dart';
import 'package:schedule/models/index.dart';
import 'package:schedule/notifier/index.dart';


class Net {
  Net();
  static Dio dio = new Dio(
    BaseOptions(
      // baseUrl: "http://nfcv.xyz:9001",
      baseUrl: "http://192.168.137.1:9001"
    )
  );

  void init(){

  }

  Future<ApiResponseT<UserRecord>> login(String uid, String password) async {
    var response = await dio.post("/user/login", queryParameters: {
      "uid": uid,
      "password": password
    });

    var result = ApiResponse.fromJson(response.data);
    //print(result.toJson());
    return ApiResponseT<UserRecord>.part(result).apply(UserRecord.fromJson(result.data));
  }

}