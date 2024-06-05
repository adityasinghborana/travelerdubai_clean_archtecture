// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
      id: json['id'] as int?,
      TourId: json['TourId'] as int?,
      countryId: json['countryId'] as int?,
      countryName: json['countryName'] as String?,
      cityId: json['cityId'] as int?,
      cityName: json['cityName'] as String?,
      tourName: json['tourName'] as String?,
      duration: json['duration'] as String?,
      imagePath: json['imagePath'] as String?,
      cityTourTypeId: json['cityTourTypeId'] as String?,
      cityTourType: json['cityTourType'] as String?,
      tourDescription: json['tourDescription'] as String?,
      tourInclusion: json['tourInclusion'] as String?,
      tourShortDescription: json['tourShortDescription'] as String?,
      importantInformation: json['importantInformation'] as String?,
      itenararyDescription: json['itenararyDescription'] as String?,
      usefulInformation: json['usefulInformation'] as String?,
      childAge: json['childAge'] as String?,
      infantAge: json['infantAge'] as String?,
      infantCount: json['infantCount'] as int?,
      isSlot: json['isSlot'] as bool?,
      onlyChild: json['onlyChild'] as bool?,
      contractId: json['contractId'] as int?,
      startTime: json['startTime'] as String?,
      meal: json['meal'] as String?,
      googleMapUrl: json['googleMapUrl'] as String?,
      tourExclusion: json['tourExclusion'] as String?,
      tourImages: (json['tourImages'] as List<dynamic>?)
          ?.map((e) => TourImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cutOffhrs: json['cutOffhrs'] as int?,
    );

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
      'id': instance.id,
      'TourId': instance.TourId,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'tourName': instance.tourName,
      'duration': instance.duration,
      'imagePath': instance.imagePath,
      'cityTourTypeId': instance.cityTourTypeId,
      'cityTourType': instance.cityTourType,
      'tourDescription': instance.tourDescription,
      'tourInclusion': instance.tourInclusion,
      'tourShortDescription': instance.tourShortDescription,
      'importantInformation': instance.importantInformation,
      'itenararyDescription': instance.itenararyDescription,
      'usefulInformation': instance.usefulInformation,
      'childAge': instance.childAge,
      'infantAge': instance.infantAge,
      'infantCount': instance.infantCount,
      'isSlot': instance.isSlot,
      'onlyChild': instance.onlyChild,
      'contractId': instance.contractId,
      'startTime': instance.startTime,
      'meal': instance.meal,
      'googleMapUrl': instance.googleMapUrl,
      'tourExclusion': instance.tourExclusion,
      'tourImages': instance.tourImages,
      'cutOffhrs': instance.cutOffhrs,
    };

TourImageModel _$TourImageModelFromJson(Map<String, dynamic> json) =>
    TourImageModel(
      id: json['id'] as int?,
      tourId: json['tourId'] as int?,
      imagePath: json['imagePath'] as String?,
      imageCaptionName: json['imageCaptionName'] as String?,
      isFrontImage: json['isFrontImage'] as int?,
      isBannerImage: json['isBannerImage'] as int?,
      isBannerRotateImage: json['isBannerRotateImage'] as int?,
    );

Map<String, dynamic> _$TourImageModelToJson(TourImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'imagePath': instance.imagePath,
      'imageCaptionName': instance.imageCaptionName,
      'isFrontImage': instance.isFrontImage,
      'isBannerImage': instance.isBannerImage,
      'isBannerRotateImage': instance.isBannerRotateImage,
    };
