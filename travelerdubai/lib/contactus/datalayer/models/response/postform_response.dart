import 'package:json_annotation/json_annotation.dart';
part 'postform_response.g.dart';


@JsonSerializable()
class PostFormResponse {
  final Result result;

  PostFormResponse({required this.result});

  factory PostFormResponse.fromJson(Map<String, dynamic> json) =>
      _$PostFormResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostFormResponseToJson(this);
}


@JsonSerializable()
class Result {
  final int id;
  final String name ;
  final String email ;
  final String message ;
  final String mobilenumber ;
  Result({required this.id,required this.name, required this.email, required this.message, required this.mobilenumber});

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}


