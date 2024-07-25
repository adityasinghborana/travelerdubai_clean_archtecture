import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerdubai/Cart/data_layer/model/request/update_cart.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/auth/presentation/sign_in_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/request/timeslot_request.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_dynamic.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_static_data.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_options_staticdata_response.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/usecase/touroption_dynamic_data.dart';

import '../../Cart/data_layer/repository/cart_repository.dart';
import '../../Cart/data_layer/service/cart_remote.dart';
import '../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../Components/ui_state.dart';
import '../../auth/usersdatalayer/repository/user_repository.dart';
import '../../auth/usersdatalayer/service/create_user_remote.dart';
import '../../auth/usersdatalayer/usecase/create_user_usecase.dart';
import '../timeslot_data_layer/models/response/timeslot_response.dart';
import '../touroption_data_layer/model/response/tour_option_dynamic_response.dart';
import '../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';

class TourOptionStaticDataController extends GetxController {
  final GetTimeSlotUseCase getTimeSlotUseCase;
  final GetTourOptionsStaticDataUseCase getOptionsStaticDataUseCase;
  final GetTourOptionsDynamicDataUseCase getOptionsDynamicDataUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final SigninController signinController = Get.put(
    SigninController(
      createuser: CreateUserUseCase(
        UserRepositoryImpl(
          createUserRemoteService(
            Dio(),
          ),
        ),
      ),
      getCartUseCase: GetCartUseCase(
        CartRepositoryImpl(
          CartRemoteService(Dio()),
        ),
      ),
    ),
  );
  int currOptionId = 0;
  late UpdateCartTourDetail value;

  String? selectedTimeSlot = '';
  var output1;
  var dynamicOptionsMap = <int, TourOptionDynamicResult>{};

  TourOptionStaticDataController(
      this.getOptionsStaticDataUseCase,
      this.getOptionsDynamicDataUseCase,
      this.getTimeSlotUseCase,
      this.updateCartUseCase);

  final Rx<TextEditingController> dateTextController =
      TextEditingController().obs;
  final RxInt timeSlotId = 0.obs; // need to check
  RxList<Widget> dynamicWidgets = <Widget>[].obs;
  final Rx<DateTime?> selectedDate = DateTime.now().obs;
  var pricing = ExtractedData().obs;
  var id = "".obs;

  var contractid = "".obs;
  var isvendor = false.obs;
  var vendoruid = "".obs;
  var starttime = "".obs;
  final Rx<String> optionName="".obs;

  // final RxList<Result> timeslots = <Result>[].obs;
  final RxList<List<Result>> timeslots = RxList<List<Result>>();

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
  RxInt optionId = 0.obs;
  RxInt transferId = 0.obs;

  Future<void> getOptionsStaticData() async {
    timeslots.value.clear();

    final TourOptionStaticData data = TourOptionStaticData(
        tourId: id.value,
        contractId: contractid.value,
        isVendor: isvendor.value);
    options.value = UiData(state: UiState.LOADING);

    await getOptionsStaticDataUseCase.execute(data).then((response) {
      options.value = UiData(
        state: UiState.SUCCESS,
        data: response.result?.touroption?.toList() ?? [],
      );

      // options.assignAll(response.result?.touroption?.toList() ?? []);
    }).catchError((error) {
      print(error);
      // Handle the error as needed
    }).whenComplete(() {
      getOptionsDynamicData();
    });
  }

  void getOptionsDynamicData() async {
    try {
      dynamicoptions.assignAll([]);

      final TourOptionDynamicRequest data = TourOptionDynamicRequest(
          tourId: int.tryParse(id.value) ?? 0,
          contractId: int.tryParse(contractid.value) ?? 0,
          travelDate: selectedDate.value.toString().substring(0, 10),
          noOfAdult: adultsSelectedValue.value,
          noOfChild: childrenSelectedValue.value,
          noOfInfant: infantsSelectedValue.value,
          isVendor: isvendor.value);

      final response =
          await getOptionsDynamicDataUseCase.execute(data).then((value) {
        //  updateOptionsFinalPrice();

        dynamicoptions.assignAll(value.apiResponseData?.result?.toList() ?? []);
        dataList.assignAll(value.apiResponseData?.result?.toList() ?? []);

        pricing.value = value.extractedData!;

        print(value);
      });

      // showOptionsDialog();
    } catch (error, stackTrace) {
      print(error);
      // Handle the error as needed
    }
  }

  void getTimeSlots(int singleOptionId) async {
    final getTimeslotData = TimeSlotRequest(
        tourId: int.tryParse(id.value)!,
        contractId: int.tryParse(contractid.value)!,
        travelDate: selectedDate.value.toString().substring(0, 10),
        tourOptionId: singleOptionId,
        transferId: transferId.value,
        isVendor: isvendor.value);

    try {
      final response = await getTimeSlotUseCase.execute(getTimeslotData);
      print(response.result[0].timeSlotId);
      //timeslots.value.data!.assignAll(response.result);
      if (response.result.isNotEmpty) {
        timeslots.add(response.result);
      } else {
        print("no time slots available");
      }


    } catch (e) {
      // Handle any potential errors here
      print(e);
    }
  }

  void Addtocart(UpdateCartTourDetail data) async {
    print (value.transferId);
    print("add to cart ${data.toJson()}");
    try {
      final value = await updateCartUseCase.execute(data).then((_) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? id = prefs.getString('userUID');
        signinController.getCart(id ?? "");
      });
      Get.snackbar("Added To Cart", "Your Tour has been added To Cart");
    } catch (e) {
      print(e);
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
    getOptionsStaticData();
    // getTimeSlots();
  }

  void changeSelectedTransfer(String? newValue) {
    if (newValue != null) {


      switch (newValue) {
        case "Without Transfers":
          transferId.value = 41865;
          if(Get.width>800){
            value.transferId=41865;
          }

          break;
        case "Sharing Transfers":
          transferId.value = 41843;
          if(Get.width>800){
            value.transferId=41843;
          }
          break;
        case "Private Transfers":
          transferId.value = 41844;
          break;
        default:
          print("Invalid transfer type");
      }

    }
  }

  void changeTimeSlotId(selectedValue) {
    timeSlotId.value = selectedValue;
    print(transferId.value);
    print(selectedValue);
  }
}
