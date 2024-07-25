import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/coupon.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/create_cart.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/delete_cart.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/checkcoupon.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/get_cart_usecase.dart';
import 'package:travelerdubai/Components/show_toast.dart';
import 'package:travelerdubai/Components/validation_logic.dart';
import 'package:travelerdubai/bookings/data_layer/model/request/booking_request.dart';
import 'package:travelerdubai/checkout/data_layer/model/request/intent_request.dart';
import 'package:travelerdubai/checkout/data_layer/usecase/intent_usecase.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/core/helperfunctions.dart';

import '../../Cart/data_layer/model/response/get_cart_response.dart';
import '../../Cart/data_layer/usecase/deletecart_usecase.dart';
import '../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../../paymentconfirmation/presentationlayer/failure.dart';
import '../../paymentconfirmation/presentationlayer/success.dart';
import 'model/guest.dart';

class CheckoutController extends GetxController {
  late  String  email ='';
  final HeaderController headerController = Get.find();
  final IntentUseCase intentUseCase;
  final GetCartUseCase getCartUseCase;
  final DoBookingUseCase doBookingUseCase;
  final CheckCouponUseCase? checkCouponUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;

  CheckoutController(
      {required this.getCartUseCase,
      required this.intentUseCase,
      required this.doBookingUseCase,
      required this.deleteCartItemUseCase,
         this.checkCouponUseCase
      });
  @override
  void onReady() async{
  await getEmailID().then((value)=>email=value??'no email found ');
  print("$email hello email");
    super.onReady();
  }
  var selectedValue = 'Adult'.obs;
  var selectedPrefixValue = 'Mr'.obs;
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
  TextEditingController couponController = TextEditingController();

  RxString stripeclientkey = "".obs;
  var Totalprice = "".obs;
  RxList<Guest> guests = <Guest>[].obs;
  RxString refno = "".obs;

  @override
  void onInit() {
    getCart();
    super.onInit();
  }




  Future<void> getCart() async {
    headerController.getUserUID().then((value) async {
      CreateCartRequest data = CreateCartRequest(userId: value ?? "0");
      print(data.toJson());

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
          Totalprice.value="0";
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

  void updateSelectedPrefixValue(String newValue) {
    selectedPrefixValue.value = newValue;
  }

  void bookOrder() {}

  Future<void> initiateCheckout() async {
    if (!Validation.isValidFirstName(firstNameController.text)) {
      showToast(toastMessage: 'First Name is not valid');
    } else if (!Validation.isValidFirstName(lastNameController.text)) {
      showToast(toastMessage: 'Last Name  is not valid');
    } else if (!Validation.isValidEmail(emailController.text)) {
      showToast(toastMessage: 'email is not valid');
    } else if (!Validation.isValidPhoneNumber(mobileNoController.text)) {
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

  void doBookings() {
    List<Passenger> passengerdata = [
      Passenger(
          serviceType: "Tour",
          prefix: "Mr",
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          mobile: mobileNoController.text,
          nationality: "Indian",
          message: "Default Message",
          leadPassenger: 1,
          paxType: selectedValue.value)
    ];

    BookingRequest data = BookingRequest(
        pickup: pickupController.text,
        User: headerController.userid.value,
        cartid: cartId.value,
        passengers: passengerdata);
    if (kDebugMode) {
      print(passengerdata);
    }
    doBookingUseCase.execute(data).then((value) {
      if (value.data?.result?.referenceNo != null ||value.vendorbookings?.status == 200 ) {
        print(value.data?.result!.referenceNo);
        refno.value = value.data?.result?.referenceNo ?? "check Dashboard " ;
        Get.to(()=>PaymentSuccess());
      } else {
        Get.to(()=>FailureScreen());
      }
    });
  }

  void deleteCartItem(int id) async {
    deleteCartItemUseCase.execute(DeleteCart(id: id)).then((value) {
      if (value.status == 200) {
        cartTours.removeWhere((e) => e.id == id);
        getCart();
        //Totalprice.value = '800';
      }
      else{
        showToast(toastMessage: "nothing happend");
      }
    });
  }

  void checkcoupon(  ) async {
    print(cartId.value);
    checkCouponUseCase?.execute(CouponRequest(name: couponController.text.toString(), cartId: cartId.value)).then((value){
      if (value.error != null) {
        print(value.error);
        showToast(toastMessage: "${value.error}");
      }
      if (value.discountprice !=null && value.error == null){
        String Price = value.discountprice.toString();
        Totalprice.value=Price;
      }

    });

  }
}
