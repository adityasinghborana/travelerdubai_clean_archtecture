import 'package:json_annotation/json_annotation.dart';
part 'update_cart.g.dart';

@JsonSerializable()
class UpdateCartResponse {
  final bool success;
  final UpdateCartData data;

  UpdateCartResponse({
    required this.success,
    required this.data,
  });

 factory  UpdateCartResponse.fromJson(Map<String, dynamic> json) => _$UpdateCartResponseFromJson(json);
   Map<String, dynamic> toJson() => _$UpdateCartResponseToJson(this);
}
@JsonSerializable()
class UpdateCartData {
  final int id;
  final int serviceUniqueId;
  final String? tourname;
  final String? tourOption;
  final int tourId;
  final int optionId;
  final int ?adult;
  final int? child;
  final int? infant;
  final String? tourDate;
  final int timeSlotId;
  final String? startTime;
  final int transferId;
  final String? pickup;
  final double? adultRate;
  final double? childPrice;
  final double ?serviceTotal;
  final int cartId;

  UpdateCartData({
    required this.id,
    required this.serviceUniqueId,
    required this.tourname,
    required this.tourOption,
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
    required this.childPrice,
    required this.serviceTotal,
    required this.cartId,
  });

  factory UpdateCartData.fromJson(Map<String, dynamic> json) => _$UpdateCartDataFromJson(json);
    Map<String, dynamic> toJson() => _$UpdateCartDataToJson(this);
}