// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserBookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingList _$BookingListFromJson(Map<String, dynamic> json) => BookingList(
      id: (json['id'] as num?)?.toInt(),
      referenceNo: json['referenceNo'] as String?,
      userId: json['userId'] as String?,
      roleId: json['roleId'] as String?,
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      bookingDetails: (json['bookingDetails'] as List<dynamic>?)
          ?.map((e) => BookingDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingListToJson(BookingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referenceNo': instance.referenceNo,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'status': instance.status,
      'user': instance.user,
      'bookingDetails': instance.bookingDetails,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      address: json['address'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      isUser: json['isUser'] as bool?,
      uid: json['uid'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'address': instance.address,
      'age': instance.age,
      'dob': instance.dob,
      'isUser': instance.isUser,
      'uid': instance.uid,
      'username': instance.username,
    };

BookingDetails _$BookingDetailsFromJson(Map<String, dynamic> json) =>
    BookingDetails(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      bookingId: (json['bookingId'] as num?)?.toInt(),
      downloadRequired: json['downloadRequired'] as bool?,
      serviceUniqueId: json['serviceUniqueId'] as String?,
      servicetype: json['servicetype'] as String?,
      confirmationNo: json['confirmationNo'] as String?,
      bookingResultId: (json['bookingResultId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$BookingDetailsToJson(BookingDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'bookingId': instance.bookingId,
      'downloadRequired': instance.downloadRequired,
      'serviceUniqueId': instance.serviceUniqueId,
      'servicetype': instance.servicetype,
      'confirmationNo': instance.confirmationNo,
      'bookingResultId': instance.bookingResultId,
      'createdAt': instance.createdAt,
    };
