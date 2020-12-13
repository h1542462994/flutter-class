// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserToken _$UserTokenFromJson(Map<String, dynamic> json) {
  return UserToken()
    ..uid = json['uid'] as String
    ..token = json['token'] as String
    ..created = json['created'] as String
    ..expired = json['expired'] as String;
}

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'uid': instance.uid,
      'token': instance.token,
      'created': instance.created,
      'expired': instance.expired
    };
