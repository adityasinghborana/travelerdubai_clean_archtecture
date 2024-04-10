import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/data_layer/repository/Intent_repository.dart';
import 'package:travelerdubai/checkout/data_layer/service/remote.dart';
import 'package:travelerdubai/checkout/data_layer/usecase/intent_usecase.dart';

import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../../bookings/data_layer/repository/bookings_repository.dart';
import '../../../bookings/data_layer/service/booking_remote.dart';
import '../../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../checkout_controller.dart';

Widget DropdownPaxType() {
  final CheckoutController controller = Get.put(
    CheckoutController(
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButton<String>(
        value: controller.selectedValue.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.updateSelectedValue(newValue);
          }
        },
        items: <String>['Adult', 'Child', 'Infant']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  });
}
