import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';

import '../../../../Components/custom_button.dart';
import '../../../../Components/date_picker.dart';
import '../../../../Components/dropdown_widget_mobile.dart';
import '../../../../Components/ui_state.dart';
import '../../../../core/widgets/Mobileheader.dart';
import '../../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../tour_options_controller.dart';

class FormsMobile extends StatelessWidget {
  FormsMobile({Key? key}) : super(key: key);

  // final TourController tourController = Get.put(TourController(
  //   GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  // ));
  final ScrollController scrollController = ScrollController();
  final ScrollController listController = ScrollController();
  final TourOptionStaticDataController static = Get.find();

  @override
  Widget build(BuildContext context) {
    TourController tourController = Get.put(
      TourController(
        GetCityTourUseCase(
          TourRepositoryImpl(
            TourRemoteService(
              Dio(),
            ),
          ),
        ),
      ),
    );
    static.dateTextController.value.text = DateTime.now()
        .add(
          // Add a duration representing the specified number of hours.
          Duration(hours: tourController.tour.value.cutOffhrs ?? 0),
        )
        .toString()
        .substring(0, 10);
    static.selectedDate.value = DateTime.now().add(
        // Add a duration representing the specified number of hours.
        Duration(hours: tourController.tour.value.cutOffhrs ?? 0));
    tourController.tourId = Get.parameters['tourId'] ?? '';
    tourController.fetchCityTour();
    static.id.value = tourController.tour.value.TourId.toString();
    static.contractid.value = tourController.tour.value.contractId.toString();
    static.getOptionsStaticData();

    return Scaffold(body: Obx(() {
      HashMap<String, int> transferOptionsMap = HashMap<String, int>();
      if (kDebugMode) {
        print('static.dynamic length is ${static.dynamicoptions.length}');
        print(
            'in the form section options state is ${static.options.value.state}');
      }

      if (static.dynamicoptions.isNotEmpty) {
        static.dynamicoptions.forEach((tourOptionsDynamicResult) {
          // Assuming tourOptionsDynamicResult.transferName and tourOptionsDynamicResult.transferId are not null
          static.addUniquePair(
            transferOptionsMap,
            tourOptionsDynamicResult.transferName!,
            tourOptionsDynamicResult.transferId!,
          );
        });
        static.selectedTransfer.value = static.dynamicoptions[0].transferName!;
      }
      if (kDebugMode) {
        print('transferOptionMap is$transferOptionsMap');
      }
      if (tourController.isLoading.isTrue) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MobileHeader(
                isBackButton: true,
                context: context,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  'Select Booking Date',
                  style: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Obx(
                  () => dateInputField(
                      static.dateTextController.value, Get.context!, () {
                    static.selectedDate.value =
                        DateTime.parse(static.dateTextController.value.text);

                    static.getOptionsDynamicData();
                    static.getTimeSlots(static.transferId.value);
                  }, MediaQuery.of(context).size.width),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Transfer Type',
                  style: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              TransferOptions(
                options: transferOptionsMap.keys.toList(),
                onOptionSelected: (value) {
                  static.changeSelectedTransfer(value);
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Select Travellers',
                  style: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Material(
                          elevation: 4.0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .28,
                            child: DropdownWidgetMobile(
                              label: 'Adults',
                              selectedValue: static.adultsSelectedValue.value,
                              onChanged: (value) {
                                static.adultsSelectedValue.value = value ?? 1;
                                static.getOptionsDynamicData();
                              },
                            ),
                          ),
                        )),
                    Obx(() => Material(
                          elevation: 4.0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .28,
                            child: DropdownWidgetMobile(
                              label: 'Children',
                              selectedValue: static.childrenSelectedValue.value,
                              onChanged: (value) {
                                static.childrenSelectedValue.value = value ?? 0;
                                static.getOptionsDynamicData();
                              },
                            ),
                          ),
                        )),
                    Obx(() => Material(
                          elevation: 4.0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .28,
                            child: DropdownWidgetMobile(
                              label: 'Infants',
                              selectedValue: static.infantsSelectedValue.value,
                              onChanged: (value) {
                                static.infantsSelectedValue.value = value ?? 0;
                                static.getOptionsDynamicData();
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Packages',
                  style: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Obx(() {
                var outputState = static.options.value;
                var tourOptionsDynamicList = static.dynamicoptions.toList();

                if (kDebugMode) {
                  print(
                      'tourOptionsDynamicList is${tourOptionsDynamicList.toString()}');
                }

                switch (outputState.state) {
                  case UiState.SUCCESS:
                    return SizedBox(
                      height: MediaQuery.of(context).size.width * .98,
                      child: ListView.builder(
                        controller: listController,
                        itemCount: outputState.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          //var option = outputState.data![index];
                          static.timeslots.clear();
                          static.getTimeSlots(
                              static.options.value.data?[index].tourOptionId ??
                                  0);

                          int? id = static.options.value.data?[index].tourId;
                          int tourIdIndex = tourOptionsDynamicList
                              .indexWhere((element) => element.tourId == id);
                          static.optionId.value =
                              outputState.data![index].tourOptionId!;
                          if (kDebugMode) {
                            print("optionId is ${static.optionId.value}");
                          }
                          static.transferId.value = tourOptionsDynamicList
                                  .isNotEmpty
                              ? tourOptionsDynamicList[tourIdIndex].transferId!
                              : 0;
                          if (kDebugMode) {
                            print('transferId is ${static.transferId.value}');
                          }
                          static.currOptionId = static.optionId.value;

                          // var output2 = static.timeslots.value;
                          // if (kDebugMode) {
                          //   print('output2 is${output2.toString()}');
                          // }

                          // Fetch the current option
                          //  var output1 = static.dataList.toList();
                          //  var output2 = static.timeslots.toList();
                          //  int? id = option.tourId;
                          // int tourIdIndex =output1.indexWhere((element) => element.tourId == id);
                          // int tourIdTimeSlotIndex = output2.indexWhere((element) => element.tourOptionId == id);
                          return tourOptionsDynamicList.isNotEmpty
                              ? Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  shadowColor: const Color(0x1C112211),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  //surfaceTintColor: Colors.grey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildFormHeader(static.options.value
                                              .data?[index].optionName ??
                                          ''),
                                      _buildPriceAndInfoRow(
                                          (tourOptionsDynamicList[
                                                          index]
                                                      .finalAmount ??
                                                  0) +
                                              (static.pricing.value
                                                      .addPriceAdult ??
                                                  0) +
                                              (static.pricing.value
                                                      .addPriceChildren ??
                                                  0) +
                                              (static.pricing.value
                                                      .additionalPriceInfant ??
                                                  0)),
                                      // Obx(() {
                                      //   if (static.timeslots.isNotEmpty) {
                                      //     var lst = static.timeslots.isNotEmpty
                                      //         ? static.timeslots
                                      //         : <String>['1hr', '2hr', '3hr', '4hr'];
                                      //     return _buildTimeRow(lst);
                                      //   } else {
                                      //     return const Text("No timeslot required "); //
                                      //   }
                                      // }),
                                      _buildInfoAndButtonRow(
                                          context,
                                          static.options.value.data?[index]
                                                  .tourOptionId ??
                                              0),
                                    ],
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    );
                  case UiState.EMPTY:
                    return const Text('Empty');
                  case UiState.LOADING:
                    return const CircularProgressIndicator();
                  case UiState.ERROR:
                    return const Text('Error');
                  default:
                    return const Text('Unknown State');
                }
              }),
            ],
          ),
        );
      }
    }));
  }

