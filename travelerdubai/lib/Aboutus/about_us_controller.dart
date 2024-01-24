import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Aboutus/model/Aboutus.dart';

class AboutUsController extends GetxController {
  Rx<Aboutpagedata?> aboutData = Rx<Aboutpagedata?>(null);
  RxList<String> imageList = RxList<String>([]);
  var currentIndex = 0.obs;
  final dio = Dio();
  late Timer rotationTimer;

  @override
  void onInit() {
    fetchDataFrombackend();
    //startImageRotation();
    super.onInit();
  }

  @override
  void onClose() {
    rotationTimer.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }

  Future<void> fetchDataFrombackend() async {
    try {
      final response = await dio.get('http://localhost:3000/aboutus');
      var data = response.data;
      print(data);

      if (data is List && data.isNotEmpty) {
        var firstObject = data[0];
        aboutData.value = Aboutpagedata(
          id: firstObject['id'] ?? 5,
          title: "${firstObject['title']}" ?? 'hello',
          heading1: "${firstObject['heading1']}" ?? 'hello',
          subheading1: "${firstObject['subheading1']}" ?? 'hello',
          detail1: "${firstObject['detail1']}" ?? 'hello',
          heading2: "${firstObject['heading2']}" ?? 'hello',
          subheading2: "${firstObject['subheading2']}" ?? 'hello',
          detail2: "${firstObject['detail2']}" ?? 'hello',
          imagepath: "${firstObject['imagepath']}" ?? 'cant be loaded',
          imagepath2: "${firstObject['imagepath2']}" ?? 'cant be loaded',
          imagepath3: "${firstObject['imagepath3']}" ?? 'cant be loaded',
        );
        print(aboutData);
      } else {
        print("no data found or data is not in the expected format");
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void startImageRotation() {
    rotationTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      currentIndex.value = (currentIndex.value + 1) % imageList.length;
    });
  }

  void moveToNextImage() {
    currentIndex.value = (currentIndex.value + 1) % imageList.length;
  }
}
