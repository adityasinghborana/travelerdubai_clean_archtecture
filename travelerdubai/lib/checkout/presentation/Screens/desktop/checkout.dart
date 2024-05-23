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
import 'package:travelerdubai/checkout/presentation/widgets/ordersummary.dart';
import 'package:travelerdubai/checkout/presentation/widgets/paxtype_dropdown.dart';
import 'package:travelerdubai/checkout/presentation/widgets/prefix_dropdown.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/core/widgets/Textformfield.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../../../data_layer/repository/Intent_repository.dart';
import '../../../data_layer/service/remote.dart';
import '../../../data_layer/usecase/intent_usecase.dart';

class CheckoutScreenDesktop extends StatelessWidget {
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

  CheckoutScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundgradient),
        height: Get.height,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Header(),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.018, right: 48, bottom: 16, top: 16),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width / 20, right: (Get.width * 0.01) / 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          height: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Get.width * 0.025),
                                  alignment: Alignment.centerLeft,
                                  height:
                                      MediaQuery.of(context).size.width * .06,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: colorwhite,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    'Primary Guest Infomation',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Add widgets for displaying order items and total amount

                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        .02),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.005),
                                        child: DropdownPrefix(
                                            width: Get.width * 0.04),
                                      ),
                                    ),
                                    SizedBox(width: Get.width * 0.015),
                                    Flexible(
                                      flex: 3,
                                      child: buildTextFormField(
                                          'First Name *',
                                          checkoutController
                                              .firstNameController,
                                          "this field is required",
                                          null),
                                    ),
                                    SizedBox(width: Get.width * 0.015),
                                    // Adjust the spacing between the text fields
                                    Flexible(
                                      flex: 3,
                                      child: buildTextFormField(
                                          'Last Name*',
                                          checkoutController.lastNameController,
                                          "this field is required",
                                          null),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.005),
                                        child: DropdownPaxType(
                                            width: Get.width * 0.04),
                                      ),
                                    ),
                                    SizedBox(width: Get.width * 0.015),
                                    Flexible(
                                      flex: 3,
                                      child: buildTextFormField(
                                          'Email*',
                                          checkoutController.emailController,
                                          "this field is required",
                                          null),
                                    ),
                                    SizedBox(width: Get.width * 0.015),
                                    // Adjust the spacing between the text fields
                                    Flexible(
                                      flex: 3,
                                      child: buildTextFormField(
                                          'Mobile Number*',
                                          checkoutController.mobileNoController,
                                          "this field is required",
                                          null),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: Get.width * 0.086),

                                    // Adjust the spacing between the text fields
                                    Flexible(
                                      flex: 3,
                                      child: buildTextFormField(
                                          'Nationality*',
                                          checkoutController
                                              .nationalityController,
                                          "this field is required",
                                          null),
                                    ),
                                    SizedBox(width: Get.width * 0.02),
                                    Flexible(
                                      flex: 3,
                                      child: buildTextFormField(
                                          'Pickup*',
                                          checkoutController.pickupController,
                                          "this field is required",
                                          null),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(flex: 1, child: Container()),
                                    Flexible(
                                      flex: 6,
                                      child: buildTextFormField(
                                          'Message*',
                                          checkoutController.messageController,
                                          "this field is required",
                                          null),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 4),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: colorwhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      'Order Summary',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 4),
                                  child: ProductList(
                                    height: Get.width * 0.5,
                                  ),
                                ),
                                Obx(
                                  () => OrderSumary(
                                      checkoutController.Totalprice.value),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        .01),
                                InlineFlexButton(
                                  onPressed: () {
                                    checkoutController.initiateCheckout();
                                  },
                                  label: 'Place Order',
                                  bgcolor: colorMediumBlue,
                                  borderwidth: 0,
                                  vpadding: 10,
                                  hpadding: 50,
                                  fontsize: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
