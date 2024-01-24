import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class CityController extends GetxController {
  var cities = [].obs;

  @override
  void onInit() {
    fetchCities();
    super.onInit();
  }

  void fetchCities() async {
    try {
      dio.Response response =
          await dio.Dio().get('http://localhost:3000/cities');
      if (response.statusCode == 200) {
        List<dynamic> fetchedCities = response.data;
        cities.assignAll(fetchedCities);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }
}
