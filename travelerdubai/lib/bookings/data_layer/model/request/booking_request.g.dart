// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      pickup: json['pickup'] as String,
      User: json['User'] as String,
      cartid: json['cartid'] as int,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'pickup': instance.pickup,
      'User': instance.User,
      'cartid': instance.cartid,
      'passengers': instance.passengers,
    };

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      serviceType: json['serviceType'] as String,
      prefix: json['prefix'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      nationality: json['nationality'] as String,
      message: json['message'] as String,
      leadPassenger: json['leadPassenger'] as int,
      paxType: json['paxType'] as String,
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'serviceType': instance.serviceType,
      'prefix': instance.prefix,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'nationality': instance.nationality,
      'message': instance.message,
      'leadPassenger': instance.leadPassenger,
      'paxType': instance.paxType,
    };
