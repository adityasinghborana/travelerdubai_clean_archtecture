import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/get_cart_usecase.dart';
import 'package:travelerdubai/bookings/data_layer/model/request/booking_request.dart';
import 'package:travelerdubai/checkout/data_layer/model/request/intent_request.dart';
import 'package:travelerdubai/checkout/data_layer/usecase/intent_usecase.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Cart/data_layer/model/response/get_cart_response.dart';
import '../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../../creditcard/creditcard.dart';
import '../../paymentconfirmation/presentationlayer/success.dart';
import 'model/guest.dart';

class CheckoutController extends GetxController {
  final HeaderController headerController = Get.find();
  final IntentUseCase intentUseCase;
  final GetCartUseCase getCartUseCase;
  final DoBookingUseCase doBookingUseCase;

  CheckoutController(
      {required this.getCartUseCase, required this.intentUseCase , required this.doBookingUseCase});

  var selectedValue = 'adult'.obs;
  RxInt cartId = 0.obs;


  var paymentmethodid = ''.obs;

  RxList<CartTourDetail> cartTours = <CartTourDetail>[].obs;
  RxList<Widget> dynamicWidgets = <Widget>[].obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController prefixController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  RxString stripeclientkey = "".obs;
  RxString Totalprice="".obs;
  RxList<Guest> guests = <Guest>[].obs;
  RxString refno = "".obs;

  @override
  void onInit() {

    getCart();
    super.onInit();
  }

  // Future<void> getCart() async {
  //
  //   headerController.getUserUID().then((value) {
  //     CreateCartRequest data =
  //     CreateCartRequest(userId: value??"0");
  //
  //
  //
  //   await getCartUseCase.execute(data).then((value) {
  //     if (value.data[0].TourDetails.isNotEmpty) {
  //       cartId.value = value.data[0].TourDetails[0].cartId;
  //       Totalprice.value = value.data[0].totalamount.toString();
  //       print(Totalprice.value);
  //       cartTours.assignAll(value.data[0].TourDetails);
  //
  //       for (CartTourDetail tourDetail in cartTours) {
  //         print('Tour Name: ${tourDetail.tourname}');
  //         print('Adult Rate: ${tourDetail.adultRate} AUD');
  //         print('Adult Rate: ${tourDetail.cartId} AUD');
  //         // Add other properties as needed
  //       }
  //     });
  //     } else {
  //       // Handle error
  //       print('Error fetching cart: ${value.success}');
  //     }
  //   }).catchError((error) {
  //     // Handle generic error
  //     print('Error: $error');
  //   });
  // }

  Future<void> getCart() async {
    headerController.getUserUID().then((value) async {
      CreateCartRequest data = CreateCartRequest(userId: value ?? "0");

      try {
        var response = await getCartUseCase.execute(data);

        if (response.data[0].TourDetails.isNotEmpty) {
          cartId.value = response.data[0].TourDetails[0].cartId;
          Totalprice.value = response.data[0].totalamount.toString();
          print(Totalprice.value);
          cartTours.assignAll(response.data[0].TourDetails);

          for (CartTourDetail tourDetail in cartTours) {
            print('Tour Name: ${tourDetail.tourname}');
            print('Adult Rate: ${tourDetail.adultRate} AUD');
            print('Cart ID: ${tourDetail.cartId} AUD');
            // Add other properties as needed
          }
        } else {
          // Handle error
          print('Error: Empty TourDetails');
        }
      } catch (error) {
        // Handle generic error
        print('Error: $error');
      }
    });
  }



  void updateSelectedValue(String newValue) {
    selectedValue.value = newValue;
  }

  void bookOrder() {}

  Future<void> initiatechekout() async {
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


      Get.toNamed("/payment");});
  }

  void doBookings (){
    List<Passenger>  passengerdata = [Passenger(serviceType: "Tour", prefix: prefixController.text, firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text, mobile: mobileNoController.text, nationality: nationalityController.text, message: messageController.text, leadPassenger: 1, paxType: selectedValue.value)];

    BookingRequest data = BookingRequest(pickup: pickupController.text, User: headerController.userid.value, cartid: cartId.value, passengers: passengerdata);
    
    doBookingUseCase.execute(data).then((value) {
      print(value.result?.referenceNo ?? "booking not generated");
      refno.value=value.result!.referenceNo!;
      Get.to(PaymentSuccess());
    });

  }
}
