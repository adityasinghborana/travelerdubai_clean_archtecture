import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:travelerdubai/homepage/presentaion/tours_controller.dart';

import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';

class HomeController extends GetxController {
  final GetHomePageDatUseCase homePageDataUseCase;
  //final TourlistController tourController = TourlistController();
  Rx<HomepageData?> formData = Rx<HomepageData?>(null);

  RxList<String> imageList = RxList<String>([]);
  var currentIndex = 0.obs;
  late Timer rotationTimer;
  HomeController(this.homePageDataUseCase);
  @override
  void onInit() {
    // fetchDataFrombackend();
    // startImageRotation();
    fetchCityT();
    fetchImagesFromAPI();
    super.onInit();
  }

  void fetchCityT() async {
    try {
      final response = await homePageDataUseCase.execute();
      if (response.isNotEmpty) {
        HomepageData fetchedCityTour =
            response[0]; // Assuming response is a list, take the first element
        formData.value = fetchedCityTour;
        print(formData);
      } else {
        print('Request failed with status');
      }
    } catch (e) {
      // Handle errors
      print('Error fetching experiences: $e');
    }
  }

  // Future<void> fetchDataFrombackend() async {
  //   dio.Response response =
  //       await dio.Dio().get('http://localhost:3000/homepage');
  //   var data = response.data;

  //   if (data is List && data.isNotEmpty) {
  //     var firstObject = data[0]; // Accessing the first object in the array

  //     formData.value = Homepagedata(
  //       title: "${firstObject['title']}" ?? '',
  //       subtitle: "${firstObject['subtitle']}" ?? '',
  //       backgroundImage: "${firstObject['backgroundimage']}" ?? '',
  //       heading: "${firstObject['heading1']}" ?? 'hello',
  //       detail: "${firstObject['detail']}" ?? 'hello',
  //       heading2: "${firstObject['heading2']}" ?? 'hello',
  //       heading3: "${firstObject['heading3']}" ?? 'hello',
  //       heading4: "${firstObject['heading4']}" ?? 'hello',
  //       counter1: firstObject['counter1'] as int? ?? 5,
  //       counter2: firstObject['counter2'] as int? ?? 4,
  //       counter3: firstObject['counter3'] as int? ?? 4,
  //       counter4: firstObject['counter4'] as int? ?? 66,
  //       label1: "${firstObject['label1']}" ?? 'hello',
  //       label2: "${firstObject['label2']}" ?? 'hello',
  //       label3: "${firstObject['label3']}" ?? 'hello',
  //       label4: "${firstObject['label4']}" ?? 'hello',
  //     );

  // if (data['backgroundimage'] is List) {
  //   imageList.value = List<String>.from(data['backgroundimage']);
  // } else {
  //   print("no images found");
  // }
  //   } else {
  //     print("no data found");
  //   }
  //   //print(imageList.value);
  // }

  Future<void> fetchImagesFromAPI() async {
    dio.Response response =
        await dio.Dio().get('http://localhost:3000/bgimage');
    var data = response.data;

    if (data is List && data.isNotEmpty) {
      imageList.value =
          data.map((imageObj) => imageObj['imageUrl'] as String).toList();

      // Usage example: Printing the extracted image URLs
      // imageUrls.forEach((imageUrl) => print(imageUrl));
      print(imageList.value);
      // You can perform other actions with 'imageUrls' here, such as displaying images
      // or storing them in your application state for later use.
    } else {
      // Handle case when the response array is empty or not in the expected format
      print('Received data is empty or not in the expected format.');
    }
    print(imageList);
  }

  // if (data['backgroundimage'] is List) {
  //   imageList.value = List<String>.from(data['backgroundimage']);
  // } else {
  //   print("no images found");
  // }

  void startImageRotation() {
    rotationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentIndex.value = ((currentIndex.value + 1) % imageList.length).ceil();
    });
  }

  void nextImage() {
    currentIndex.value = (currentIndex.value + 1).ceil() % imageList.length;
  }

  void previousImage() {
    currentIndex.value = (currentIndex.value - 1).ceil() % imageList.length;
  }
}
