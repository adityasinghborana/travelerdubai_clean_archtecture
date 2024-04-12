import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/widgets/ordersummary.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';
import 'package:travelerdubai/core/widgets/Mobileheader.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/button.dart';
import 'package:travelerdubai/userdashboard/widgets/Profile_info.dart';
import '../../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../../Cart/data_layer/service/cart_remote.dart';
import '../../../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../../../bookings/data_layer/repository/bookings_repository.dart';
import '../../../../bookings/data_layer/service/booking_remote.dart';
import '../../../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/Textformfield.dart';
import '../../../data_layer/repository/Intent_repository.dart';
import '../../../data_layer/service/remote.dart';
import '../../../data_layer/usecase/intent_usecase.dart';
import '../../checkout_controller.dart';
import '../../widgets/customexpansionlisttile.dart';
import '../../widgets/paxtype_dropdown.dart';
import '../../widgets/prefix_dropdown.dart';

class CheckoutScreenMobile extends StatelessWidget {

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
   CheckoutScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileHeader(),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(gradient: backgroundgradient),
        child:
//
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(bottom: Get.width>600 ? Get.width*0.01:Get.width*0.05),
              child: Column(
                children: [
                  CustomExpansionTile(
                   initiallyExpanded: true,
                    title: Text("Primary Guest Information",style: Get.width>600? bodyblack(context).copyWith(fontSize: 32 ):bodyblack(context)),

                    expandedIcon: Icons.arrow_drop_up,
                    collapsedIcon: Icons.arrow_drop_down,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
                        child: InputDetials(),
                      ),
                    ],
                  ),
                  CustomExpansionTile(
                    initiallyExpanded: true,
                    title: Text("Primary Guest Information", style: Get.width>600? bodyblack(context).copyWith(fontSize: 32 ):bodyblack(context),),

                    expandedIcon: Icons.arrow_drop_up,
                    collapsedIcon: Icons.arrow_drop_down,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: Get.width>600 ? Get.width*0.01:Get.width*0.05),
                            child: ProductList(height: Get.width>600 ? Get.width*0.6:Get.width*1.1,width: Get.width*0.9,),
                          ),
                        ],
                      ),
                      Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(horizontal: Get.width>600 ? Get.width*0.05:Get.width*0.05),
                              child: OrderSumary(checkoutController.Totalprice.value),
                            ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Get.width>600 ? Get.width*0.05:Get.width*0.05),
                        child: Row(
                          children: [
                            Expanded(child: InlineFlexButton(label: "Place Order", onPressed: (){checkoutController.initiatechekout();},bgcolor: colorMediumBlue, fontsize: Get.width>600 ?  24: 16, vpadding:   Get.width>600 ? Get.width*0.01:Get.width*0.05),),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),


      ),
    );
  }


  Widget InputDetials() {
    return Container(
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          // Add widgets for displaying order items and total amount

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: DropdownPrefix( width: Get.width*0.15),
              ),

              Flexible(
                flex: 2,
                child: buildTextFormField('First Name',
                    checkoutController.firstNameController,
                    "this field is required"),
              ),

              // Adjust the spacing between the text fields

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: DropdownPaxType(width: Get.width*0.15),
              ),

              Flexible(
                flex: 2,
                child: buildTextFormField('Last Name',
                    checkoutController.lastNameController,
                    "this field is required"),
              ),


            ],
          ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: buildTextFormField('Email',
                  checkoutController.emailController,
                  "this field is required"),
            ),
          ],
        ),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: buildTextFormField('Mobile Number',
                      checkoutController.mobileNoController,
                      "this field is required"),
                ),
            ],
          ),

          Row(children: [
            Flexible(
                flex: 1,
                child: buildTextFormField('Nationality',
                    checkoutController.nationalityController,
                    "this field is required"),
              ),
          ],),
          Row(children: [

            Flexible(
              flex: 1,
              child: buildTextFormField('Pickup',
                  checkoutController.pickupController,
                  "this field is required"),
            ),
          ],),
          Row(children: [

            Flexible(
              flex: 1,
              child: buildTextFormField('Message',
                  checkoutController.messageController,
                  "this field is required"),
            ),
          ],),


        ],
      ),
    );
  }
}