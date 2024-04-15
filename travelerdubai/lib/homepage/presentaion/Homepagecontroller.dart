import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';

import '../../experiences/Presentation/experiences_controller.dart';
import '../../experiences/Usecase/experience_usecase.dart';
import '../../experiences/remote/experiences_remote_service.dart';
import '../../experiences/repository/Experiences_repository.dart';

class HomeController extends GetxController {
  final GetHomePageDatUseCase homePageDataUseCase;
  Rx<HomepageData?> formData = Rx<HomepageData?>(null);

  RxList<String> imageList = RxList<String>(
    [
      'https://source.unsplash.com/random/?city,night',
      'https://source.unsplash.com/random/?dubai,night',
      'https://source.unsplash.com/random/?lasvegas,night'
    ],
  );
  var currentIndex = 0.obs;
  late Timer rotationTimer;
  late final PageController pageController=PageController();
  HomeController(this.homePageDataUseCase);

  @override
  void onInit() {
    fetchDataFromBackend();

    // startImageRotation();
    //fetchCityT();
    //fetchImagesFromAPI();
    super.onInit();
  }
  @override
  void dispose() {
    pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  void fetchDataFromBackend() async {
    try {
      final response = await homePageDataUseCase.execute();
      if (response != null) {
        HomepageData fetchedCityTour =
            response; // Assuming response is a list, take the first element
        formData.value = fetchedCityTour;
        if (kDebugMode) {
          print(formData.value!.id);
        }
      } else {
        if (kDebugMode) {
          print('Request failed with status');
        }
      }
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error fetching experiences: $e');
      }
    }
  }

  void startImageRotation() {
    rotationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentIndex.value = ((currentIndex.value + 1) % imageList.length).ceil();
    });
  }

  void nextImage() {
    currentIndex.value = (currentIndex.value + 1).ceil() % imageList.length;
  }

  void previousImage() {
    currentIndex.value = (currentIndex.value - 1).ceil() % imageList.length;
  }
}
