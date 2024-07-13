import 'package:json_annotation/json_annotation.dart';

part 'BookingResponse.g.dart';

@JsonSerializable()
class DataModel {
  final Data? data;
  final VendorBookings? vendorbookings;

  DataModel({this.data, this.vendorbookings});

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class Data {
  final int? statuscode;
  final String? error;
  final Result? result;

  Data({this.statuscode, this.error, this.result});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Result {
  final List<Details>? details;
  final String? referenceNo;

  Result({this.details, this.referenceNo});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Details {
  final String? status;
  final int? bookingId;
  final bool? downloadRequired;
  final String? serviceUniqueId;
  final String? servicetype;
  final String? confirmationNo;

  Details({
    this.status,
    this.bookingId,
    this.downloadRequired,
    this.serviceUniqueId,
    this.servicetype,
    this.confirmationNo,
  });

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class VendorBookings {
  final int? status;
  final int? count;
  final List<BookingDetails>? bookingDetails;

  VendorBookings({this.status, this.count, this.bookingDetails});

  factory VendorBookings.fromJson(Map<String, dynamic> json) => _$VendorBookingsFromJson(json);
  Map<String, dynamic> toJson() => _$VendorBookingsToJson(this);
}

@JsonSerializable()
class BookingDetails {
  final String? status;
  final int? bookingId;
  final bool? downloadRequired;
  final String? serviceUniqueId;
  final String? servicetype;
  final String? confirmationNo;
  final int? bookingResultId;

  BookingDetails({
    this.status,
    this.bookingId,
    this.downloadRequired,
    this.serviceUniqueId,
    this.servicetype,
    this.confirmationNo,
    this.bookingResultId,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) => _$BookingDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDetailsToJson(this);
}