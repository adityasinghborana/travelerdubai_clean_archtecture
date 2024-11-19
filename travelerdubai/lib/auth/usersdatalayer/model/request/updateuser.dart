import 'package:json_annotation/json_annotation.dart';

part 'updateuser.g.dart';
@JsonSerializable()
class UpdateUser {
  String email;
  String username;
  String mobileNo;
  String address;
  int age;
  String dob;

  UpdateUser({
    required this.email,
    required this.username,
    required this.mobileNo,
    required this.address,
    required this.age,
    required this.dob,
  });

  factory UpdateUser.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserToJson(this);
}
