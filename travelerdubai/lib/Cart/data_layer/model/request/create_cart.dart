
import 'package:json_annotation/json_annotation.dart';
part 'create_cart.g.dart';

@JsonSerializable()
class CreateCartRequest {
  final String userId;


CreateCartRequest({required this.userId});


  factory CreateCartRequest.fromJson(Map<String, dynamic> json) => _$CreateCartRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCartRequestToJson(this);

}