
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/get_cart_response.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';


class GetCartUseCase{
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<GetCartResponse> execute(
     CreateCartRequest data) {
    return repository.getCart( data);
  }
}