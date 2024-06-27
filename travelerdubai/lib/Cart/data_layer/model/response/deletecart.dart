import 'package:json_annotation/json_annotation.dart';

import 'get_cart_response.dart';
part 'deletecart.g.dart';
@JsonSerializable()
class Deletecartresponse {
final int status;
final CartTourDetail deletedCartTourDetail;
  Deletecartresponse({required this.status,required this.deletedCartTourDetail});

  factory Deletecartresponse.fromJson(Map<String, dynamic> json) =>
      _$DeletecartresponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeletecartresponseToJson(this);
}
