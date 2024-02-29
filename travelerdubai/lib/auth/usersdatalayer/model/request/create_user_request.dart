import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';


@JsonSerializable()
class User {

  String uid;


  String email;




  // Add other fields and relationships as needed

  User({

    required this.uid,


    required this.email,


    // Add other fields and relationships as needed
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}