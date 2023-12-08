import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

//data model for user
@freezed
class User with _$User {
  const factory User(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'phone_no') String? phone_no,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'token') String? token,
    
  ) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
