// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartResponse _$GetCartResponseFromJson(Map<String, dynamic> json) =>
    GetCartResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCartResponseToJson(GetCartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num).toInt(),
      totalamount: (json['totalamount'] as num).toDouble(),
      uniqueNo: (json['uniqueNo'] as num?)?.toInt(),
      userId: json['userId'] as String,
      TourDetails: (json['TourDetails'] as List<dynamic>)
          .map((e) => CartTourDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'totalamount': instance.totalamount,
      'uniqueNo': instance.uniqueNo,
      'userId': instance.userId,
      'TourDetails': instance.TourDetails,
    };

CartTourDetail _$CartTourDetailFromJson(Map<String, dynamic> json) =>
    CartTourDetail(
      id: (json['id'] as num).toInt(),
      serviceUniqueId: (json['serviceUniqueId'] as num).toInt(),
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
      childPrice: (json['childPrice'] as num?)?.toDouble(),
      serviceTotal: (json['serviceTotal'] as num?)?.toDouble(),
      cartId: (json['cartId'] as num).toInt(),
    );

Map<String, dynamic> _$CartTourDetailToJson(CartTourDetail instance) =>
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
