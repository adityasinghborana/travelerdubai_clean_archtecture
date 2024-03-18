
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/create_cart_response.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';


class CreateCartUseCase{
  final CartRepository repository;

  CreateCartUseCase(this.repository);

  Future<CreateCartResponse> execute(
     CreateCartRequest data) {
    return repository.createCart( data);
  }
}