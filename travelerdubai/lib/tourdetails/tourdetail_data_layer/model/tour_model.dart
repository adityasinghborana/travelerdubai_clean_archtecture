// model/tour_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'tour_model.g.dart';

@JsonSerializable()
class TourModel {
  final int? id;
  final int? TourId;
  final int? countryId;
  final String? countryName;
  final int? cityId;
  final String? cityName;
  final String? tourName;
  final String? duration;
  final String? imagePath;
  final String? cityTourTypeId;
  final String? cityTourType;
  final String? tourDescription;
  final String? tourInclusion;
  final String? tourShortDescription;
  final String? importantInformation;
  final String? itenararyDescription;
  final String? usefulInformation;
  final String? childAge;
  final String? infantAge;
  final int? infantCount;
  final bool? isSlot;
  final bool? onlyChild;
  final int? contractId;
  final String? startTime;
  final String? meal;
  final String? googleMapUrl;
  final String? tourExclusion;
  final List<TourImageModel>? tourImages;
  final int? cutOffhrs;
  final bool? isVendorTour;
  final String? vendorUid;

  TourModel({
    this.id,
    this.TourId,
    this.countryId,
    this.countryName,
    this.cityId,
    this.cityName,
    this.tourName,
    this.duration,
   this.imagePath,
    this.cityTourTypeId,
    this.cityTourType,
    this.tourDescription,
    this.tourInclusion,
    this.tourShortDescription,

    this.importantInformation,
    this.itenararyDescription,
    this.usefulInformation,
this.vendorUid,
    this.childAge,
    this.infantAge,
    this.infantCount,
    this.isSlot,
    this.onlyChild,
    this.contractId,
    this.startTime,
    this.meal,
    this.googleMapUrl,
    this.tourExclusion,
    this.tourImages,
    this.cutOffhrs,
    this.isVendorTour,
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
