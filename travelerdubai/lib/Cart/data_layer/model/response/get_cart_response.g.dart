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
      id: json['id'] as int,
      totalamount: (json['totalamount'] as num).toDouble(),
      uniqueNo: json['uniqueNo'] as int?,
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
      id: json['id'] as int,
      serviceUniqueId: json['serviceUniqueId'] as int,
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
      childPrice: (json['childPrice'] as num?)?.toDouble(),
      serviceTotal: (json['serviceTotal'] as num?)?.toDouble(),
      cartId: json['cartId'] as int,
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
