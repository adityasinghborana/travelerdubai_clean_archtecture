import 'package:json_annotation/json_annotation.dart';

import '../../tourdetails/tourdetail_data_layer/model/tour_model.dart';

part 'experience_response_model.g.dart';

@JsonSerializable()
class Experiences {
  final int? id;
  final int? tourId;
  final bool? isvisible;
  final bool? isvisiblePopularTours;
  final bool? isvisibleReccomendedTours;
  final int? countryId;
  final String? countryName;
  final int? cityId;
  final String? cityName;
  final String? tourName;
  final String? duration;
  final String? imagePath;
  final String? cityTourTypeId;
  final String? cityTourType;
  final bool? isSlot;
  final int? contractId;
  final bool? recommended;
  final bool? isPrivate;
  final bool? isVendorTour;
  final TourModel? tourdetails; // Updated this line

  Experiences({
     this.id,
    this.tourId,
    this.isvisible,

   this.isvisiblePopularTours,
    this.isvisibleReccomendedTours,
     this.countryId,
     this.countryName,
     this.cityId,
     this.cityName,
     this.tourName,
     this.duration,
     this.imagePath,
    this.cityTourTypeId,
     this.cityTourType,
     this.isSlot,
     this.contractId,
     this.recommended,
     this.isPrivate,
    this.isVendorTour,
     this.tourdetails,
  });

  factory Experiences.fromJson(Map<String, dynamic> json) =>
      _$ExperiencesFromJson(json);
  Map<String, dynamic> toJson() => _$ExperiencesToJson(this);
}
