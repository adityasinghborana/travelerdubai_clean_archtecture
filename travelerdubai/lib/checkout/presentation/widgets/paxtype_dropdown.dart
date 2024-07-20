import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/data_layer/repository/Intent_repository.dart';
import 'package:travelerdubai/checkout/data_layer/service/remote.dart';
import 'package:travelerdubai/checkout/data_layer/usecase/intent_usecase.dart';

import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/deletecart_usecase.dart';
import '../../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../../bookings/data_layer/repository/bookings_repository.dart';
import '../../../bookings/data_layer/service/booking_remote.dart';
import '../../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../checkout_controller.dart';

Widget DropdownPaxType( {double width = 150}) {


  final CheckoutController controller = Get.put(
    CheckoutController(
        deleteCartItemUseCase:DeleteCartItemUseCase(CartRepositoryImpl(CartRemoteService(Dio()),)),
      getCartUseCase: GetCartUseCase(
        CartRepositoryImpl(
          CartRemoteService(Dio()),
        ),
      ),
      intentUseCase: IntentUseCase(
        StripeIntentRepositoryImpl(
          StripeRemoteService(Dio()),
        ),
      ),
        doBookingUseCase: DoBookingUseCase(BookingsRepositoryImpl(BookingsRemoteService(Dio())))
    ),
  );

  return Obx(() {
    return  DropdownButton<String>(

        value: controller.selectedValue.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.updateSelectedValue(newValue);
          }
        },
        items: <String>['Adult']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(width:width,child: Text(value)),
          );
        }).toList(),
      );

  });
}
