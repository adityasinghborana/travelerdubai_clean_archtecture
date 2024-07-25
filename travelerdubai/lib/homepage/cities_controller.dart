
import 'package:get/get.dart';
import 'package:travelerdubai/homepage/model/city.dart';

import 'package:travelerdubai/homepage/usecase/cities_usecase.dart';

class CityController extends GetxController {
  final GetCitiesUseCase getCitiesUseCase;
  RxList <City>cities = <City>[].obs;

  @override
  void onInit() {
    fetchCities();
    super.onInit();
  }

  void fetchCities() async {
    try {
      getCitiesUseCase.execute().then((value) {
        print(value);
        if (value != null) {
          List<City> fetchedCities = value;
          print(fetchedCities[0].CityName);
          cities.assignAll(fetchedCities);
        } else {
          print('Request failed with status}');
        }
      });
          }
          catch (e)
      {
        print('Error fetching cities: $e');
      }
    }

  CityController(this.getCitiesUseCase);
}