  Widget _buildFormHeader(String heading) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading, // Dynamic heading based on index
        style: const TextStyle(
          color: Color(0xFF828282),
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }

  Widget _buildPriceAndInfoRow(double price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Price: ',
            style: TextStyle(
              color: Color(0xFF828282),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          Text(
            'AED ${price.toString()}', // Replace with dynamic price value
            style: const TextStyle(
              color: Color(0xFF828282),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoAndButtonRow(BuildContext context, int tourOptionId) {
    final TourController tourController = Get.find();
    return Obx(
      () {
        var filteredTimeSlots = static.timeslots.value
            .firstWhere((ts) => ts[0].tourOptionId == tourOptionId,
                orElse: () => [])
            .toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'More Info  ',
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .55,
                child: ButtonView(
                  btnName: 'Time Slots',
                  bgColor: Colors.blue,
                  onButtonTap: () {
                    if (static.timeslots.isNotEmpty) {
                      Get.toNamed('/popup_card',
                          arguments: [filteredTimeSlots, tourOptionId]);
                      // for (int i = 0; i < static.timeslots.length; i++) {
                      //   for (int j = 0; j < static.timeslots.value[i].length; j++) {
                      //     print(static.timeslots.value[i][j].timeSlot);
                      //   }
                      // }
                    }
                    else if(tourController.tour.value.isSlot == true){
                        Get.toNamed('/popup_card',
                          arguments: [filteredTimeSlots, tourOptionId]);
                      // for (int i = 0; i < static.timeslots.length; i++) {
                      //   for (int j = 0; j < static.timeslots.value[i].length; j++) {
                      //     print(static.timeslots.value[i][j].timeSlot);
                      //   }
                      // }
                    }

                    else {
                      if (kDebugMode) {
                        Get.toNamed('/home',
                            preventDuplicates: true,
                            arguments: [filteredTimeSlots, tourOptionId]);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeRow(var lst) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'More info',
              style: TextStyle(
                color: Color(0xFF2659C3),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            Row(
              children: [
                const Text(
                  'Time: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 148,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      // Initial value, you can change it according to your requirement
                      onChanged: (String? newValue) {
                        // Handle dropdown value change
                      },
                      items: lst // Your dropdown options
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackArrowContainer(
      BuildContext context, TourController tourController) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffd1d5ff),
            Color(0xfff3c5f1),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Handle back arrow functionality
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${tourController.tour.value.tourName}",
              style: formHeaderTextStyleMobile,
            ),
          ),
        ],
      ),
    );
  }
}

class TransferOptions extends StatefulWidget {
  final List<String> options; // List of transfer options
  final void Function(String)?
      onOptionSelected; // Callback function when an option is selected

  const TransferOptions({
    Key? key,
    required this.options,
    this.onOptionSelected,
  }) : super(key: key);

  @override
  _TransferOptionsState createState() => _TransferOptionsState();
}

class _TransferOptionsState extends State<TransferOptions> {
  String? _selectedOption; // Variable to hold the selected option

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.options
            .map((option) => _buildOption(option))
            .toList(), // Generate options dynamically
      ),
    );
  }

  Widget _buildOption(String option) {
    return Container(
      width: 140,
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1C112211),
            blurRadius: 16,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Radio<String>(
            value: option,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
              if (widget.onOptionSelected != null) {
                widget.onOptionSelected!(value!);
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                option,
                style: const TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
