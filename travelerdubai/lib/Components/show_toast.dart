import 'package:get/get.dart';

void showToast({required String toastMessage}) {
  Get.snackbar('Response', toastMessage, snackPosition: SnackPosition.TOP);
}
