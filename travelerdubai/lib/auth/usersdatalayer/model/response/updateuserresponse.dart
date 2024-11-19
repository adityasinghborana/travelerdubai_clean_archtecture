import 'package:json_annotation/json_annotation.dart';
part 'updateuserresponse.g.dart';
@JsonSerializable()
class UpdateUserDetailResponse {
  final int id;
  final String uid;
  final String? username;
  final bool? isUser;
  final String email;
  final String? address;
  final int? age;
  final String? dob;


  UpdateUserDetailResponse({
    required this.id,
    required this.uid,
    required this.username,
    required this.isUser,
    required this.email,
    required this.address,
    required this.age,
    required this.dob,

  });

  factory UpdateUserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserDetailResponseToJson(this);
}
