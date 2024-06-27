import 'package:json_annotation/json_annotation.dart';

part 'delete_cart.g.dart';
@JsonSerializable()
class DeleteCart {
final int id;
  DeleteCart({required this.id});

  factory DeleteCart.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteCartToJson(this);
}
