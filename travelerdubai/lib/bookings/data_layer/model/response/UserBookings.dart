import 'package:json_annotation/json_annotation.dart';

part 'UserBookings.g.dart';


@JsonSerializable()
class BookingList {
  final int? id;
  final String? referenceNo;
  final String? userId;
  final String? roleId;
  final String? status;
  final User? user;
  final List<BookingDetails>? bookingDetails;

  BookingList({
    this.id,
    this.referenceNo,
    this.userId,
    this.roleId,
    this.status,
    this.user,
    this.bookingDetails,
  });

  factory BookingList.fromJson(Map<String, dynamic> json) => _$BookingListFromJson(json);
  Map<String, dynamic> toJson() => _$BookingListToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  final String? email;
  final String? address;
  final int? age;
  final String? dob;
  final bool? isUser;
  final String? uid;
  final String? username;

  User({
    this.id,
    this.email,
    this.address,
    this.age,
    this.dob,
    this.isUser,
    this.uid,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class BookingDetails {
  final int? id;
  final String? status;
  final int? bookingId;
  final bool? downloadRequired;
  final String? serviceUniqueId;
  final String? servicetype;
  final String? confirmationNo;
  final int? bookingResultId;
  final String? createdAt;

  BookingDetails({
    this.id,
    this.status,
    this.bookingId,
    this.downloadRequired,
    this.serviceUniqueId,
    this.servicetype,
    this.confirmationNo,
    this.bookingResultId,
    this.createdAt,
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) => _$BookingDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDetailsToJson(this);
}