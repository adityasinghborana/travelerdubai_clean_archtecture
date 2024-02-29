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
      reviewCount: json['reviewCount'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      duration: json['duration'] as String?,
      departurePoint: json['departurePoint'] as String?,
      reportingTime: json['reportingTime'] as String?,
      tourLanguage: json['tourLanguage'] as String?,
      imagePath: json['imagePath'] as String?,
      imageCaptionName: json['imageCaptionName'] as String?,
      cityTourTypeId: json['cityTourTypeId'] as String?,
      cityTourType: json['cityTourType'] as String?,
      tourDescription: json['tourDescription'] as String?,
      tourInclusion: json['tourInclusion'] as String?,
      tourShortDescription: json['tourShortDescription'] as String?,
      raynaToursAdvantage: json['raynaToursAdvantage'] as String?,
      whatsInThisTour: json['whatsInThisTour'] as String?,
      importantInformation: json['importantInformation'] as String?,
      itenararyDescription: json['itenararyDescription'] as String?,
      usefulInformation: json['usefulInformation'] as String?,
      faqDetails: json['faqDetails'] as String?,
      termsAndConditions: json['termsAndConditions'] as String?,
      cancellationPolicyName: json['cancellationPolicyName'] as String?,
      cancellationPolicyDescription:
          json['cancellationPolicyDescription'] as String?,
      childCancellationPolicyName:
          json['childCancellationPolicyName'] as String?,
      childCancellationPolicyDescription:
          json['childCancellationPolicyDescription'] as String?,
      childAge: json['childAge'] as String?,
      infantAge: json['infantAge'] as String?,
      infantCount: json['infantCount'] as int?,
      isSlot: json['isSlot'] as bool?,
      onlyChild: json['onlyChild'] as bool?,
      contractId: json['contractId'] as int?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      startTime: json['startTime'] as String?,
      meal: json['meal'] as String?,
      videoUrl: json['videoUrl'] as String?,
      googleMapUrl: json['googleMapUrl'] as String?,
      tourExclusion: json['tourExclusion'] as String?,
      howToRedeem: json['howToRedeem'] as String?,
      tourImages: (json['tourImages'] as List<dynamic>?)
          ?.map((e) => TourImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
      'id': instance.id,
      'TourId': instance.TourId,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'tourName': instance.tourName,
      'reviewCount': instance.reviewCount,
      'rating': instance.rating,
      'duration': instance.duration,
      'departurePoint': instance.departurePoint,
      'reportingTime': instance.reportingTime,
      'tourLanguage': instance.tourLanguage,
      'imagePath': instance.imagePath,
      'imageCaptionName': instance.imageCaptionName,
      'cityTourTypeId': instance.cityTourTypeId,
      'cityTourType': instance.cityTourType,
      'tourDescription': instance.tourDescription,
      'tourInclusion': instance.tourInclusion,
      'tourShortDescription': instance.tourShortDescription,
      'raynaToursAdvantage': instance.raynaToursAdvantage,
      'whatsInThisTour': instance.whatsInThisTour,
      'importantInformation': instance.importantInformation,
      'itenararyDescription': instance.itenararyDescription,
      'usefulInformation': instance.usefulInformation,
      'faqDetails': instance.faqDetails,
      'termsAndConditions': instance.termsAndConditions,
      'cancellationPolicyName': instance.cancellationPolicyName,
      'cancellationPolicyDescription': instance.cancellationPolicyDescription,
      'childCancellationPolicyName': instance.childCancellationPolicyName,
      'childCancellationPolicyDescription':
          instance.childCancellationPolicyDescription,
      'childAge': instance.childAge,
      'infantAge': instance.infantAge,
      'infantCount': instance.infantCount,
      'isSlot': instance.isSlot,
      'onlyChild': instance.onlyChild,
      'contractId': instance.contractId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'startTime': instance.startTime,
      'meal': instance.meal,
      'videoUrl': instance.videoUrl,
      'googleMapUrl': instance.googleMapUrl,
      'tourExclusion': instance.tourExclusion,
      'howToRedeem': instance.howToRedeem,
      'tourImages': instance.tourImages,
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
