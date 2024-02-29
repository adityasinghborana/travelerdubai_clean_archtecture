import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';

import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';

class HomeController extends GetxController {
  final GetHomePageDatUseCase homePageDataUseCase;
  Rx<HomepageData?> formData = Rx<HomepageData?>(null);

  RxList<String> imageList = RxList<String>([]);
  var currentIndex = 0.obs;
  late Timer rotationTimer;
  HomeController(this.homePageDataUseCase);
  @override
  void onInit() {
    fetchdatafrombackend();
    // startImageRotation();
    //fetchCityT();
    //fetchImagesFromAPI();
    super.onInit();
  }

  void fetchdatafrombackend() async {
    try {
      final response = await homePageDataUseCase.execute();
      if (response !=null) {
        HomepageData fetchedCityTour =
            response; // Assuming response is a list, take the first element
        formData.value = fetchedCityTour;
        print(formData.value!.id);
      } else {
        print('Request failed with status');
      }
    } catch (e) {
      // Handle errors
      print('Error fetching experiences: $e');
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
