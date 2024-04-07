import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class EventController extends GetxController {
  var eventTypes = [].obs;
  var cityEvents = [].obs;
  var selectedTourType = ''.obs;
  List<dynamic> allCityTours = [];

  @override
  void onInit() {
    fetchData();
    fetchCityevents();
    super.onInit();
  }

  void fetchData() async {
    try {
      dio.Response response =
          await dio.Dio().get('$baseurl/eventtypes');
      if (response.statusCode == 200) {
        List<dynamic> fetchedTypes = response.data;
        eventTypes.assignAll(fetchedTypes);
        print(response.data);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void fetchCityevents() async {
    try {
      dio.Response response =
          await dio.Dio().get('http://localhost:3000/events');
      if (response.statusCode == 200) {
        List<dynamic> fetchedCityEvents = response.data;
        cityEvents.assignAll(fetchedCityEvents);
        allCityTours =
            List.from(fetchedCityEvents); // Store the full list for filtering
        print(response.data);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching city tours: $e');
    }
  }

  void filterCityeventsByType(String cityTourType) {
    selectedTourType.value = cityTourType;
    if (cityTourType.isEmpty) {
      // If no tour type is selected, show all city tours
      cityEvents.assignAll(allCityTours);
    } else {
      // Filter city tours based on the selected tour type
      cityEvents.assignAll(allCityTours
          .where((tour) => tour['cityeventType'] == cityTourType)
          .toList());
    }
  }

  void searchCityevents(String query) {
    if (query.isEmpty) {
      // If the search query is empty, show all city tours
      cityEvents.assignAll(allCityTours);
    } else {
      // Filter city tours where the title contains the query (case insensitive)
      cityEvents.assignAll(allCityTours
          .where((tour) => tour['tourName']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList());
    }
  }
}
