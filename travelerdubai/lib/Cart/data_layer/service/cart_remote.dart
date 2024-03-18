import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/create_cart_response.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/get_cart_response.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/update_cart.dart';
import 'package:travelerdubai/core/constants/contants.dart';

import '../model/request/update_cart.dart';


part 'cart_remote.g.dart';



@RestApi(baseUrl: baseurl)
abstract class CartRemoteService {
  factory CartRemoteService(Dio dio, {String? baseUrl}) =
  _CartRemoteService;


   @POST('/createcart')
  Future<CreateCartResponse> createCart(
      @Body() CreateCartRequest requestBody,
      );
  @POST('/cart')
  Future<GetCartResponse> getCart(
      @Body() CreateCartRequest requestBody,
      );
  @PUT('/updatecart')
  Future<UpdateCartResponse> updateCart(
      @Body()  UpdateCartTourDetail requestBody,
      );
}

