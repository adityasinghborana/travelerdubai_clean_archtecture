// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotResponse _$TimeSlotResponseFromJson(Map<String, dynamic> json) =>
    TimeSlotResponse(
      statuscode: json['statuscode'] as int,
      error: json['error'],
      currency: json['currency'] as String,
      currencysymbol: json['currencysymbol'] as String,
      errormessage: json['errormessage'] as String,
      count: json['count'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeSlotResponseToJson(TimeSlotResponse instance) =>
    <String, dynamic>{
      'statuscode': instance.statuscode,
      'error': instance.error,
      'currency': instance.currency,
      'currencysymbol': instance.currencysymbol,
      'errormessage': instance.errormessage,
      'count': instance.count,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      tourOptionId: json['tourOptionId'] as int,
      timeSlotId: json['timeSlotId'] as String,
      timeSlot: json['timeSlot'] as String,
      available: json['available'] as int,
      adultPrice: json['adultPrice'] as int,
      childPrice: json['childPrice'] as int,
      isDynamicPrice: json['isDynamicPrice'] as bool,
      companyBuyingPriceDynamic: json['companyBuyingPriceDynamic'] as int,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'tourOptionId': instance.tourOptionId,
      'timeSlotId': instance.timeSlotId,
      'timeSlot': instance.timeSlot,
      'available': instance.available,
      'adultPrice': instance.adultPrice,
      'childPrice': instance.childPrice,
      'isDynamicPrice': instance.isDynamicPrice,
      'companyBuyingPriceDynamic': instance.companyBuyingPriceDynamic,
    };
