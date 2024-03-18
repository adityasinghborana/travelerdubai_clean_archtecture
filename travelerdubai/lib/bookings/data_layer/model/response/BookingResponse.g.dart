// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      statuscode: json['statuscode'] as int?,
      error: json['error'],
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{
      'statuscode': instance.statuscode,
      'error': instance.error,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceNo: json['referenceNo'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'details': instance.details,
      'referenceNo': instance.referenceNo,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      status: json['status'] as String?,
      bookingId: json['bookingId'] as int?,
      downloadRequired: json['downloadRequired'] as bool?,
      serviceUniqueId: json['serviceUniqueId'] as String?,
      servicetype: json['servicetype'] as String?,
      confirmationNo: json['confirmationNo'] as String?,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'status': instance.status,
      'bookingId': instance.bookingId,
      'downloadRequired': instance.downloadRequired,
      'serviceUniqueId': instance.serviceUniqueId,
      'servicetype': instance.servicetype,
      'confirmationNo': instance.confirmationNo,
    };
