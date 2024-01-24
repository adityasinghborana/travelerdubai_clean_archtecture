

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:travelerdubai/tourdetails/Usecase/usecase.dart';
import 'package:travelerdubai/tourdetails/model/tour_model.dart';

class TourController extends GetxController {
  final GetCityTourUseCase getCityTourUseCase;

  late String tourId;
  var tour = TourModel().obs;
  var tourImages = <TourImageModel>[].obs;
  var isLoading = true.obs;

  TourController(this.getCityTourUseCase);



  @override
  void onInit() {
    tourId = Get.arguments as String;
    fetchCityTour();
    super.onInit();
  }

  void fetchCityTour() async {


    try {
      isLoading.value = true;
      tour.value = await getCityTourUseCase.execute(tourId);
      tourImages.assignAll(tour.value.tourImages ?? []);
      isLoading.value = false;


    } catch (e) {
      print('Error fetching city tour: $e');
      isLoading.value = false;
    }
  }
}
