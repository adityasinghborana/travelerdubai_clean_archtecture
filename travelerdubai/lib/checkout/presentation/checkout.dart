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
import 'package:travelerdubai/checkout/presentation/widgets/prefix_dropdown.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';
import 'package:travelerdubai/core/constants/constants.dart';
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
      body: Container(
        decoration: BoxDecoration(gradient: backgroundgradient),
        height: Get.height,
        child: Column(
          children: [
            Header(),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 48,bottom: 16, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 4),
                            child: Container(
                              padding: EdgeInsets.only(left: 30),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width:double.infinity,
                              decoration:BoxDecoration(color: colorwhite,borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Primary Guest Infomation',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // Add widgets for displaying order items and total amount

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex:1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownPrefix(),
                                ),
                              ),
                              SizedBox(width: 16),
                             Flexible(
                               flex:3,
                                child: buildTextFormField('First Name',
                                    checkoutController.firstNameController,"this field is required"),
                              ),
                              SizedBox(width: 16),
                              // Adjust the spacing between the text fields
                             Flexible(
                               flex:3,
                                child: buildTextFormField('Last Name',
                                    checkoutController.lastNameController,"this field is required"),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex:1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownPaxType(),
                                ),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                flex:3,
                                child: buildTextFormField('Email',
                                    checkoutController.emailController,"this field is required"),
                              ),
                              SizedBox(width: 16),
                              // Adjust the spacing between the text fields
                              Flexible(
                                flex:3,
                                child: buildTextFormField('Mobile Number',
                                    checkoutController.mobileNoController,"this field is required"),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Flexible(
                                flex:1,
                                child: Container(),
                              ),
                      SizedBox(width: 8,),

                              // Adjust the spacing between the text fields
                             Flexible(
                               flex: 3,
                                child: buildTextFormField('Nationality',
                                    checkoutController.nationalityController,"this field is required"),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                flex: 3,
                                child: buildTextFormField('Pickup',
                                    checkoutController.pickupController,"this field is required"),
                              ),

                            ],
                          ),
                          Row(children: [
                            SizedBox(width: 5,),
                            Flexible(
                                flex:1,child: Container()),
                            Flexible(
                              flex: 6,
                              child: buildTextFormField('Message',
                                  checkoutController.messageController,"this field is required"),
                            ),
                          ],),


                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 4),
                          child: Container(
                            padding: EdgeInsets.only(left: 30),
                            alignment: Alignment.centerLeft,
                            height: 60,
                            width:double.infinity,
                            decoration:BoxDecoration(color: colorwhite,borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Order Summary',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left:20.0,right: 4),
                          child: ProductList(),
                        ),
                        Obx(
                              () => OrderSumary(checkoutController.Totalprice.value),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
