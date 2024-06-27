import 'package:json_annotation/json_annotation.dart';
part 'user_bookings.g.dart';

@JsonSerializable()
class UserBookingsRequest {
  final String id;

  UserBookingsRequest ({required this.id});
  factory UserBookingsRequest.fromJson(Map<String, dynamic> json) =>
      _$UserBookingsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserBookingsRequestToJson(this);

}