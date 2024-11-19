// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateuserresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserDetailResponse _$UpdateUserDetailResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserDetailResponse(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      username: json['username'] as String?,
      isUser: json['isUser'] as bool?,
      email: json['email'] as String,
      address: json['address'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$UpdateUserDetailResponseToJson(
        UpdateUserDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'isUser': instance.isUser,
      'email': instance.email,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob,
    };
