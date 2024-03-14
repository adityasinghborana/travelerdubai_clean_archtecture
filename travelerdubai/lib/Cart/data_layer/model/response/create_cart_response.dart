
import 'package:json_annotation/json_annotation.dart';
part 'create_cart_response.g.dart';

@JsonSerializable()
class CreateCartResponse{

final bool success;

CreateCartResponse({required this.success});
factory CreateCartResponse.fromJson(Map<String, dynamic> json) => _$CreateCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCartResponseToJson(this);
}