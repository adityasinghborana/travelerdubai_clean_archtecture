// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deletecart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deletecartresponse _$DeletecartresponseFromJson(Map<String, dynamic> json) =>
    Deletecartresponse(
      status: (json['status'] as num).toInt(),
      deletedCartTourDetail: CartTourDetail.fromJson(
          json['deletedCartTourDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeletecartresponseToJson(Deletecartresponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'deletedCartTourDetail': instance.deletedCartTourDetail,
    };
