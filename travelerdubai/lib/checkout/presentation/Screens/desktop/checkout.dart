import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/checkcoupon.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/get_cart_usecase.dart';
import 'package:travelerdubai/Components/custom_button.dart';
import 'package:travelerdubai/bookings/data_layer/repository/bookings_repository.dart';
import 'package:travelerdubai/bookings/data_layer/service/booking_remote.dart';
import 'package:travelerdubai/bookings/data_layer/usecase/bookings_usecase.dart';
import 'package:travelerdubai/checkout/presentation/checkout_controller.dart';

import 'package:travelerdubai/checkout/presentation/widgets/paxtype_dropdown.dart';
import 'package:travelerdubai/checkout/presentation/widgets/prefix_dropdown.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/Components/Textformfield.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';

import '../../../../Cart/data_layer/usecase/deletecart_usecase.dart';
import '../../../data_layer/repository/Intent_repository.dart';
import '../../../data_layer/service/remote.dart';
import '../../../data_layer/usecase/intent_usecase.dart';

class CheckoutScreenDesktop extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(
    CheckoutController(
        checkCouponUseCase: CheckCouponUseCase(CartRepositoryImpl(
          CartRemoteService(Dio()),
        )),
        deleteCartItemUseCase: DeleteCartItemUseCase(CartRepositoryImpl(
          CartRemoteService(Dio()),
        )),
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
                    left: Get.width * 0.018, right: 48, bottom: 0, top: 16),
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * .06,
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
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        .02),

                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
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
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 13.0),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: colorlightgrey,
                                                  width: 1),
                                              color: colorwhite),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13),
                                            child: Obx(() {
                                              return Text(
                                                  "${checkoutController
                                                      .email}");
                                            }),
                                          ),
                                        )),
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: buildTextFormField(
                                          'Pickup(if transfer selected)',
                                          checkoutController.pickupController,
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
                        width: Get.width * 0.05,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.90,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0, right: 4),
                                child: Container(
                                  padding: EdgeInsets.only(left: 30),
                                  alignment: Alignment.centerLeft,
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: colorwhite,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    'Order Summary',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0, right: 4),
                                child: Container(
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                          child: buildTextFormField(
                                              'Apply Coupon',
                                              checkoutController
                                                  .couponController,
                                              "this field is required",
                                              null),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: ButtonView(
                                            txtColor: colorMediumBlue,
                                            btnName: "Apply",
                                            bgColor: Colors.transparent,
                                            borderColor: colorMediumBlue,
                                            onButtonTap: () {
                                              checkoutController.checkcoupon();
                                            },
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0, right: 4),
                                child: ProductList(
                                  height: Get.width * 0.5,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(Get.height * 0.03),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Total",
                                        style: bodyBlack(Get.context!).copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Flexible(
                                        child: Obx(() {
                                          var price = double.tryParse(
                                              checkoutController
                                                  .Totalprice.value) ??
                                              0.0;
                                          String formattedPrice =
                                          price.toStringAsFixed(2);
                                          return Text(
                                            "AED ${formattedPrice}",
                                            style: bodyBlack(Get.context!)
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold),
                                          );
                                        }),
                                      ),
                                    ]),
                              ),
                              // SizedBox(
                              //     height:
                              //         MediaQuery.of(context).size.width * .005),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ButtonView(
                                  btnName: "place order",
                                  onButtonTap: () {
                                    checkoutController.initiateCheckout();
                                  },
                                  bgColor: colorMediumBlue,
                                  borderColor: Colors.transparent,
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
            ],
          ),
        ),
      ),
    );
  }
}
