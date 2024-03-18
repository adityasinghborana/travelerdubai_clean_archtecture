import 'package:json_annotation/json_annotation.dart';

part 'timeslot_response.g.dart';

@JsonSerializable()
class TimeSlotResponse {
  final int statuscode;
  final dynamic error;
  final String currency;
  final String currencysymbol;
  final String errormessage;
  final int count;
  final List<Result> result;

  TimeSlotResponse({
    required this.statuscode,
    required this.error,
    required this.currency,
    required this.currencysymbol,
    required this.errormessage,
    required this.count,
    required this.result,
  });

  factory TimeSlotResponse.fromJson(Map<String, dynamic> json) => _$TimeSlotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotResponseToJson(this);
}

@JsonSerializable()
class Result {
  final int tourOptionId;
  final String timeSlotId;
  final String timeSlot;
  final int available;
  final int adultPrice;
  final int childPrice;
  final bool isDynamicPrice;
  final int companyBuyingPriceDynamic;

  Result({
    required this.tourOptionId,
    required this.timeSlotId,
    required this.timeSlot,
    required this.available,
    required this.adultPrice,
    required this.childPrice,
    required this.isDynamicPrice,
    required this.companyBuyingPriceDynamic,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}