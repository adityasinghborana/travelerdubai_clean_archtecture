// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      vendorbookings: json['vendorbookings'] == null
          ? null
          : VendorBookings.fromJson(
              json['vendorbookings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'data': instance.data,
      'vendorbookings': instance.vendorbookings,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      statuscode: (json['statuscode'] as num?)?.toInt(),
      error: json['error'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'statuscode': instance.statuscode,
      'error': instance.error,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Details.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceNo: json['referenceNo'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'details': instance.details,
      'referenceNo': instance.referenceNo,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      status: json['status'] as String?,
      bookingId: (json['bookingId'] as num?)?.toInt(),
      downloadRequired: json['downloadRequired'] as bool?,
      serviceUniqueId: json['serviceUniqueId'] as String?,
      servicetype: json['servicetype'] as String?,
      confirmationNo: json['confirmationNo'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'status': instance.status,
      'bookingId': instance.bookingId,
      'downloadRequired': instance.downloadRequired,
      'serviceUniqueId': instance.serviceUniqueId,
      'servicetype': instance.servicetype,
      'confirmationNo': instance.confirmationNo,
    };

VendorBookings _$VendorBookingsFromJson(Map<String, dynamic> json) =>
    VendorBookings(
      status: (json['status'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      bookingDetails: (json['bookingDetails'] as List<dynamic>?)
          ?.map((e) => BookingDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorBookingsToJson(VendorBookings instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'bookingDetails': instance.bookingDetails,
    };

BookingDetails _$BookingDetailsFromJson(Map<String, dynamic> json) =>
    BookingDetails(
      status: json['status'] as String?,
      bookingId: (json['bookingId'] as num?)?.toInt(),
      downloadRequired: json['downloadRequired'] as bool?,
      serviceUniqueId: json['serviceUniqueId'] as String?,
      servicetype: json['servicetype'] as String?,
      confirmationNo: json['confirmationNo'] as String?,
      bookingResultId: (json['bookingResultId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookingDetailsToJson(BookingDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'bookingId': instance.bookingId,
      'downloadRequired': instance.downloadRequired,
      'serviceUniqueId': instance.serviceUniqueId,
      'servicetype': instance.servicetype,
      'confirmationNo': instance.confirmationNo,
      'bookingResultId': instance.bookingResultId,
    };
