import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/contactus/datalayer/models/request/postform.dart';
import 'package:travelerdubai/contactus/datalayer/usecase/postform_usecase.dart';
import 'package:travelerdubai/contactus/datalayer/usecase/usecase.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../Components/show_toast.dart';
import '../../Components/validation_logic.dart';
import '../datalayer/models/response/contactusresponse.dart';

class ContactUsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GetContactUsDataUseCase getContactUsDataUseCase;
  final PostFormUseCase postFormUsecase ;
  Rx<ContactUsData?> contactusdata = Rx<ContactUsData?>(null);

  ContactUsController({required this.getContactUsDataUseCase , required this.postFormUsecase});

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      getContactUsDataUseCase.execute().then((value) {
        if (value != null) {
          contactusdata.value = value;
        } else {
          print("errorrrrrr");
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void postForm()async {
    if (!Validation.isValidFirstName(nameController.text)) {
      showToast(toastMessage: 'Name is not valid');
    } else if (!Validation.isValidFirstName(messageController.text)) {
      showToast(toastMessage: 'message is not valid');
    } else if (!Validation.isValidEmail(emailController.text)) {
      showToast(toastMessage: 'email is not valid');
    } else if (!Validation.isValidPhoneNumber(mobileController.text)) {
      showToast(toastMessage: 'Mobile number is  not valid');
    } else {
      postFormUsecase.execute(PostForm(name: nameController.text, email: emailController.text, message: messageController.text, mobilenumber: mobileController.text)).then((value)=>showToast(toastMessage: "Form Submitted Succesfully"));
    }
  }
}
