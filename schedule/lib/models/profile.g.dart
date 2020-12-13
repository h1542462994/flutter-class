// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..userCount = json['userCount'] as num
    ..currentIndex = json['currentIndex'] as num
    ..users = (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserRecord.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..locale = json['locale'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'userCount': instance.userCount,
      'currentIndex': instance.currentIndex,
      'users': instance.users,
      'locale': instance.locale
    };
