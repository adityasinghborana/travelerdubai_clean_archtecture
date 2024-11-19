import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/request/updateuser.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/user_detail_response.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/get_user_details.dart';
import 'package:travelerdubai/auth/usersdatalayer/usecase/updateuser.dart';
import 'package:travelerdubai/bookings/data_layer/model/request/user_bookings.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/UserBookings.dart';
import 'package:travelerdubai/bookings/data_layer/usecase/userbookings_usecase.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';

import '../core/service/auth.dart';

class DashBoardController extends GetxController {


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final GetUserDetailsUseCase getUserDetailsUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final HeaderController headerController = Get.find();

  final GetUserBookingsUseCase getUserBookingsUseCase;

  DashBoardController(this.getUserBookingsUseCase, this.getUserDetailsUseCase,
      this.updateUserUseCase);

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getBookings();
    getUserDetails();
  }

  RxList<BookingList> userBookingList = <BookingList>[].obs;
  RxList<BookingDetails> userbookings = <BookingDetails>[].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  RxList<UserDetail> userDetails = <UserDetail>[].obs;

  final AuthClass authClass = AuthClass();

  void getBookings() {
    print("${headerController.userid.value}");
    try {
      print("${headerController.userid.value} hello");
      getUserBookingsUseCase
          .execute(UserBookingsRequest(id: headerController.userid.value))
          .then((value) {
        print("${headerController.userid.value} hii");
        if (value != null) {
          print(value[0].referenceNo);
          userBookingList.addAll(value);
          for (var item in value) {
            userbookings.addAll(item.bookingDetails ?? []);
          }
        } else {
          print("no bookings found");
        }
      });
    } catch (e) {
      print("what on the earth is going on");
    }
  }

  Future<void> signOut() async {
    await authClass
        .signOut(context: Get.context!)
        .then((value) => deleteUserUID());

    Get.offAllNamed(
        '/home'); // Assuming '/login' is the route for the login screen
  }

  Future<void> deleteUserUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userUID');
  }

  RxBool isEditMode = false.obs;
  RxString islabel = "Edit".obs;

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;

    if (isEditMode.isTrue) {
      islabel.value = "Save";
    } else {
      islabel.value = "Edit";
    }
  }

  void getUserDetails() {
    getUserDetailsUseCase.execute(headerController.userid.value).then((value) {
      if (value != null) {
        userDetails.value.assignAll(value);
        isLoading.value = false;
        print(value[0].mobileNo);
        print("got the data");
      } else {
        print("cont not get user detail");
      }
    });
  }

  void updateUser(){
    UpdateUser data = UpdateUser(email: emailController.text, username: nameController.text, mobileNo: mobileController.text, address: addressController.text, age: int.parse(ageController.text), dob: dobController.text.toString());
    updateUserUseCase.execute(data).then((value ){

      if (value.id !=null) { // Assuming value.status is the response status
        getUserDetails();
        Get.snackbar(
          "Info Saved",
          "Your Account Information is Added",
          snackPosition: SnackPosition.BOTTOM, // Optional: Customize the snackbar position
        );
      } else {
        // Handle error or other status codes if needed
        Get.snackbar(
          "Error",
          "Failed to update account information",
          snackPosition: SnackPosition.TOP, // Optional: Customize the snackbar position
        );
      }
    }).catchError((error) {
      // Handle any errors that occur during the update operation
      Get.snackbar(
        "Error",
        "An unexpected error occurred",
        snackPosition: SnackPosition.TOP, // Optional: Customize the snackbar position
      );
    });
  }
}
