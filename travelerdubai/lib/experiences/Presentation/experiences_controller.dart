import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';

class ExperienceController extends GetxController {
  String? city = Get.parameters['cityName'];
  final GetExperiencesUseCase experiencesUseCase;

  var tourTypes = [].obs;
  var cityTours = <Experiences>[].obs;
  var selectedTourType = ''.obs;
  List<Experiences> allCityTours = [];
  RxList<Experiences> alldata = <Experiences>[].obs;
  final TextEditingController searchController = TextEditingController();
  var searchQuery = ''.obs;
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
        List<Experiences> visibleCityTours = response.where((element) => element.isvisible == true).toList();
        cityTours.assignAll(visibleCityTours);
        allCityTours = List.from(visibleCityTours);

        if (visibleCityTours.isNotEmpty && visibleCityTours[0].tourdetails!= null) {
          print('First TourDetails id: ${visibleCityTours[0].tourdetails?.id}');
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
      dio.Response response = await dio.Dio().get('$baseurl/tourtypes');
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
      cityTours.assignAll(allCityTours);
    } else {
      cityTours.assignAll(allCityTours.where((tour) => tour.cityTourType == cityTourType).toList());
    }
  }

  void resetSelectedTourType() {
    selectedTourType.value = '';
    cityTours.assignAll(allCityTours);
  }

  void searchCityTours() {
    if (searchQuery.isEmpty) {
      cityTours.assignAll(allCityTours);
    } else {
      cityTours.assignAll(allCityTours.where((tour) => tour.tourName.toString().toLowerCase().contains(searchQuery.toLowerCase())).toList());
    }
  }

}
