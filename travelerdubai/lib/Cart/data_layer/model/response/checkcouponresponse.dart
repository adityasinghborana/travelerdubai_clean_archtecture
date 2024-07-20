import 'package:json_annotation/json_annotation.dart';
part 'checkcouponresponse.g.dart';
@JsonSerializable()
class CheckCouponResponse {
final int? discountprice;
final String? error;
  CheckCouponResponse(this.error,this.discountprice);

  factory CheckCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckCouponResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CheckCouponResponseToJson(this);
}
