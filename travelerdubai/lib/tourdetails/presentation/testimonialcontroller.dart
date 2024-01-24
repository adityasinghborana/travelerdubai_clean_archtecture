import 'dart:async';

import 'package:get/get.dart';

class TestimonialController extends GetxController {
  var currentIndex = 0.obs;
  List reviewList = [];
  late Timer rotationTimer;
  @override
  void onInit() {
    startRotation();
    //startImageRotation();
    super.onInit();
  }

  void updatereviewList(List reviews) {
    reviewList = reviews;
  }

  void nexttestimonial() {
    currentIndex.value = (currentIndex.value + 1) % reviewList.length;
    print(currentIndex.value);
    print(reviewList.toString());
  }

  void previoustestimonial() {
    currentIndex.value = (currentIndex.value - 1) % reviewList.length;
  }

  void startRotation() {
    rotationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentIndex.value = ((currentIndex.value + 1) % reviewList.length);
    });
  }
}
