import 'package:get/get.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';

class TourlistController extends GetxController {
  final GetExperiencesUseCase experiencesUseCase;

  RxList<Experiences> tours = <Experiences>[].obs;

  TourlistController(this.experiencesUseCase);

  @override
  void onInit() {
    fetchcitytours();
    super.onInit();
  }

  void fetchcitytours() async {
    try {
      final response = await experiencesUseCase.execute();
      if (response.isNotEmpty) {
        List<Experiences> fetchedCityTours = response;
        tours.assignAll(fetchedCityTours);
        print(tours.length);
      } else {
        print('Request failed with status');
      }
    } catch (e) {
      // Handle errors
      print('Error fetching experiences: $e');
    }
  }
}