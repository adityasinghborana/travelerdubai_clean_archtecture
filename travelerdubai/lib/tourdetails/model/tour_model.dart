// model/tour_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'tour_model.g.dart';

@JsonSerializable()
class TourModel {
  final int? id;
  final int? tourId;
  final int? countryId;
  final String? countryName;
  final int? cityId;
  final String? cityName;
  final String? tourName;
  final int? reviewCount;
  final double? rating;
  final String? duration;
  final String? departurePoint;
  final String? reportingTime;
  final String? tourLanguage;
  final String? imagePath;
  final String? imageCaptionName;
  final String? cityTourTypeId;
  final String? cityTourType;
  final String? tourDescription;
  final String? tourInclusion;
  final String? tourShortDescription;
  final String? raynaToursAdvantage;
  final String? whatsInThisTour;
  final String? importantInformation;
  final String? itenararyDescription;
  final String? usefulInformation;
  final String? faqDetails;
  final String? termsAndConditions;
  final String? cancellationPolicyName;
  final String? cancellationPolicyDescription;
  final String? childCancellationPolicyName;
  final String? childCancellationPolicyDescription;
  final String? childAge;
  final String? infantAge;
  final int? infantCount;
  final bool? isSlot;
  final bool? onlyChild;
  final int? contractId;
  final String? latitude;
  final String? longitude;
  final String? startTime;
  final String? meal;
  final String? videoUrl;
  final String? googleMapUrl;
  final String? tourExclusion;
  final String? howToRedeem;
  final List<TourImageModel>? tourImages;

  TourModel({
    this.id,
    this.tourId,
    this.countryId,
    this.countryName,
    this.cityId,
    this.cityName,
    this.tourName,
    this.reviewCount,
    this.rating,
    this.duration,
    this.departurePoint,
    this.reportingTime,
    this.tourLanguage,
    this.imagePath,
    this.imageCaptionName,
    this.cityTourTypeId,
    this.cityTourType,
    this.tourDescription,
    this.tourInclusion,
    this.tourShortDescription,
    this.raynaToursAdvantage,
    this.whatsInThisTour,
    this.importantInformation,
    this.itenararyDescription,
    this.usefulInformation,
    this.faqDetails,
    this.termsAndConditions,
    this.cancellationPolicyName,
    this.cancellationPolicyDescription,
    this.childCancellationPolicyName,
    this.childCancellationPolicyDescription,
    this.childAge,
    this.infantAge,
    this.infantCount,
    this.isSlot,
    this.onlyChild,
    this.contractId,
    this.latitude,
    this.longitude,
    this.startTime,
    this.meal,
    this.videoUrl,
    this.googleMapUrl,
    this.tourExclusion,
    this.howToRedeem,
    this.tourImages,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) =>
      _$TourModelFromJson(json);

  Map<String, dynamic> toJson() => _$TourModelToJson(this);
}

@JsonSerializable()
class TourImageModel {
  final int? id;
  final int? tourId;
  final String? imagePath;
  final String? imageCaptionName;
  final int? isFrontImage;
  final int? isBannerImage;
  final int? isBannerRotateImage;

  TourImageModel({
    this.id,
    this.tourId,
    this.imagePath,
    this.imageCaptionName,
    this.isFrontImage,
    this.isBannerImage,
    this.isBannerRotateImage,
  });

  factory TourImageModel.fromJson(Map<String, dynamic> json) =>
      _$TourImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$TourImageModelToJson(this);
}
