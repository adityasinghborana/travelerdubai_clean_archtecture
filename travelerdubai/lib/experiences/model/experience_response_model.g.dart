// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experiences _$ExperiencesFromJson(Map<String, dynamic> json) => Experiences(
      id: json['id'] as int,
      tourId: json['tourId'] as int,
      isvisible: json['isvisible'] as bool?,
      isvisibleHome: json['isvisibleHome'] as bool?,
      countryId: json['countryId'] as int,
      countryName: json['countryName'] as String,
      cityId: json['cityId'] as int,
      cityName: json['cityName'] as String,
      tourName: json['tourName'] as String,
      reviewCount: json['reviewCount'] as int,
      rating: json['rating'] as int,
      duration: json['duration'] as String,
      imagePath: json['imagePath'] as String,
      imageCaptionName: json['imageCaptionName'] as String,
      cityTourTypeId: json['cityTourTypeId'] as String,
      cityTourType: json['cityTourType'] as String,
      tourShortDescription: json['tourShortDescription'] as String,
      cancellationPolicyName: json['cancellationPolicyName'] as String,
      isSlot: json['isSlot'] as bool,
      onlyChild: json['onlyChild'] as bool,
      contractId: json['contractId'] as int,
      recommended: json['recommended'] as bool,
      isPrivate: json['isPrivate'] as bool,
      tourdetails: (json['tourdetails'] as List<dynamic>?)
          ?.map((e) => TourModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperiencesToJson(Experiences instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'isvisible': instance.isvisible,
      'isvisibleHome': instance.isvisibleHome,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'tourName': instance.tourName,
      'reviewCount': instance.reviewCount,
      'rating': instance.rating,
      'duration': instance.duration,
      'imagePath': instance.imagePath,
      'imageCaptionName': instance.imageCaptionName,
      'cityTourTypeId': instance.cityTourTypeId,
      'cityTourType': instance.cityTourType,
      'tourShortDescription': instance.tourShortDescription,
      'cancellationPolicyName': instance.cancellationPolicyName,
      'isSlot': instance.isSlot,
      'onlyChild': instance.onlyChild,
      'contractId': instance.contractId,
      'recommended': instance.recommended,
      'isPrivate': instance.isPrivate,
      'tourdetails': instance.tourdetails,
    };
