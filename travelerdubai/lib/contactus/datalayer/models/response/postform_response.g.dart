// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postform_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFormResponse _$PostFormResponseFromJson(Map<String, dynamic> json) =>
    PostFormResponse(
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostFormResponseToJson(PostFormResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
      mobilenumber: json['mobilenumber'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
      'mobilenumber': instance.mobilenumber,
    };
