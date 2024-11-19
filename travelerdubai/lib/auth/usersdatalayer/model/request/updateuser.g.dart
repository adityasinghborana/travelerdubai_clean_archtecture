// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUser _$UpdateUserFromJson(Map<String, dynamic> json) => UpdateUser(
      email: json['email'] as String,
      username: json['username'] as String,
      mobileNo: json['mobileNo'] as String,
      address: json['address'] as String,
      age: (json['age'] as num).toInt(),
      dob: json['dob'] as String,
    );

Map<String, dynamic> _$UpdateUserToJson(UpdateUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'mobileNo': instance.mobileNo,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob,
    };
