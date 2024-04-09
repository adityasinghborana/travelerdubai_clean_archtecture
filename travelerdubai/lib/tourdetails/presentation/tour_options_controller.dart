import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/update_cart.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/request/timeslot_request.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_dynamic.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_static_data.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_options_staticdata_response.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/usecase/touroption_dynamic_data.dart';

import '../../Components/ui_state.dart';
import '../timeslot_data_layer/models/response/timeslot_response.dart';
import '../touroption_data_layer/model/response/tour_option_dynamic_response.dart';
import '../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import 'Widgets/tour_option_pricing.dart';

class TourOptionStaticDataController extends GetxController {
  final GetTimeSlotUseCase getTimeSlotUseCase;
  final GetTourOptionsStaticDataUseCase getOptionsStaticDataUseCase;
  final GetTourOptionsDynamicDataUseCase getOptionsDynamicDataUseCase;
  final UpdateCartUseCase updateCartUseCase;
  TourOptionStaticDataController(
      this.getOptionsStaticDataUseCase,
      this.getOptionsDynamicDataUseCase,
      this.getTimeSlotUseCase,
      this.updateCartUseCase);
  RxString selectedTimeSlotId = RxString("0");

  RxString mobileTourId = "".obs;
  RxString mobilecontractId = "".obs;

  final Rx<TextEditingController> dateTextController =
      TextEditingController().obs;
  final RxInt timeSlotId = 0.obs; // need to check
  RxList<Widget> dynamicWidgets = <Widget>[].obs;
  final Rx<DateTime?> selectedDate = DateTime.now().obs;
  var pricing = ExtractedData().obs;
  var id = "".obs;
  var contractid = "".obs;
  final RxList<Result> timeslots = <Result>[].obs;

  //final RxList<TourOption> options = <TourOption>[].obs;
  final Rx<UiData<List<TourOption>>> options = Rx(UiData<List<TourOption>>(
    state: UiState.LOADING,
    data: <TourOption>[],
  ));
  final RxList<TourOptionDynamicResult> dynamicoptions =
      <TourOptionDynamicResult>[].obs;

  final RxList<TourOptionDynamicResult> dataList =
      <TourOptionDynamicResult>[].obs;

  RxInt adultsSelectedValue = 1.obs;
  RxInt childrenSelectedValue = 0.obs;
  RxInt infantsSelectedValue = 0.obs;
  RxDouble finalPrice = 0.0.obs;
  var selectedTransfer = 'Without transfer'.obs;

  void changeSelectedTransfer(String? newValue) {
    if (newValue != null) {
      selectedTransfer.value = newValue;
    }
  }

