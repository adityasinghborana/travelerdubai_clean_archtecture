// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserBookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      uid: json['uid'] as String,
      username: json['username'] as String?,
      isUser: json['isUser'] as bool,
      email: json['email'] as String,
      address: json['address'] as String?,
      age: json['age'] as int?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'isUser': instance.isUser,
      'email': instance.email,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob,
    };

BookingDetail _$BookingDetailFromJson(Map<String, dynamic> json) =>
    BookingDetail(
      id: json['id'] as int,
      status: json['status'] as String,
      bookingId: json['bookingId'] as int,
      downloadRequired: json['downloadRequired'] as bool,
      serviceUniqueId: json['serviceUniqueId'] as String,
      serviceType: json['serviceType'] as String,
      confirmationNo: json['confirmationNo'] as String?,
      bookingResultId: json['bookingResultId'] as String,
    );

Map<String, dynamic> _$BookingDetailToJson(BookingDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'bookingId': instance.bookingId,
      'downloadRequired': instance.downloadRequired,
      'serviceUniqueId': instance.serviceUniqueId,
      'serviceType': instance.serviceType,
      'confirmationNo': instance.confirmationNo,
      'bookingResultId': instance.bookingResultId,
    };

BookingList _$BookingListFromJson(Map<String, dynamic> json) => BookingList(
      referenceNo: json['referenceNo'] as String,
      userId: json['userId'] as String?,
      bookingDetails: (json['bookingDetails'] as List<dynamic>)
          .map((e) => BookingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingListToJson(BookingList instance) =>
    <String, dynamic>{
      'referenceNo': instance.referenceNo,
      'userId': instance.userId,
      'bookingDetails': instance.bookingDetails,
    };
