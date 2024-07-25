// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkcouponresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCouponResponse _$CheckCouponResponseFromJson(Map<String, dynamic> json) =>
    CheckCouponResponse(
      json['error'] as String?,
      (json['discountprice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckCouponResponseToJson(
        CheckCouponResponse instance) =>
    <String, dynamic>{
      'discountprice': instance.discountprice,
      'error': instance.error,
    };
