// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_option_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourOptionDynamicRequest _$TourOptionDynamicRequestFromJson(
        Map<String, dynamic> json) =>
    TourOptionDynamicRequest(
      tourId: (json['tourId'] as num).toInt(),
      contractId: (json['contractId'] as num).toInt(),
      travelDate: json['travelDate'] as String,
      noOfAdult: (json['noOfAdult'] as num).toInt(),
      noOfChild: (json['noOfChild'] as num).toInt(),
      noOfInfant: (json['noOfInfant'] as num).toInt(),
      isVendor: json['isVendor'] as bool,
    );

Map<String, dynamic> _$TourOptionDynamicRequestToJson(
        TourOptionDynamicRequest instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'contractId': instance.contractId,
      'travelDate': instance.travelDate,
      'noOfAdult': instance.noOfAdult,
      'noOfChild': instance.noOfChild,
      'noOfInfant': instance.noOfInfant,
      'isVendor': instance.isVendor,
    };
