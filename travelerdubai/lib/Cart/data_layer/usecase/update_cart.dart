
import 'package:travelerdubai/Cart/data_layer/model/request/update_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/update_cart.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';

class UpdateCartUseCase{
  final CartRepository repository;

 UpdateCartUseCase(this.repository);

  Future<UpdateCartResponse> execute(
     UpdateCartTourDetail data) {
    return repository.updateCart( data);
  }
}