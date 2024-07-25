import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Components/Textformfield.dart';
import '../Components/custom_button.dart';
import '../Components/header.dart';
import '../checkout/data_layer/repository/Intent_repository.dart';
import '../checkout/data_layer/service/remote.dart';
import '../checkout/data_layer/usecase/intent_usecase.dart';
import '../core/constants/constants.dart';
import 'eventcheckoutController.dart';

class EventCheckOut extends StatelessWidget {
  const EventCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final EventCheckoutController checkoutController = Get.put(
        EventCheckoutController(intentUseCase: IntentUseCase(
          StripeIntentRepositoryImpl(
            StripeRemoteService(Dio()),
          ),
        ),));
    return Scaffold(
      body: Column(
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
                              padding: EdgeInsets.only(left: Get.width * 0.025),
                              alignment: Alignment.centerLeft,
                              height: MediaQuery
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Add widgets for displaying order items and total amount

                            SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .02),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: buildTextFormField(
                                      'First Name *',
                                      checkoutController.firstNameController,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13.0),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: colorlightgrey, width: 1),
                                          color: colorwhite),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 13),
                                        child:
                                        Obx(() {
                                          return Text(
                                              "${checkoutController.email}");
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: Get.width * 0.086),

                                // Adjust the spacing between the text fields
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      flex:1,child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(minHeight:Get.width > 1000 ? Get.height * 0.55 : 460 ,maxHeight: Get.width > 1000 ? Get.height * 0.70 : 460 ),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Event Booking Summary ",style: H1black.copyWith(fontSize: 24 ,fontWeight: FontWeight.w700),),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Event Name "),
                                              Text("Event Name Placeholder"),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.016),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: const Text("Date", textAlign: TextAlign.left)),
                                              const Text("Date Placeholder", textAlign: TextAlign.left),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                  const Divider(height: 1),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.016),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Time"),
                                              Text("Time Placeholder"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(height: 1),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.016),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Adult"),
                                              Text("Adult Count Placeholder"),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Children"),
                                              Text("Children Count Placeholder"),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Infant"),
                                              Text("Infant Count Placeholder"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(height: 1),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.016),
                                    child:  const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Subtotal", style: TextStyle(fontWeight: FontWeight.bold)),
                                              Text("Subtotal Amount"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.warning, color: Colors.red),
                                            Text(
                                              "Non Refundable",
                                              style: TextStyle(
                                                color: Colors.red.shade900,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0 ),
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
                      )

                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
