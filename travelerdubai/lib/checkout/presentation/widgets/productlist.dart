import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../../bookings/data_layer/repository/bookings_repository.dart';
import '../../../bookings/data_layer/service/booking_remote.dart';
import '../../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../../data_layer/repository/Intent_repository.dart';
import '../../data_layer/service/remote.dart';
import '../../data_layer/usecase/intent_usecase.dart';
import '../checkout_controller.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CheckoutController cc = Get.put(
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
        doBookingUseCase: DoBookingUseCase(
          BookingsRepositoryImpl(
            BookingsRemoteService(Dio()),
          ),
        ),
      ),
    );

    return Container(
      height: 200,
      width: 200,
      child: Obx(
        () => ListView.builder(
          itemCount: cc.cartTours.length,
          itemBuilder: (context, index) {
            if (cc.cartTours.length != 0) {
              // Access the item at the given index
              return Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            "https://source.unsplash.com/random",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cc.cartTours[index].tourname),
                        Text("Price ${cc.cartTours[index].serviceTotal} AUD"),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // Handle the case where the index is out of range
              return Container(
                height: 10,
                width: 20,
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}
