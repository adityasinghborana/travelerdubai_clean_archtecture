import 'package:json_annotation/json_annotation.dart';
part 'postform.g.dart';
@JsonSerializable()
class PostForm {
final String name ;
final String email ;
final String message ;
final String mobilenumber ;
PostForm({required this.name, required this.email, required this.message, required this.mobilenumber});

  factory PostForm.fromJson(Map<String, dynamic> json) =>
      _$PostFormFromJson(json);
  Map<String, dynamic> toJson() => _$PostFormToJson(this);


}
