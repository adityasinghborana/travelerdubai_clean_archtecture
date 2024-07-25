import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/helperfunctions.dart';

import '../Components/show_toast.dart';
import '../Components/validation_logic.dart';
import '../checkout/data_layer/model/request/intent_request.dart';
import '../checkout/data_layer/usecase/intent_usecase.dart';
import '../core/controller/headercontroller.dart';


class EventCheckoutController extends GetxController {



    RxString  email =''.obs;
  final HeaderController headerController = Get.find();
    final IntentUseCase intentUseCase;


    EventCheckoutController({required this.intentUseCase});
    RxString stripeclientkey = "".obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController prefixController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  TextEditingController couponController = TextEditingController();


  @override
  void onInit() {

    super.onInit();

    getEmailID().then((value)=> email.value=value??"no email found");
  }






    Future<void> initiateCheckout() async {
      if (!Validation.isValidFirstName(firstNameController.text)) {
        showToast(toastMessage: 'First Name is not valid');
      } else if (!Validation.isValidFirstName(lastNameController.text)) {
        showToast(toastMessage: 'Last Name  is not valid');
      }
      else if (!Validation.isValidPhoneNumber(mobileNoController.text)) {
        showToast(toastMessage: 'Mobile number is  not valid');
      } else {
        await intentUseCase
            .execute(IntentRequest(UserId: headerController.userid.value))
            .then((value) {
          if (value != null) {
            stripeclientkey.value = value.clientSecret;
            print(stripeclientkey.value);
          } else {
            print("error getting key");
          }
        }).then((value) {

          Get.toNamed("/payment");
        });
      }
    }
}

