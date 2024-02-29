import 'package:json_annotation/json_annotation.dart';

part 'cart_request_model.g.dart';

@JsonSerializable()
class BookingModel {

  List<TourDetails> tourDetails;
  List<Passenger> passengers;

  BookingModel({
    required this.tourDetails,
    required this.passengers,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}

@JsonSerializable()
class TourDetails {
  int tourId;
  int optionId;
  int adult;
  int child;
  int infant;
  String tourDate;
  int timeSlotId;
  String startTime;
  int transferId;
  String pickup;
  double adultRate;
  double childRate;
  double serviceTotal;

  TourDetails({

    required this.tourId,
    required this.optionId,
    required this.adult,
    required this.child,
    required this.infant,
    required this.tourDate,
    required this.timeSlotId,
    required this.startTime,
    required this.transferId,
    required this.pickup,
    required this.adultRate,
    required this.childRate,
    required this.serviceTotal,
  });

  factory TourDetails.fromJson(Map<String, dynamic> json) => _$TourDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TourDetailsToJson(this);
}

@JsonSerializable()
class Passenger {
  String serviceType;
  String prefix;
  String firstName;
  String lastName;
  String email;
  String mobile;
  String nationality;
  String message;
  bool leadPassenger;
  String paxType;


  Passenger({
    required this.serviceType,
    required this.prefix,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.nationality,
    required this.message,
    required this.leadPassenger,
    required this.paxType,

  });

  factory Passenger.fromJson(Map<String, dynamic> json) => _$PassengerFromJson(json);
  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}