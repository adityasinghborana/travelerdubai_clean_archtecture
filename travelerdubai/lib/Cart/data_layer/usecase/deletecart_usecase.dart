import 'package:travelerdubai/Cart/data_layer/model/request/delete_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/deletecart.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';

class DeleteCartItemUseCase {
  final CartRepository repository;

  DeleteCartItemUseCase(this.repository);

  Future<Deletecartresponse> execute( DeleteCart requestBody) {
    return repository.deleteCartItem(requestBody);
  }
}