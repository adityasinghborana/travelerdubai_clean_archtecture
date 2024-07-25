import 'dart:async';

import 'package:auraa_ui/aura_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';

import '../../experiences/Presentation/experiences_controller.dart';
import '../../experiences/Usecase/experience_usecase.dart';
import '../../experiences/remote/experiences_remote_service.dart';
import '../../experiences/repository/Experiences_repository.dart';

class HomeController extends GetxController {
  final GetHomePageDatUseCase homePageDataUseCase;
  Rx<HomepageData?> formData = Rx<HomepageData?>(null);

  RxList<CarouselItem> imageList = RxList<CarouselItem>(
   [
     CarouselItem(imageUrl:"$baseurl${images.slider1}" , onTap: (){}),
     CarouselItem(imageUrl:"$baseurl${images.slider2}" , onTap: (){}),
     CarouselItem(imageUrl:"$baseurl${images.slider3}" , onTap: (){}),
     CarouselItem(imageUrl:"$baseurl${images.slider4}" , onTap: (){}),
     CarouselItem(imageUrl:"$baseurl${images.slider5}" , onTap: (){}),
     CarouselItem(imageUrl:"$baseurl${images.slider6}" , onTap: (){}),
     CarouselItem(imageUrl:"$baseurl${images.slider7}" , onTap: (){}),


   ]
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

}
