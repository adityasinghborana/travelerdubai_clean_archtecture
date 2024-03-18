import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/update_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/create_cart_response.dart';
import 'package:travelerdubai/Cart/data_layer/model/response/update_cart.dart';

import '../model/response/get_cart_response.dart';
import '../service/cart_remote.dart';

abstract  class CartRepository {
  Future<CreateCartResponse>createCart(CreateCartRequest requestBody);
  Future<GetCartResponse>getCart(CreateCartRequest requestBody);
  Future<UpdateCartResponse> updateCart(UpdateCartTourDetail requestBody);
}



class CartRepositoryImpl implements CartRepository {
  final CartRemoteService remoteService;

  CartRepositoryImpl(this.remoteService);


  @override
  Future<CreateCartResponse> createCart(CreateCartRequest requestBody) async {
    try {
      CreateCartResponse response = await remoteService.createCart(requestBody);


      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to create Cart");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error creating cart: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }

  @override
  Future<GetCartResponse> getCart(CreateCartRequest requestBody) async {
    try {
      GetCartResponse response = await remoteService.getCart(requestBody);


      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to get Cart");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error getting cart: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
  @override
  Future<UpdateCartResponse> updateCart(UpdateCartTourDetail requestBody) async {
    try {
      UpdateCartResponse response = await remoteService.updateCart(requestBody);


      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to update Cart");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error updating cart: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
}