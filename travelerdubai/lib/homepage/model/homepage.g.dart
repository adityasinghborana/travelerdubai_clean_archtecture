// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomepageData _$HomepageDataFromJson(Map<String, dynamic> json) => HomepageData(
      id: json['id'] as int,
      detail: json['detail'] as String,
      gridSectionHeading: json['gridSectionHeading'] as String,
      gridSectionSubheading: json['gridSectionSubheading'] as String,
      heading1: json['heading1'] as String,
      heading2: json['heading2'] as String,
      heading3: json['heading3'] as String,
      imagePath: json['imagePath'] as String,
      imagePath2: json['imagePath2'] as String,
      imagePath3: json['imagePath3'] as String,
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$HomepageDataToJson(HomepageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detail': instance.detail,
      'gridSectionHeading': instance.gridSectionHeading,
      'gridSectionSubheading': instance.gridSectionSubheading,
      'heading1': instance.heading1,
      'heading2': instance.heading2,
      'heading3': instance.heading3,
      'imagePath': instance.imagePath,
      'imagePath2': instance.imagePath2,
      'imagePath3': instance.imagePath3,
      'subtitle': instance.subtitle,
      'title': instance.title,
    };
