// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      tourDetails: (json['tourDetails'] as List<dynamic>)
          .map((e) => TourDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'tourDetails': instance.tourDetails,
      'passengers': instance.passengers,
    };

TourDetails _$TourDetailsFromJson(Map<String, dynamic> json) => TourDetails(
      tourId: json['tourId'] as int,
      optionId: json['optionId'] as int,
      adult: json['adult'] as int,
      child: json['child'] as int,
      infant: json['infant'] as int,
      tourDate: json['tourDate'] as String,
      timeSlotId: json['timeSlotId'] as int,
      startTime: json['startTime'] as String,
      transferId: json['transferId'] as int,
      pickup: json['pickup'] as String,
      adultRate: (json['adultRate'] as num).toDouble(),
      childRate: (json['childRate'] as num).toDouble(),
      serviceTotal: (json['serviceTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$TourDetailsToJson(TourDetails instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'optionId': instance.optionId,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'tourDate': instance.tourDate,
      'timeSlotId': instance.timeSlotId,
      'startTime': instance.startTime,
      'transferId': instance.transferId,
      'pickup': instance.pickup,
      'adultRate': instance.adultRate,
      'childRate': instance.childRate,
      'serviceTotal': instance.serviceTotal,
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
      leadPassenger: json['leadPassenger'] as bool,
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
