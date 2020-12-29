import 'package:json_annotation/json_annotation.dart';

class ApiResponse {
    ApiResponse();

    num code;
    String summary;
    String message;
    Map<String, dynamic> data;
    
    factory ApiResponse.fromJson(Map<String,dynamic> json) {
        return ApiResponse()
            ..code = json['code'] as num
            ..summary = json['summary'] as String
            ..message = json['message'] as String
            ..data = json['data'];
    }
    Map<String, dynamic> toJson() => <String, dynamic> {
        'code': code,
        'summary': summary,
        'message': message,
        'data': data
    };
}
