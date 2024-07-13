// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartResponse _$UpdateCartResponseFromJson(Map<String, dynamic> json) =>
    UpdateCartResponse(
      success: json['success'] as bool,
      data: UpdateCartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateCartResponseToJson(UpdateCartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

UpdateCartData _$UpdateCartDataFromJson(Map<String, dynamic> json) =>
    UpdateCartData(
      id: (json['id'] as num).toInt(),
      serviceUniqueId: (json['serviceUniqueId'] as num).toInt(),
      tourname: json['tourname'] as String?,
      tourOption: json['tourOption'] as String?,
      tourId: (json['tourId'] as num).toInt(),
      optionId: (json['optionId'] as num).toInt(),
      adult: (json['adult'] as num?)?.toInt(),
      child: (json['child'] as num?)?.toInt(),
      infant: (json['infant'] as num?)?.toInt(),
      tourDate: json['tourDate'] as String?,
      timeSlotId: (json['timeSlotId'] as num).toInt(),
      startTime: json['startTime'] as String?,
      transferId: (json['transferId'] as num).toInt(),
      pickup: json['pickup'] as String?,
      adultRate: (json['adultRate'] as num?)?.toDouble(),
      childPrice: (json['childPrice'] as num?)?.toDouble(),
      serviceTotal: (json['serviceTotal'] as num?)?.toDouble(),
      cartId: (json['cartId'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateCartDataToJson(UpdateCartData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceUniqueId': instance.serviceUniqueId,
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
      'childPrice': instance.childPrice,
      'serviceTotal': instance.serviceTotal,
      'cartId': instance.cartId,
    };
