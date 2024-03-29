import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';


import '../../tourdetails/tourdetail_data_layer/model/tour_model.dart';




class ExperienceController extends GetxController {
  final GetExperiencesUseCase experiencesUseCase;

  var tourTypes = [].obs;
  var cityTours = <Experiences>[].obs;
  var selectedTourType = ''.obs;
  List<Experiences> allCityTours = [];
  List<TourModel> alldata = [];
  ExperienceController(this.experiencesUseCase);
  @override
  void onInit() {
    fetchData();
    fetchcitytours();
    super.onInit();
  }


  void fetchcitytours() async {
    try {
      final response = await experiencesUseCase.execute();
      if (response.isNotEmpty) {
        List<Experiences> fetchedCityTours = response;

        cityTours.assignAll(fetchedCityTours);
        allCityTours = List.from(fetchedCityTours);

        if (fetchedCityTours.isNotEmpty &&
            fetchedCityTours[0].tourdetails!.isNotEmpty) {
          print(
              'First TourDetails id: ${fetchedCityTours[0].tourdetails?[0].id}');
        }
      } else {
        print('Request failed with status');
      }
    } catch (e) {
      // Handle errors
      print('Error fetching experiences: $e');
    }
  }

  void fetchData() async {
    try {
      dio.Response response =
          await dio.Dio().get('http://localhost:3000/tourtypes');
      if (response.statusCode == 200) {
        List<dynamic> fetchedTypes = response.data;
        tourTypes.assignAll(fetchedTypes);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void filterCityToursByType(String cityTourType) {
    selectedTourType.value = cityTourType;
    if (cityTourType.isEmpty) {
      // If no tour type is selected, show all city tours
      cityTours.assignAll(allCityTours);
    } else {
      // Filter city tours based on the selected tour type
      cityTours.assignAll(allCityTours
          .where((tour) => tour.cityTourType == cityTourType)
          .toList());
    }
  }

  void searchCityTours(String query) {
    if (query.isEmpty) {
      // If the search query is empty, show all city tours
      cityTours.assignAll(allCityTours);
    } else {
      // Filter city tours where the title contains the query (case insensitive)
      cityTours.assignAll(allCityTours
          .where((tour) => tour.tourName
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList());
    }
  }
}
