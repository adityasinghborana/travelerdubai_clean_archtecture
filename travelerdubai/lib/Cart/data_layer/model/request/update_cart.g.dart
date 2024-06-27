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
      tourId: (json['tourId'] as num).toInt(),
      optionId: (json['optionId'] as num).toInt(),
      adult: (json['adult'] as num?)?.toInt(),
      child: (json['child'] as num?)?.toInt(),
      infant: (json['infant'] as num?)?.toInt(),
      tourDate: json['tourDate'] as String,
      timeSlotId: (json['timeSlotId'] as num?)?.toInt(),
      startTime: json['startTime'] as String,
      transferId: (json['transferId'] as num).toInt(),
      pickup: json['pickup'] as String?,
      adultRate: (json['adultRate'] as num?)?.toDouble(),
      childRate: (json['childRate'] as num?)?.toDouble(),
      serviceTotal: (json['serviceTotal'] as num).toDouble(),
      cartId: (json['cartId'] as num).toInt(),
      vendoruid: json['vendoruid'] as String?,
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
      'vendoruid': instance.vendoruid,
    };
