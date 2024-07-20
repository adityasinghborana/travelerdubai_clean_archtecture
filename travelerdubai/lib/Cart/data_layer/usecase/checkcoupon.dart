import 'package:travelerdubai/Cart/data_layer/model/request/coupon.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/checkcouponresponse.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';

class CheckCouponUseCase {
  final  CartRepository repository;

  CheckCouponUseCase(this.repository);

  Future<CheckCouponResponse> execute(CouponRequest data) {
    return repository.CheckCoupon(data);
  }
}