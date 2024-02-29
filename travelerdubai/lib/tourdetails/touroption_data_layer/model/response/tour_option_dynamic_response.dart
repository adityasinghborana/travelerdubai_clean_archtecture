import 'package:json_annotation/json_annotation.dart';

part 'tour_option_dynamic_response.g.dart';


@JsonSerializable()
class TourOptionDynamicDataResponse {
  ExtractedData? extractedData;
  ApiResponseData? apiResponseData;

  TourOptionDynamicDataResponse({this.extractedData, this.apiResponseData});

  factory TourOptionDynamicDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TourOptionDynamicDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TourOptionDynamicDataResponseToJson(this);
}

@JsonSerializable()
class ExtractedData {
  int? addPriceAdult;
  int? addPriceChildren;
  int? additionalPriceInfant;

  ExtractedData({this.addPriceAdult, this.addPriceChildren, this.additionalPriceInfant});

  factory ExtractedData.fromJson(Map<String, dynamic> json) =>
      _$ExtractedDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExtractedDataToJson(this);
}

@JsonSerializable()
class ApiResponseData {
  int? statusCode;
  dynamic? error;
  String? currency;
  String? currencySymbol;
  String? errorMessage;
  int? count;
  List<TourOptionDynamicResult>? result;

  ApiResponseData({
    this.statusCode,
    this.error,
    this.currency,
    this.currencySymbol,
    this.errorMessage,
    this.count,
    this.result,
  });

  factory ApiResponseData.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseDataToJson(this);
}

@JsonSerializable()
class TourOptionDynamicResult {
  int? tourId;
  int? tourOptionId;
  int? transferId;
  String? transferName;
  double? adultPrice;
  double? childPrice;
  int? infantPrice;
  double? withoutDiscountAmount;
  double? finalAmount;
  String? startTime;
  String? departureTime;
  bool? disableChild;
  bool? disableInfant;
  bool? allowTodaysBooking;
  int? cutOff;
  bool? isSlot;
  int? isDefaultTransfer;
  // Add other properties...

  TourOptionDynamicResult({
    this.tourId,
    this.tourOptionId,
    this.transferId,
    this.transferName,
    this.adultPrice,
    this.childPrice,
    this.infantPrice,
    this.withoutDiscountAmount,
    this.finalAmount,
    this.startTime,
    this.departureTime,
    this.disableChild,
    this.disableInfant,
    this.allowTodaysBooking,
    this.cutOff,
    this.isSlot,
    this.isDefaultTransfer,
  });

  factory TourOptionDynamicResult.fromJson(Map<String, dynamic> json) => _$TourOptionDynamicResultFromJson(json);

  Map<String, dynamic> toJson() => _$TourOptionDynamicResultToJson(this);
}