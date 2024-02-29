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
      () => Stack(
        children: [
          Image.network(
            controller.imageList[controller.currentIndex.value].imagePath ?? "",
            width: Get.width,
            height: Get.height * 0.5,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: Get.height * 0.25,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: const Color.fromRGBO(
                      0, 0, 0, 0.1), // Set your desired background color here
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: colorwhite),
                    onPressed: controller.previousImage,
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(
                      0, 0, 0, 0.1), // Set your desired background color here
                  child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: colorwhite),
                      onPressed: controller.nextImage),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
