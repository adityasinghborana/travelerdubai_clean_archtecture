import 'package:json_annotation/json_annotation.dart';

import '../../tourdetails/tourdetail_data_layer/model/tour_model.dart';

part 'experience_response_model.g.dart';

@JsonSerializable()
class Experiences {
  final int id;
  final int tourId;
  final bool? isvisible;
  final bool? isvisibleHome;
  final bool? isvisiblePopularTours;
  final bool? isvisibleReccomendedTours;
  final int countryId;
  final String countryName;
  final int cityId;
  final String cityName;
  final String tourName;
  final int reviewCount;
  final int rating;
  final String duration;
  final String imagePath;
  final String imageCaptionName;
  final String cityTourTypeId;
  final String cityTourType;
  final String tourShortDescription;
  final String cancellationPolicyName;
  final bool isSlot;
  final bool onlyChild;
  final int contractId;
  final bool recommended;
  final bool isPrivate;
  final List<TourModel>? tourdetails; // Updated this line

  Experiences({
    required this.id,
    required this.tourId,
    this.isvisible,
    this.isvisibleHome,
   this.isvisiblePopularTours,
this.isvisibleReccomendedTours,
    required this.countryId,
    required this.countryName,
    required this.cityId,
    required this.cityName,
    required this.tourName,
    required this.reviewCount,
    required this.rating,
    required this.duration,
    required this.imagePath,
    required this.imageCaptionName,
    required this.cityTourTypeId,
    required this.cityTourType,
    required this.tourShortDescription,
    required this.cancellationPolicyName,
    required this.isSlot,
    required this.onlyChild,
    required this.contractId,
    required this.recommended,
    required this.isPrivate,
    required this.tourdetails,
  });

  factory Experiences.fromJson(Map<String, dynamic> json) =>
      _$ExperiencesFromJson(json);
  Map<String, dynamic> toJson() => _$ExperiencesToJson(this);
}
