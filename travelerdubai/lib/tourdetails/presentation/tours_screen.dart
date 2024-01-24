import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/tourdetails/Usecase/usecase.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/remote/tour_remote.dart';
import 'package:travelerdubai/tourdetails/repository/tour_repository.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/imagechanger.dart';

class TourPage extends StatelessWidget {
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tour Page')),
      floatingActionButton: ElevatedButton(
        child: Text("Add to Cart"),
        onPressed: () => Get.toNamed("/checkout"),
      ),
      body: Obx(
            () {
          if (tourController.isLoading.isTrue) {
            return CircularProgressIndicator();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Tour Name: ${tourController.tour.value.tourName}'),

                Column(
                  children: [
                    ImageChangerWidget(tourController.tourImages),
                   // Text("$tourId"),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
