import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/checkout/presentation/checkout.dart';

class Guest {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
}

class CheckoutController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  RxList<Guest> guests = <Guest>[].obs;
}
