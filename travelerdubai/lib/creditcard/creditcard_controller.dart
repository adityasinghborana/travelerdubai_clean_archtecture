import 'package:get/get.dart';

class CardPaymentController extends GetxController {
  late RxString name;
  late RxString cardNumber;
  late RxString expiryDate;
  late RxString cvv;
  late RxString status;
  @override
  void onInit() {
    super.onInit();
    name = ''.obs;
    cardNumber = ''.obs;
    expiryDate = ''.obs;
    cvv = ''.obs;
    status = ''.obs;
  }

  Future<void> payNow() async {
    await Future.delayed(Duration(seconds: 2));
    status.value = "failed";
  }
}
