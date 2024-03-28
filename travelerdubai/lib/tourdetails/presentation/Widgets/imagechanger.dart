import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/tourdetails/presentation/imagechangercontroller.dart';

import '../../tourdetail_data_layer/model/tour_model.dart';

class ImageChangerWidget extends StatelessWidget {
  final ImageChangerController controller = Get.put(ImageChangerController());
  final List<TourImageModel> tourImages;

  ImageChangerWidget(this.tourImages, {super.key}) {
    controller.updateImageList(tourImages);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(children: [
        Container(
          width: Get.width,
          height: Get.width * .40,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffd1d5ff),
                Color(0xfff3c5f1),
              ],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        Positioned(
          left: Get.width * .10,
          right: Get.width * .10,
          bottom: 8,
          child: Image.network(
            controller.imageList[controller.currentIndex.value].imagePath ?? "",
            width: Get.width * .80,
            height: Get.width * 0.26,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: Get.height * 0.25,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                // Set your desired background color here
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: colorwhite),
                  onPressed: controller.previousImage,
                ),
              ),
              Container(
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                // Set your desired background color here
                child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: colorwhite),
                    onPressed: controller.nextImage),
              )
            ],
          ),
        ),
        Positioned(
          top: Get.height * 0.05,
          left: Get.width * 0.10,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Text 1',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                'Text 2',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                'Text 3',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
