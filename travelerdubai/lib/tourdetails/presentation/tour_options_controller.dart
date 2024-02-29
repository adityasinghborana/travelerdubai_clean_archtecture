import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_dynamic.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_static_data.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_options_staticdata_response.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/usecase/touroption_dynamic_data.dart';

import '../touroption_data_layer/model/response/tour_option_dynamic_response.dart';
import '../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import 'Widgets/tour_option_pricing.dart';

class TouroptionstaticdataController extends GetxController {
  final GetTimeSlotUseCase getTimeSlotUseCase;
  final Rx<DateTime?> selectedDate = DateTime.now().obs;
  final GetTourOptionsStaticDataUseCase getOptionsStaticDataUseCase;
  final GetTourOptionsDynamicDataUseCase getOptionsDynamicDataUseCase;
  var Loading = true.obs;
  //var Loadingprice = true.obs;
  //var result = TourOptionsResult().obs;
  //var resultdynamic = TourOptionDynamicResult().obs;
  var pricing = ExtractedData().obs;
  var id = "".obs;
  var contractid = "".obs;
  final RxList<TourOption> options = <TourOption>[].obs;
  final RxList<TourOptionDynamicResult> dynamicoptions =
      <TourOptionDynamicResult>[].obs;

  RxInt adultsSelectedValue = 0.obs;
  RxInt childrenSelectedValue = 0.obs;
  RxInt infantsSelectedValue = 0.obs;

  TouroptionstaticdataController(
      this.getOptionsStaticDataUseCase, this.getOptionsDynamicDataUseCase , this.getTimeSlotUseCase);

  @override
  void onInit() {
    super.onInit();
  }

  void getOptionsStaticData() {
    final TourOptionStaticData data =
        TourOptionStaticData(tourId: id.value, contractId: contractid.value);

    getOptionsStaticDataUseCase.execute( data).then((response) {
      options.assignAll(response.result?.touroption?.toList() ?? []);
    }).catchError((error) {
      print("Error: $error");
      // Handle the error as needed
    }).whenComplete(() => Loading.value = false);
    ;
  }

  void getOptionsdynamicData() {

    final TourOptionDynamicRequest data = TourOptionDynamicRequest(
        tourId: int.tryParse(id.value) ?? 0 ,
        contractId: int.tryParse(contractid.value) ?? 0,
        travelDate: selectedDate.value.toString(),
        noOfAdult: adultsSelectedValue.value,
        noOfChild: childrenSelectedValue.value,
        noOfInfant: infantsSelectedValue.value);

    getOptionsDynamicDataUseCase.execute( data).then((response) {
      dynamicoptions.assignAll(response.apiResponseData?.result?.toList() ?? []);
      pricing.value = response.extractedData!;

    }).catchError((error) {
      print("Error: $error");
      // Handle the error as needed
    }).whenComplete(
      () {


        Get.defaultDialog(
        title: "Options",
        content: Container(
          height: Get.height*.80,
          width: Get.width*.80,
          child: Column(
            children: [

              Container(
             height: Get.height*.75,
                child: Optionpricing(),
              ),
            ],
          ),
        ),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: Text("Go Back"),
        ),);
      }

    );

  }
}
