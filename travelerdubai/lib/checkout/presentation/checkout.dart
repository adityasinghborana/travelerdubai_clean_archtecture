import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/checkout_controller.dart';
import 'package:travelerdubai/checkout/presentation/widgets/Guest_Form_Field_List.dart';
import 'package:travelerdubai/checkout/presentation/widgets/Textformfield.dart';
import 'package:travelerdubai/checkout/presentation/widgets/ordersummary.dart';
import 'package:travelerdubai/checkout/presentation/widgets/productlist.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/experiences/Presentation/experiences_controller.dart';
import 'package:travelerdubai/experiences/Presentation/widgets/tourcards.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/tourscard.dart';

import '../../experiences/Usecase/experience_usecase.dart';
import '../../experiences/remote/experiences_remote_service.dart';
import '../../experiences/repository/Experiences_repository.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  final ExperienceController experienceController = Get.put(
      ExperienceController(GetExperiencesUseCase(
          ExperiencesRepositoryImpl(ExperienceRemoteService(Dio())))));

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
                              Expanded(
                                child: buildTextFormField(
                                    'Full Name', checkoutController.nameController),
                              ),
                              SizedBox(
                                  width:
                                      16), // Adjust the spacing between the text fields
                              Expanded(
                                child: buildTextFormField('Address',
                                    checkoutController.addressController),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildTextFormField(
                                    'Email', checkoutController.emailController),
                              ),
                              SizedBox(
                                  width:
                                      16), // Adjust the spacing between the text fields
                              Expanded(
                                child: buildTextFormField('Mobile No',
                                    checkoutController.mobileNoController),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildTextFormField(
                                    'City', checkoutController.cityController),
                              ),
                              SizedBox(
                                  width:
                                      16), // Adjust the spacing between the text fields
                              Expanded(
                                child: buildTextFormField(
                                    'State', checkoutController.stateController),
                              ),
                              SizedBox(
                                  width:
                                      16), // Adjust the spacing between the text fields
                              Expanded(
                                child: buildTextFormField('Country',
                                    checkoutController.countryController),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Text(
                            'Additionl Guest Information',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          buildGuestListTile(),

                          SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed("/payment");
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
                      child:Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: OrderSumary(500),
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
