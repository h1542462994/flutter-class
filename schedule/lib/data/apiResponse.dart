import 'package:json_annotation/json_annotation.dart';
part 'apiResponse.g.dart';

@JsonSerializable()
class ApiResponse {
    ApiResponse();

    num code;
    String summary;
    String message;
    Map<String, dynamic> data;
    
    factory ApiResponse.fromJson(Map<String,dynamic> json) => _$ApiResponseFromJson(json);
    Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
