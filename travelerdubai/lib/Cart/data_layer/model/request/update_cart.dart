import 'package:json_annotation/json_annotation.dart';

part 'update_cart.g.dart';

@JsonSerializable()
class UpdateCartTourDetail {
  final String tourname;
  final String tourOption;
  final int tourId;
  final int optionId;
  final int? adult;
  final int? child;
  final int? infant;
  final String tourDate;
  int? timeSlotId;
  final String startTime;
  final int transferId;
  final String? pickup;
  final double? adultRate;
  final double? childRate;
  final double serviceTotal;
  final int cartId;

  UpdateCartTourDetail({
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
    this.pickup,
    required this.adultRate,
    required this.childRate,
    required this.serviceTotal,
    required this.cartId,
  });
  factory UpdateCartTourDetail.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartTourDetailFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateCartTourDetailToJson(this);
}
