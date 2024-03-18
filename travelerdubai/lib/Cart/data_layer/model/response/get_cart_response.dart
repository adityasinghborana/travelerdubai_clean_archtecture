

import 'package:json_annotation/json_annotation.dart';
part 'get_cart_response.g.dart';

@JsonSerializable()
class GetCartResponse {
  final bool success;
  final List<Result> data;

  GetCartResponse({
    required this.success,
    required this.data,
  });
factory GetCartResponse.fromJson(Map<String, dynamic> json) => _$GetCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCartResponseToJson(this);
}
@JsonSerializable()
class Result {
  final int id;
  final double totalamount;
  final int? uniqueNo;
  final String userId;
  final List<CartTourDetail> TourDetails;

  Result({
    required this.id,
    required this.totalamount,
     this.uniqueNo,
    required this.userId,
    required this.TourDetails,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
@JsonSerializable()
class CartTourDetail {
  final int id;
  final int serviceUniqueId;
  final String tourname;
  final String tourOption;
  final int tourId;
  final int optionId;
  final int? adult;
  final int? child;
  final int? infant;
  final String tourDate;
  final int? timeSlotId;
  final String startTime;
  final int transferId;
  final String? pickup;
  final double? adultRate;
  final double? childPrice;
  final double? serviceTotal;
  final int cartId;

  CartTourDetail({
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
this.pickup,
    required this.adultRate,
    required this.childPrice,
    required this.serviceTotal,
    required this.cartId,
  });
factory CartTourDetail.fromJson(Map<String, dynamic> json) => _$CartTourDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CartTourDetailToJson(this);

}
