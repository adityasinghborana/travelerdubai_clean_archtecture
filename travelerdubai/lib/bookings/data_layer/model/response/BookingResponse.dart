import 'package:json_annotation/json_annotation.dart';
part 'BookingResponse.g.dart';

@JsonSerializable()
class BookingResponse {
  final int? statuscode;
  final dynamic error;
  final Result? result;

  BookingResponse({
    this.statuscode,
    this.error,
    this.result,
  });
  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);

}

@JsonSerializable()

  class Result {
  final List<Detail>? details;
  final String? referenceNo;

  Result({
  this.details,
  this.referenceNo,
  });
  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}
@JsonSerializable()
class Detail {
  final String? status;
  final int? bookingId;
  final bool? downloadRequired;
  final String? serviceUniqueId;
  final String? servicetype;
  final String? confirmationNo;

  Detail({
    this.status,
    this.bookingId,
    this.downloadRequired,
    this.serviceUniqueId,
    this.servicetype,
    this.confirmationNo,
  });
  factory Detail.fromJson(Map<String, dynamic> json) =>
      _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);

}