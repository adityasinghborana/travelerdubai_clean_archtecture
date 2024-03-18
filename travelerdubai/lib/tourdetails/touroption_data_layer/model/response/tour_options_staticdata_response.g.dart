// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_options_staticdata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourOptionsStaticDataResponse _$TourOptionsStaticDataResponseFromJson(
        Map<String, dynamic> json) =>
    TourOptionsStaticDataResponse(
      statuscode: json['statuscode'] as int,
      error: json['error'],
      url: json['url'] as String?,
      count: json['count'] as int?,
      result: json['result'] == null
          ? null
          : TourOptionsResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TourOptionsStaticDataResponseToJson(
        TourOptionsStaticDataResponse instance) =>
    <String, dynamic>{
      'statuscode': instance.statuscode,
      'error': instance.error,
      'url': instance.url,
      'count': instance.count,
      'result': instance.result,
    };

TourOptionsResult _$TourOptionsResultFromJson(Map<String, dynamic> json) =>
    TourOptionsResult(
      touroption: (json['touroption'] as List<dynamic>?)
          ?.map((e) => TourOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationdays: (json['operationdays'] as List<dynamic>?)
          ?.map((e) => OperationDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialdates: json['specialdates'] as List<dynamic>?,
      transfertime: (json['transfertime'] as List<dynamic>?)
          ?.map((e) => TransferTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TourOptionsResultToJson(TourOptionsResult instance) =>
    <String, dynamic>{
      'touroption': instance.touroption,
      'operationdays': instance.operationdays,
      'specialdates': instance.specialdates,
      'transfertime': instance.transfertime,
    };

TourOption _$TourOptionFromJson(Map<String, dynamic> json) => TourOption(
      tourId: json['tourId'] as int?,
      tourOptionId: json['tourOptionId'] as int?,
      optionName: json['optionName'] as String?,
      childAge: json['childAge'] as String?,
      infantAge: json['infantAge'] as String?,
      optionDescription: json['optionDescription'] as String?,
      cancellationPolicy: json['cancellationPolicy'] as String?,
      cancellationPolicyDescription:
          json['cancellationPolicyDescription'] as String?,
      childPolicyDescription: json['childPolicyDescription'] as String?,
    );

Map<String, dynamic> _$TourOptionToJson(TourOption instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'tourOptionId': instance.tourOptionId,
      'optionName': instance.optionName,
      'childAge': instance.childAge,
      'infantAge': instance.infantAge,
      'optionDescription': instance.optionDescription,
      'cancellationPolicy': instance.cancellationPolicy,
      'cancellationPolicyDescription': instance.cancellationPolicyDescription,
      'childPolicyDescription': instance.childPolicyDescription,
    };

OperationDay _$OperationDayFromJson(Map<String, dynamic> json) => OperationDay(
      tourId: json['tourId'] as int?,
      tourOptionId: json['tourOptionId'] as int?,
      monday: json['monday'] as int?,
      tuesday: json['tuesday'] as int?,
      wednesday: json['wednesday'] as int?,
      thursday: json['thursday'] as int?,
      friday: json['friday'] as int?,
      saturday: json['saturday'] as int?,
      sunday: json['sunday'] as int?,
    );

Map<String, dynamic> _$OperationDayToJson(OperationDay instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'tourOptionId': instance.tourOptionId,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };

TransferTime _$TransferTimeFromJson(Map<String, dynamic> json) => TransferTime(
      tourId: json['tourId'] as int?,
      tourOptionId: json['tourOptionId'] as int?,
      transferType: json['transferType'] as String?,
      transferTime: json['transferTime'] as String?,
      duration: json['duration'] as String?,
      mobileVoucher: json['mobileVoucher'] as bool?,
      printedVoucher: json['printedVoucher'] as bool?,
      instantConfirmation: json['instantConfirmation'] as bool?,
      onRequest: json['onRequest'] as bool?,
      requiedhrs: json['requiedhrs'] as bool?,
      disableChild: json['disableChild'] as bool?,
      disableInfant: json['disableInfant'] as bool?,
      twoWayTransfer: json['twoWayTransfer'] as bool?,
      portalTicket: json['portalTicket'] as bool?,
      allowTodaysBooking: json['allowTodaysBooking'] as bool?,
      cancellationPolicy: json['cancellationPolicy'] as String?,
      cancellationPolicyDescription:
          json['cancellationPolicyDescription'] as String?,
      childPolicy: json['childPolicy'] as String?,
      childPolicyDescription: json['childPolicyDescription'] as String?,
      cutOffhrs: json['cutOffhrs'] as int?,
      onRequestCutoff: json['onRequestCutoff'] as bool?,
    );

Map<String, dynamic> _$TransferTimeToJson(TransferTime instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'tourOptionId': instance.tourOptionId,
      'transferType': instance.transferType,
      'transferTime': instance.transferTime,
      'duration': instance.duration,
      'mobileVoucher': instance.mobileVoucher,
      'printedVoucher': instance.printedVoucher,
      'instantConfirmation': instance.instantConfirmation,
      'onRequest': instance.onRequest,
      'requiedhrs': instance.requiedhrs,
      'disableChild': instance.disableChild,
      'disableInfant': instance.disableInfant,
      'twoWayTransfer': instance.twoWayTransfer,
      'portalTicket': instance.portalTicket,
      'allowTodaysBooking': instance.allowTodaysBooking,
      'cancellationPolicy': instance.cancellationPolicy,
      'cancellationPolicyDescription': instance.cancellationPolicyDescription,
      'childPolicy': instance.childPolicy,
      'childPolicyDescription': instance.childPolicyDescription,
      'cutOffhrs': instance.cutOffhrs,
      'onRequestCutoff': instance.onRequestCutoff,
    };
