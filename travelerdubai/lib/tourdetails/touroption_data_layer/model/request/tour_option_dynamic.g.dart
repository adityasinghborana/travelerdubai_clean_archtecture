// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_option_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourOptionDynamicRequest _$TourOptionDynamicRequestFromJson(
        Map<String, dynamic> json) =>
    TourOptionDynamicRequest(
      tourId: json['tourId'] as int,
      contractId: json['contractId'] as int,
      travelDate: json['travelDate'] as String,
      noOfAdult: json['noOfAdult'] as int,
      noOfChild: json['noOfChild'] as int,
      noOfInfant: json['noOfInfant'] as int,
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
    };
