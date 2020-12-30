import 'package:json_annotation/json_annotation.dart';
import "userRecord.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
    Profile();

    UserRecord user;
    String locale;
    bool developOpen;
    String server;
    
    factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
    Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
