import 'package:json_annotation/json_annotation.dart';
part 'coupon.g.dart';
@JsonSerializable()
class CouponRequest {
final String name;
final int cartId;
  CouponRequest({required this.name,required this.cartId});

  factory CouponRequest.fromJson(Map<String, dynamic> json) =>
      _$CouponRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CouponRequestToJson(this);
}
