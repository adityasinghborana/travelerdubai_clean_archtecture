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
      id: json['id'] as int,
      serviceUniqueId: json['serviceUniqueId'] as int,
      tourname: json['tourname'] as String?,
      tourOption: json['tourOption'] as String?,
      tourId: json['tourId'] as int,
      optionId: json['optionId'] as int,
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      tourDate: json['tourDate'] as String?,
      timeSlotId: json['timeSlotId'] as int,
      startTime: json['startTime'] as String?,
      transferId: json['transferId'] as int,
      pickup: json['pickup'] as String?,
      adultRate: (json['adultRate'] as num?)?.toDouble(),
      childPrice: (json['childPrice'] as num?)?.toDouble(),
      serviceTotal: (json['serviceTotal'] as num?)?.toDouble(),
      cartId: json['cartId'] as int,
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
