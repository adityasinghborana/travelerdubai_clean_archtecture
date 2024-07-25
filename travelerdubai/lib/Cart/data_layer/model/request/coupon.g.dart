// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponRequest _$CouponRequestFromJson(Map<String, dynamic> json) =>
    CouponRequest(
      name: json['name'] as String,
      cartId: (json['cartId'] as num).toInt(),
    );

Map<String, dynamic> _$CouponRequestToJson(CouponRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cartId': instance.cartId,
    };
