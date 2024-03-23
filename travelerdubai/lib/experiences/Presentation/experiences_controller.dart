import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/experiences/Usecase/experience_usecase.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';

import '../../tourdetails/tourdetail_data_layer/model/tour_model.dart';

class ExperienceController extends GetxController {
  final GetExperiencesUseCase experiencesUseCase;

  var tourTypes = [].obs;
  var cityTours = <Experiences>[].obs;
  var selectedTourType = ''.obs;
  List<Experiences> allCityTours = [];
  List<TourModel> allData = [];
  CacheManager cacheManager = DefaultCacheManager();
  CacheManager cacheManager1 = DefaultCacheManager();
  SharedPreferences prefs;
  ExperienceController(this.experiencesUseCase, this.prefs);
  bool isDataLoaded = false;

  @override
  Future<void> onInit() async {
    fetchData();
    loadCachedCityTours();
    //fetchCityTours();
    super.onInit();
  }

  //
  // void fetchCityTours() async {
  //   try {
  //     final response = await experiencesUseCase.execute();
  //     if (response.isNotEmpty) {
  //       List<Experiences> fetchedCityTours = response;
  //
  //       cityTours.assignAll(fetchedCityTours);
  //       allCityTours = List.from(fetchedCityTours);
  //
  //       if (fetchedCityTours.isNotEmpty &&
  //           fetchedCityTours[0].tourdetails!.isNotEmpty) {
  //         if (kDebugMode) {
  //           print(
  //               'First TourDetails id: ${fetchedCityTours[0].tourdetails?[0].id}');
  //         }
  //       }
  //     } else {
  //       if (kDebugMode) {
  //         print('Request failed with status');
  //       }
  //     }
  //   } catch (e) {
  //     // Handle errors
  //     if (kDebugMode) {
  //       print('Error fetching experiences: $e');
  //     }
  //   }
  // }

  Future<void> fetchCityTours() async {
    try {
      // Check if data is already loaded
      if (cityTours.isNotEmpty) {
        return;
      }

      // Fetch data using experiencesUseCase
      final response = await experiencesUseCase.execute();
      if (response.isNotEmpty) {
        cityTours.assignAll(response);
        // Store data in SharedPreferences
        await prefs.setStringList(
            'cityTours', response.map((e) => jsonEncode(e.toJson())).toList());
      } else {
        if (kDebugMode) {
          print('Request failed with status');
        }
      }
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error fetching experiences: $e');
      }
    }
  }

  Future<void> loadCachedCityTours() async {
    try {
      final cachedCityTours = prefs.getStringList('cityTours');
      if (cachedCityTours != null && cachedCityTours.isNotEmpty) {
        cityTours.assignAll(cachedCityTours
            .map((jsonString) => Experiences.fromJson(jsonDecode(jsonString)))
            .toList());
      } else {
        fetchCityTours();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading cached city tours: $e');
      }
    }
  }

  void fetchData() async {
    try {
      // dio.Response response =
      //     await dio.Dio().get('http://localhost:3000/tourtypes');

      File response =
          await cacheManager.getSingleFile('http://localhost:3000/tourtypes');
      String jsonData = await response.readAsString();
      List<dynamic> fetchedTypes = json.decode(jsonData);
      tourTypes.assignAll(fetchedTypes);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
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
