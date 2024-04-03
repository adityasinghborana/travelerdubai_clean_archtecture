import 'package:json_annotation/json_annotation.dart';

part 'tour_options_staticdata_response.g.dart';

@JsonSerializable()
class TourOptionsStaticDataResponse {
  int statuscode;
  dynamic error;
  String? url;
  int? count;
  TourOptionsResult? result;

  TourOptionsStaticDataResponse({
    required this.statuscode,
    this.error,
    this.url,
    this.count,
    this.result,
  });

  factory TourOptionsStaticDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TourOptionsStaticDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TourOptionsStaticDataResponseToJson(this);
}

@JsonSerializable()
class TourOptionsResult {
  List<TourOption>? touroption;
  List<OperationDay>? operationdays;
  List? specialdates;
  List<TransferTime>? transfertime;

  TourOptionsResult({
    this.touroption,
    this.operationdays,
    this.specialdates,
    this.transfertime,
  });

  factory TourOptionsResult.fromJson(Map<String, dynamic> json) =>
      _$TourOptionsResultFromJson(json);

  Map<String, dynamic> toJson() => _$TourOptionsResultToJson(this);
}

@JsonSerializable()
class TourOption {
  int? tourId;
  int? tourOptionId;
  String? optionName;
  String? childAge;
  String? infantAge;
  String? optionDescription;
  String? cancellationPolicy;
  String? cancellationPolicyDescription;
  String? childPolicyDescription;
  // Add other properties as needed

  TourOption({
    this.tourId,
    this.tourOptionId,
    this.optionName,
    this.childAge,
    this.infantAge,
    this.optionDescription,
    this.cancellationPolicy,
    this.cancellationPolicyDescription,
    this.childPolicyDescription,
    // Add other properties as needed
  });

  factory TourOption.fromJson(Map<String, dynamic> json) =>
      _$TourOptionFromJson(json);

  Map<String, dynamic> toJson() => _$TourOptionToJson(this);
}

@JsonSerializable()
class OperationDay {
  int? tourId;
  int? tourOptionId;
  int? monday;
  int? tuesday;
  int? wednesday;
  int? thursday;
  int? friday;
  int? saturday;
  int? sunday;

  OperationDay({
    this.tourId,
    this.tourOptionId,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory OperationDay.fromJson(Map<String, dynamic> json) =>
      _$OperationDayFromJson(json);

  Map<String, dynamic> toJson() => _$OperationDayToJson(this);
}

@JsonSerializable()
class TransferTime {
  int? tourId;
  int? tourOptionId;
  String? transferType;
  String? transferTime;
  String? duration;
  bool? mobileVoucher;
  bool? printedVoucher;
  bool? instantConfirmation;
  bool? onRequest;
  bool? requiedhrs;
  bool? disableChild;
  bool? disableInfant;
  bool? twoWayTransfer;
  bool? portalTicket;
  bool? allowTodaysBooking;
  String? cancellationPolicy;
  String? cancellationPolicyDescription;
  String? childPolicy;
  String? childPolicyDescription;
  int? cutOffhrs;
  bool? onRequestCutoff;

  TransferTime({
    this.tourId,
    this.tourOptionId,
    this.transferType,
    this.transferTime,
    this.duration,
    this.mobileVoucher,
    this.printedVoucher,
    this.instantConfirmation,
    this.onRequest,
    this.requiedhrs,
    this.disableChild,
    this.disableInfant,
    this.twoWayTransfer,
    this.portalTicket,
    this.allowTodaysBooking,
    this.cancellationPolicy,
    this.cancellationPolicyDescription,
    this.childPolicy,
    this.childPolicyDescription,
    this.cutOffhrs,
    this.onRequestCutoff,
  });

  factory TransferTime.fromJson(Map<String, dynamic> json) =>
      _$TransferTimeFromJson(json);

  Map<String, dynamic> toJson() => _$TransferTimeToJson(this);
}
