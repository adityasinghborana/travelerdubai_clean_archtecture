import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/AboutPage/datalayer/model/response/Aboutus.dart';
import 'package:travelerdubai/AboutPage/datalayer/usecase/Aboutus_usecase.dart';

class AboutUsController extends GetxController {

  final AboutUsUseCase aboutUsUseCase;
  AboutUsController({required this.aboutUsUseCase});
  Rx<Aboutpagedata?> aboutData = Rx<Aboutpagedata?>(null);
  RxList<String> imageList = RxList<String>([]);
  var currentIndex = 0.obs;
  final dio = Dio();
  late Timer rotationTimer;

  @override
  void onInit() {
   getAboutusData();

    super.onInit();
  }

  @override
  void onClose() {
    rotationTimer.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }




  Future<void> getAboutusData() async{
    aboutUsUseCase.execute().then((value) {
aboutData.value = Aboutpagedata(id: value.id, title: value.title,subtitle: value.subtitle, imagepath: value.imagepath, imagepath2: value.imagepath2, imagepath3: value.imagepath3, heading1: value.heading1, text: value.text, detail1: value.detail1, heading2: value.heading2, subheading2: value.subheading2, detail2: value.detail2);
imageList.value=[value.imagepath,value.imagepath2,value.imagepath3];


    });
  }



  void moveToNextImage() {
    currentIndex.value = (currentIndex.value + 1) % imageList.length;
  }


}
