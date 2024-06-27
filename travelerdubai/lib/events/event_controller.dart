import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class EventController extends GetxController {
  RxList<dynamic>eventTypes = <dynamic>[].obs;
  var cityEvents = [].obs;
  var selectedTourType = ''.obs;
  List<dynamic> allCityTours = [];
  var selectedEventType = ''.obs;

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

  void filterCityeventsByType(String eventType) {
    selectedEventType.value = eventType;
    if (eventType.isEmpty) {
      // If no tour type is selected, show all city tours
      cityEvents.assignAll(allCityTours);
    } else {
      // Filter city tours based on the selected tour type
      cityEvents.assignAll(allCityTours
          .where((event) => event['eventType'] == eventType)
          .toList());
    }
  }




  void resetSelectedTourType() {
    selectedEventType.value = '';
    cityEvents.assignAll(allCityTours);
  }

    void searchCityTours(String query) {
      if (query.isEmpty) {
        cityEvents.assignAll(allCityTours);
      } else {
        cityEvents.assignAll(allCityTours.where((tour) =>
            tour['eventName'].toString().toLowerCase().contains(
                query.toLowerCase())).toList());
      }
    }
  }
