import 'package:json_annotation/json_annotation.dart';

part 'UserBookings.g.dart';


@JsonSerializable()
class User {
  final int id;
  final String uid;
  final String? username;
  final bool isUser;
  final String email;
  final String? address;
  final int? age;
  final String? dob;

  User({
    required this.id,
    required this.uid,
    this.username,
    required this.isUser,
    required this.email,
    this.address,
    this.age,
    this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class BookingDetail {
  final int id;
  final String status;
  final DateTime createdAt;

  final int bookingId;
  final bool downloadRequired;
  final String serviceUniqueId;
  final String serviceType;
  final String? confirmationNo;
  final String bookingResultId;

  BookingDetail({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.bookingId,
    required this.downloadRequired,
    required this.serviceUniqueId,
    required this.serviceType,
    this.confirmationNo,
    required this.bookingResultId,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) => _$BookingDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDetailToJson(this);
}

@JsonSerializable()
class BookingList {
  final String referenceNo;
  final String? userId;
  final List<BookingDetail> bookingDetails;

  BookingList({
    required this.referenceNo,
    this.userId,
    required this.bookingDetails,
  });

  factory BookingList.fromJson(Map<String, dynamic> json) => _$BookingListFromJson(json);

  Map<String, dynamic> toJson() => _$BookingListToJson(this);
}