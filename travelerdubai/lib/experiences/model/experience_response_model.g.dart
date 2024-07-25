// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experiences _$ExperiencesFromJson(Map<String, dynamic> json) => Experiences(
      id: (json['id'] as num?)?.toInt(),
      tourId: (json['tourId'] as num?)?.toInt(),
      isvisible: json['isvisible'] as bool?,
      isvisibleCulturesandattractions:
          json['isvisibleCulturesandattractions'] as bool?,
      isvisibleDesertsafari: json['isvisibleDesertsafari'] as bool?,
      isvisibleDhowcruise: json['isvisibleDhowcruise'] as bool?,
      isvisibleWateractivities: json['isvisibleWateractivities'] as bool?,
      isvisibleReccomendedTours: json['isvisibleReccomendedTours'] as bool?,
      countryId: (json['countryId'] as num?)?.toInt(),
      countryName: json['countryName'] as String?,
      cityId: (json['cityId'] as num?)?.toInt(),
      cityName: json['cityName'] as String?,
      tourName: json['tourName'] as String?,
      duration: json['duration'] as String?,
      imagePath: json['imagePath'] as String?,
      cityTourTypeId: json['cityTourTypeId'] as String?,
      cityTourType: json['cityTourType'] as String?,
      isSlot: json['isSlot'] as bool?,
      contractId: (json['contractId'] as num?)?.toInt(),
      recommended: json['recommended'] as bool?,
      isPrivate: json['isPrivate'] as bool?,
      isVendorTour: json['isVendorTour'] as bool?,
      tourdetails: json['tourdetails'] == null
          ? null
          : TourModel.fromJson(json['tourdetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExperiencesToJson(Experiences instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'isvisible': instance.isvisible,
      'isvisibleReccomendedTours': instance.isvisibleReccomendedTours,
      'isvisibleDesertsafari': instance.isvisibleDesertsafari,
      'isvisibleCulturesandattractions':
          instance.isvisibleCulturesandattractions,
      'isvisibleDhowcruise': instance.isvisibleDhowcruise,
      'isvisibleWateractivities': instance.isvisibleWateractivities,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'tourName': instance.tourName,
      'duration': instance.duration,
      'imagePath': instance.imagePath,
      'cityTourTypeId': instance.cityTourTypeId,
      'cityTourType': instance.cityTourType,
      'isSlot': instance.isSlot,
      'contractId': instance.contractId,
      'recommended': instance.recommended,
      'isPrivate': instance.isPrivate,
      'isVendorTour': instance.isVendorTour,
      'tourdetails': instance.tourdetails,
    };
