// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartTourDetail _$UpdateCartTourDetailFromJson(
        Map<String, dynamic> json) =>
    UpdateCartTourDetail(
      tourname: json['tourname'] as String,
      tourOption: json['tourOption'] as String,
      tourId: json['tourId'] as int,
      optionId: json['optionId'] as int,
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      tourDate: json['tourDate'] as String,
      timeSlotId: json['timeSlotId'] as int?,
      startTime: json['startTime'] as String,
      transferId: json['transferId'] as int,
      pickup: json['pickup'] as String?,
      adultRate: (json['adultRate'] as num?)?.toDouble(),
      childRate: (json['childRate'] as num?)?.toDouble(),
      serviceTotal: (json['serviceTotal'] as num).toDouble(),
      cartId: json['cartId'] as int,
    );

Map<String, dynamic> _$UpdateCartTourDetailToJson(
        UpdateCartTourDetail instance) =>
    <String, dynamic>{
      'tourname': instance.tourname,
      'tourOption': instance.tourOption,
      'tourId': instance.tourId,
      'optionId': instance.optionId,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'tourDate': instance.tourDate,
      'timeSlotId': instance.timeSlotId,
      'startTime': instance.startTime,
      'transferId': instance.transferId,
      'pickup': instance.pickup,
      'adultRate': instance.adultRate,
      'childRate': instance.childRate,
      'serviceTotal': instance.serviceTotal,
      'cartId': instance.cartId,
    };
