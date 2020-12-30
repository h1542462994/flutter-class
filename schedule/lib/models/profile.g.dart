// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..user = json['user'] == null
        ? null
        : UserRecord.fromJson(json['user'] as Map<String, dynamic>)
    ..locale = json['locale'] as String
    ..developOpen = json['developOpen'] as bool
    ..server = json['server'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'locale': instance.locale,
      'developOpen': instance.developOpen,
      'server': instance.server
    };
