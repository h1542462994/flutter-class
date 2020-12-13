// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..uid = json['uid'] as String
    ..type = json['type'] as num
    ..groupType = json['groupType'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'type': instance.type,
      'groupType': instance.groupType,
      'name': instance.name,
      'email': instance.email
    };
