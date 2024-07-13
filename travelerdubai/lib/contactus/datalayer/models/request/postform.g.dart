// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostForm _$PostFormFromJson(Map<String, dynamic> json) => PostForm(
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
      mobilenumber: json['mobilenumber'] as String,
    );

Map<String, dynamic> _$PostFormToJson(PostForm instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
      'mobilenumber': instance.mobilenumber,
    };
