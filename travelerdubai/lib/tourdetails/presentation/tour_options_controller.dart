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
  var id = "65".obs;
  var dummyId = "65".obs;
  var dummy = 0;
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
  var selectedTransfer = 'Without Transfers'.obs;
  RxInt optionid = 0.obs;
  RxInt transferid = 0.obs;

  Future<void> getOptionsStaticData() async {
    if (kDebugMode) {
      print('in the getOptionsStatic data');
    }
    if (kDebugMode) {
      print('TourId is :${id.value}');
    }
    if (kDebugMode) {
      print('ContractId is :${contractid.value}');
    }
    final TourOptionStaticData data =
        TourOptionStaticData(tourId: id.value, contractId: contractid.value);
    options.value = UiData(state: UiState.LOADING);

    await getOptionsStaticDataUseCase.execute(data).then((response) {
      print('getOptionStatic Completed');
      options.value = UiData(
        state: UiState.SUCCESS,
        data: response.result?.touroption?.toList() ?? [],
      );
      if (kDebugMode) {
        print('options state in the function is: ${options.value.state}');
      }
      if (kDebugMode) {
        print(options.value.data?.length ?? 1111);
      }

      // options.assignAll(response.result?.touroption?.toList() ?? []);
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in the getOptionStatic\n');
      }
      if (kDebugMode) {
        print("Error: $error");
      }
      // Handle the error as needed
    }).whenComplete(() {
      getOptionsdynamicData();

      if (kDebugMode) {
        print('price total is ${finalPrice.value}');
      }
    });
  }

  void getOptionsdynamicData() async {
    if (kDebugMode) {
      print("started getOptionDynamic Data function");
    }
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

        if (kDebugMode) {
          print(dataList.length);
        }
        pricing.value = value.extractedData!;
        getTransfersOptions();
      });
      if (kDebugMode) {
        print(response);
      }
      // showOptionsDialog();
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print("Error in the getOptionsDynamic data: $error");
      }
      if (kDebugMode) {
        print("Stack Trace: $stackTrace");
      }
      // Handle the error as needed
    }
  }

  Future<void> gettimeSlots() async {
    if (kDebugMode) {
      print('in the get time slot');
    }
    if (kDebugMode) {
      print(
          'tourId:$id, contractId:${contractid.value}, travelData:${selectedDate.value}, tourOptionId:${optionid.value},transferId:${transferid.value}');
    }
    final gettimeslotdata = await TimeSlotRequest(
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

        if (timeslots.isNotEmpty) if (kDebugMode) {
          print(timeslots.value[0].timeSlot);
        }
      } else {
        if (kDebugMode) {
          print("No time Slot required");
        }
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
        child: const Text("Go Back"),
      ),
    );
  }

  void Addtocart(UpdateCartTourDetail data) async {
    try {
      final value = await updateCartUseCase.execute(data);
      Get.snackbar("Added To Cart", "Your Tour has been added To Cart");
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

  void addUniquePair(Map<String, int> map, String key, int value) {
    // Check if the key already exists in the map
    if (!map.containsKey(key)) {
      // If the key is not already in the map, add the key-value pair
      map[key] = value;
    }
  }

  void changePickedDate(selecteddate) {
    selectedDate.value = selecteddate;
    dateTextController.value.text =
        selectedDate.value.toString().substring(0, 10);
    getOptionsdynamicData();
    gettimeSlots();
  }

  void changeSelectedTransfer(String? newValue) {
    if (newValue != null) {
      selectedTransfer.value = newValue;
      print("$newValue transfer id ");

      switch (newValue) {
        case "Without Transfers":
          transferid.value = 41865;
          break;
        case "Sharing Transfers":
          transferid.value = 41843;
          break;
        case "Private Transfers":
          transferid.value = 41844;
          break;

          break;
        default:
          print("Invalid transfer type");
      }
      print(transferid.value);
    }
  }
}
