// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      CityName: json['CityName'] as String,
      CityId: (json['CityId'] as num).toInt(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'CityId': instance.CityId,
      'CityName': instance.CityName,
    };
