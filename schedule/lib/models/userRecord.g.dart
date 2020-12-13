// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userRecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRecord _$UserRecordFromJson(Map<String, dynamic> json) {
  return UserRecord()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..userToken = json['userToken'] == null
        ? null
        : UserToken.fromJson(json['userToken'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserRecordToJson(UserRecord instance) =>
    <String, dynamic>{'user': instance.user, 'userToken': instance.userToken};
