import 'dart:async';
import 'package:get/get.dart';

import '../tourdetail_data_layer/model/tour_model.dart';


class ImageChangerController extends GetxController {
  var currentIndex = 0.obs;
  List<TourImageModel> imageList = [];
  late Timer rotationTimer;
  @override
  void onInit() {
    startImageRotation();
    //startImageRotation();
    super.onInit();
  }

  void updateImageList(List<TourImageModel> images) {
    imageList = images;
  }

  void nextImage() {
    currentIndex.value = (currentIndex.value + 1) % imageList.length;
  }

  void previousImage() {
    currentIndex.value = (currentIndex.value - 1) % imageList.length;
  }

  void startImageRotation() {
    rotationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentIndex.value = ((currentIndex.value + 1) % imageList.length).ceil();
    });
  }
}
