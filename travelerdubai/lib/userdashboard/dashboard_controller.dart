import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/bookings/data_layer/model/request/user_bookings.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/UserBookings.dart';
import 'package:travelerdubai/bookings/data_layer/usecase/userbookings_usecase.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';

import '../core/service/auth.dart';

class DashBoardController extends GetxController {
  final HeaderController headerController = Get.find();

  final GetUserBookingsUseCase getUserBookingsUseCase;

  DashBoardController(this.getUserBookingsUseCase);


  @override
  void onInit() {
    super.onInit();
    getBookings();
  }


  RxList<BookingList> userBookingList = <BookingList>[].obs;
  RxList<BookingDetail> userbookings=<BookingDetail>[].obs;
  RxInt selectedIndex = 0.obs;

  final AuthClass authClass = AuthClass();


  void getBookings() {
    print("${headerController.userid.value}");
    getUserBookingsUseCase.execute(
        UserBookingsRequest(userId: headerController.userid.value)).then((
        value) {
      if (value != null) {
        userBookingList.value.addAll(value);
        for (var item in value) {
          userbookings.value.addAll(item.bookingDetails);
        }
      } else {
        print("no bookings found");
      }
    });
  }



  Future<void> signOut() async {
    await authClass.signOut(context: Get.context!).then((value) =>
        deleteUserUID());

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

   if(isEditMode.isTrue){
     islabel.value = "Save";
   }
   else{
     islabel.value="Edit";
   }
  }
}
