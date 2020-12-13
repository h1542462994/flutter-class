import 'package:json_annotation/json_annotation.dart';

part 'userToken.g.dart';

@JsonSerializable()
class UserToken {
    UserToken();

    String uid;
    String token;
    String created;
    String expired;
    
    factory UserToken.fromJson(Map<String,dynamic> json) => _$UserTokenFromJson(json);
    Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}
