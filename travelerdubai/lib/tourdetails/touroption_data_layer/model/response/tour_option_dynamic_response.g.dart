// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_option_dynamic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourOptionDynamicDataResponse _$TourOptionDynamicDataResponseFromJson(
        Map<String, dynamic> json) =>
    TourOptionDynamicDataResponse(
      extractedData: json['extractedData'] == null
          ? null
          : ExtractedData.fromJson(
              json['extractedData'] as Map<String, dynamic>),
      apiResponseData: json['apiResponseData'] == null
          ? null
          : ApiResponseData.fromJson(
              json['apiResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TourOptionDynamicDataResponseToJson(
        TourOptionDynamicDataResponse instance) =>
    <String, dynamic>{
      'extractedData': instance.extractedData,
      'apiResponseData': instance.apiResponseData,
    };

ExtractedData _$ExtractedDataFromJson(Map<String, dynamic> json) =>
    ExtractedData(
      addPriceAdult: (json['addPriceAdult'] as num?)?.toDouble(),
      addPriceChildren: (json['addPriceChildren'] as num?)?.toDouble(),
      additionalPriceInfant:
          (json['additionalPriceInfant'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExtractedDataToJson(ExtractedData instance) =>
    <String, dynamic>{
      'addPriceAdult': instance.addPriceAdult,
      'addPriceChildren': instance.addPriceChildren,
      'additionalPriceInfant': instance.additionalPriceInfant,
    };

ApiResponseData _$ApiResponseDataFromJson(Map<String, dynamic> json) =>
    ApiResponseData(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      error: json['error'],
      currency: json['currency'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      errorMessage: json['errorMessage'] as String?,
      count: (json['count'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) =>
              TourOptionDynamicResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiResponseDataToJson(ApiResponseData instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'errorMessage': instance.errorMessage,
      'count': instance.count,
      'result': instance.result,
    };

TourOptionDynamicResult _$TourOptionDynamicResultFromJson(
        Map<String, dynamic> json) =>
    TourOptionDynamicResult(
      tourId: (json['tourId'] as num?)?.toInt(),
      tourOptionId: (json['tourOptionId'] as num?)?.toInt(),
      transferId: (json['transferId'] as num?)?.toInt(),
      transferName: json['transferName'] as String?,
      adultPrice: (json['adultPrice'] as num?)?.toDouble(),
      childPrice: (json['childPrice'] as num?)?.toDouble(),
      infantPrice: (json['infantPrice'] as num?)?.toInt(),
      finalAmount: (json['finalAmount'] as num?)?.toDouble(),
      startTime: json['startTime'] as String?,
    );

Map<String, dynamic> _$TourOptionDynamicResultToJson(
        TourOptionDynamicResult instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'tourOptionId': instance.tourOptionId,
      'transferId': instance.transferId,
      'transferName': instance.transferName,
      'adultPrice': instance.adultPrice,
      'startTime': instance.startTime,
      'childPrice': instance.childPrice,
      'infantPrice': instance.infantPrice,
      'finalAmount': instance.finalAmount,
    };
