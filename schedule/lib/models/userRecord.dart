import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "userToken.dart";
part 'userRecord.g.dart';

@JsonSerializable()
class UserRecord {
    UserRecord();

    User user;
    UserToken userToken;
    
    factory UserRecord.fromJson(Map<String,dynamic> json) => _$UserRecordFromJson(json);
    Map<String, dynamic> toJson() => _$UserRecordToJson(this);
}