  RxInt optionid = 0.obs;
  RxInt transferid = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //getOptionsStaticDataMObile();
    //getOptionsStaticData();
  }

  void getOptionsStaticData() {
    final TourOptionStaticData data =
        TourOptionStaticData(tourId: id.value, contractId: contractid.value);
    options.value = UiData(state: UiState.LOADING);

    getOptionsStaticDataUseCase.execute(data).then((response) {
      print('getOptionStatic Completed');
      options.value = UiData(
        state: UiState.SUCCESS,
        data: response.result?.touroption?.toList() ?? [],
      );
      print(options.value.data?.length??1111);

     // options.assignAll(response.result?.touroption?.toList() ?? []);
    }).catchError((error) {
      print('Error in the getOptionStatic\n');
      print("Error: $error");
      // Handle the error as needed
    }).whenComplete(() {
      getOptionsdynamicData();

      print('price' + finalPrice.value.toString());
    });
  }

  void getOptionsdynamicData() async {
    print("started");
    try {
      dynamicoptions.assignAll([]);

      final TourOptionDynamicRequest data = TourOptionDynamicRequest(
        tourId: int.tryParse(id.value) ?? 0,
        contractId: int.tryParse(contractid.value) ?? 0,
        travelDate: selectedDate.value.toString().substring(0, 10),
        noOfAdult: adultsSelectedValue.value,
        noOfChild: childrenSelectedValue.value,
        noOfInfant: infantsSelectedValue.value,
      );
      if (kDebugMode) {
        print(data.toJson());
      }

      final response =
          await getOptionsDynamicDataUseCase.execute(data).then((value) {
        //  updateOptionsFinalPrice();

        dynamicoptions.assignAll(value.apiResponseData?.result?.toList() ?? []);
        dataList.assignAll(value.apiResponseData?.result?.toList() ?? []);

        print(dataList.value.length);
        pricing.value = value.extractedData!;
        getTransfersOptions();
      });
      print(response);
      // showOptionsDialog();
    } catch (error, stackTrace) {
      print("Error: $error");
      print("Stack Trace: $stackTrace");
      // Handle the error as needed
    }
  }

  void gettimeSlots() {
    final gettimeslotdata = TimeSlotRequest(
        tourId: int.tryParse(id.value)!,
        contractId: int.tryParse(contractid.value)!,
        travelDate: selectedDate.value.toString().substring(0, 10),
        tourOptionId: optionid.value,
        transferId: transferid.value);
    getTimeSlotUseCase
        .execute(gettimeslotdata)
        .then((TimeSlotResponse response) {
      if (response.result != null) {
        timeslots.assignAll(response.result);
        dynamicWidgets.assignAll(
          response.result.map((item) {
            return Obx(() => RadioListTile<String>(
                  title: Text(item.timeSlot),
                  value: item.timeSlotId,
                  groupValue: selectedTimeSlotId.value,
                  onChanged: (String? value) {
                    // Handle the selection, update the selectedTimeSlotId
                    selectedTimeSlotId.value = value ?? "0";
                    timeSlotId.value = int.parse(value!);
                    print("Selected Time Slot ID: ${selectedTimeSlotId.value}");
                    print("Selected Time Slot IsssD: ${item.timeSlotId}");
                    print("Selected Time Slot IsssD: ${timeSlotId.value}");
                  },
                  activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.trailing,
                  tileColor: selectedTimeSlotId.value == item.timeSlotId
                      ? Colors.blue
                      : null,
                  selected: selectedTimeSlotId.value == item.timeSlotId,
                ));
          }).toList(),
        );

        if (timeslots.isNotEmpty) print(timeslots.value[0].timeSlot);
      } else {
        print("No time Slot required");
      }
    });
  }

  void showOptionsDialog() {
    Get.defaultDialog(
      title: "Options",
      content: SizedBox(
        height: Get.height * 0.80,
        width: Get.width * 0.80,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.75,
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
      ),
    );
  }

  void Addtocart(UpdateCartTourDetail data) async {
    try {
      final value = await updateCartUseCase.execute(data);
      if (value != null) {
        Get.snackbar("Added To Cart", "Your Tour has been added To Cart");
      }
    } catch (e) {
      if (kDebugMode) {
        print(data);
      }
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getTransfersOptions() {
    if (kDebugMode) {
      print(dataList.length);
    }
  }


  // void getOptionsStaticDataMObile() {
  //   final TourOptionStaticData data =
  //   TourOptionStaticData(tourId: "111", contractId: '300');
  //   options.value = UiData(state: UiState.LOADING);
  //
  //   getOptionsStaticDataUseCase.execute(data).then((response) {
  //     print('getOptionStatic Completed');
  //     options.value = UiData(
  //       state: UiState.SUCCESS,
  //       data: response.result?.touroption?.toList() ?? [],
  //     );
  //
  //     //options.assignAll(response.result?.touroption?.toList() ?? []);
  //   }).catchError((error) {
  //     print('Error in the getOptionStaticdatamobile\n');
  //     print("Error: $error getOptionStaticdatamobile");
  //     // Handle the error as needed
  //   }).whenComplete(() {
  //     getOptionsdynamicData();
  //
  //     print('' + finalPrice.value.toString());
  //   });
  // }

}



