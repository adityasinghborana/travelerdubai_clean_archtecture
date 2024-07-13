// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotResponse _$TimeSlotResponseFromJson(Map<String, dynamic> json) =>
    TimeSlotResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeSlotResponseToJson(TimeSlotResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      tourOptionId: (json['tourOptionId'] as num).toInt(),
      timeSlotId: json['timeSlotId'] as String,
      timeSlot: json['timeSlot'] as String,
      available: (json['available'] as num).toInt(),
      adultPrice: (json['adultPrice'] as num).toInt(),
      childPrice: (json['childPrice'] as num).toInt(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'tourOptionId': instance.tourOptionId,
      'timeSlotId': instance.timeSlotId,
      'timeSlot': instance.timeSlot,
      'available': instance.available,
      'adultPrice': instance.adultPrice,
      'childPrice': instance.childPrice,
    };
