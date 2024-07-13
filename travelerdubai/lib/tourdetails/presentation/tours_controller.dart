import 'package:get/get.dart';

import '../tourdetail_data_layer/Usecase/usecase.dart';
import '../tourdetail_data_layer/model/tour_model.dart';

class TourController extends GetxController {
  final GetCityTourUseCase getCityTourUseCase;

  late String tourId;

  var tourIdMobile = "".obs;
  var tourContractIdMobile = "".obs;
  var tour = TourModel().obs;
  var tourImages = <TourImageModel>[].obs;
  var isLoading = true.obs;
  final Rx<DateTime?> selectedDate = DateTime.now().obs;
  final tourRandomId = Rx<String>('initialValue');

  TourController(this.getCityTourUseCase);

  void setTourRandomId(String newId) {
    tourRandomId.value = newId;
  }

  @override
  void onInit() {
    super.onInit();
    tourId = Get.parameters['tourId'] ?? '';
    //tourId = Get.arguments as String;
    fetchCityTour();
  }

  void fetchCityTour() async {
    try {
      isLoading.value = true;
      tour.value = await getCityTourUseCase.execute(tourId);
      tourImages.assignAll(tour.value.tourImages ?? []);

      isLoading.value = false;
    } catch (e) {
      print('Error fetching Tour details: $e');
      isLoading.value = false;
    }
  }
}
