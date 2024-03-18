import 'package:json_annotation/json_annotation.dart';
part 'booking_request.g.dart';

@JsonSerializable()

class BookingRequest {
  final String pickup;
final String User;
  final int cartid;
  final List<Passenger> passengers;

  BookingRequest( {
    required this.pickup,
required this.User,
    required this.cartid,
    required this.passengers,
  });
  factory BookingRequest.fromJson(Map<String, dynamic> json) => _$BookingRequestFromJson(json);
    Map<String, dynamic> toJson() => _$BookingRequestToJson(this);

}



@JsonSerializable()
class Passenger {
  final String serviceType;
  final String prefix;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String nationality;
  final String message;
  final int leadPassenger;
  final String paxType;


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


