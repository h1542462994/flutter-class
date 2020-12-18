// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse()
    ..code = json['code'] as num
    ..summary = json['summary'] as String
    ..message = json['message'] as String
    ..data = json['data'];
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'summary': instance.summary,
      'message': instance.message,
      'data': instance.data
    };
