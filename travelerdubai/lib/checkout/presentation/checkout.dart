import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/get_cart_usecase.dart';
import 'package:travelerdubai/bookings/data_layer/repository/bookings_repository.dart';
import 'package:travelerdubai/bookings/data_layer/service/booking_remote.dart';
import 'package:travelerdubai/bookings/data_layer/usecase/bookings_usecase.dart';
import 'package:travelerdubai/checkout/presentation/checkout_controller.dart';
import 'package:travelerdubai/checkout/presentation/widgets/paxtype_dropdown.dart';
import 'package:travelerdubai/core/widgets/Textformfield.dart';
import 'package:travelerdubai/checkout/presentation/widgets/ordersummary.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import '../data_layer/repository/Intent_repository.dart';
import '../data_layer/service/remote.dart';
import '../data_layer/usecase/intent_usecase.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(
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
            BookingsRepositoryImpl(BookingsRemoteService(Dio())))),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Primary Guest Infomation',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // Add widgets for displaying order items and total amount

                          SizedBox(height: 20),

                          Row(
                            children: [
                              Flexible(
                                child: buildTextFormField('Prefix',
                                    checkoutController.prefixController),
                              ),
                              SizedBox(width: 16),
                             Flexible(
                                child: buildTextFormField('First Name',
                                    checkoutController.firstNameController),
                              ),
                              SizedBox(width: 16),
                              // Adjust the spacing between the text fields
                             Flexible(
                                child: buildTextFormField('Last Name',
                                    checkoutController.lastNameController),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: buildTextFormField('Email',
                                    checkoutController.emailController),
                              ),
                              SizedBox(width: 16),
                              // Adjust the spacing between the text fields
                              Flexible(
                                child: buildTextFormField('Mobile No',
                                    checkoutController.mobileNoController),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Adjust the spacing between the text fields
                              Flexible(
                                child: buildTextFormField('Message',
                                    checkoutController.messageController),
                              ),
                              SizedBox(width: 16),
                              // Adjust the spacing between the text fields
                             Flexible(
                                child: buildTextFormField('Nationality',
                                    checkoutController.nationalityController),
                              ),
                              Flexible(
                                child: buildTextFormField('Pickup',
                                    checkoutController.pickupController),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Flexible(
                                  child: DropdownPaxType(),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              checkoutController.initiatechekout();
                            },
                            child: Text('Place Order'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Card(
                      elevation: 5,
                      child: Obx(
                        () => OrderSumary(checkoutController.Totalprice.value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
