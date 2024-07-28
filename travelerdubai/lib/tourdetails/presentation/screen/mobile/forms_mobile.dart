import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/drawer.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/widgets/formheader.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/widgets/price_row.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/widgets/row.dart';
import 'package:travelerdubai/tourdetails/presentation/screen/mobile/widgets/transferoptions.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import '../../../../Components/date_picker.dart';
import '../../../../Components/dropdown_widget_mobile.dart';
import '../../../../Components/floatingaction_button.dart';
import '../../../../Components/ui_state.dart';
import '../../../../Components/Mobileheader.dart';
import '../../tour_options_controller.dart';

class FormsMobile extends StatelessWidget {

  FormsMobile({Key? key}) : super(key: key);
  final TourOptionStaticDataController static = Get.find();
  @override
  Widget build(BuildContext context) {

    TourController tourController = Get.find();
    final ScrollController listController = ScrollController();
    HashMap<String, int> transferOptionsMap = HashMap<String, int>();
    static.dateTextController.value.text = DateTime.now()
        .add(
          Duration(hours: tourController.tour.value.cutOffhrs ?? 0),
        )
        .toString()
        .substring(0, 10);
    static.selectedDate.value = DateTime.now().add(
        Duration(hours: tourController.tour.value.cutOffhrs ?? 0));
    tourController.tourId = Get.parameters['tourId'] ?? '';

    static.id.value = tourController.tour.value.TourId.toString();
    static.contractid.value = tourController.tour.value.contractId.toString();
    static.getOptionsStaticData();

    return Scaffold(
      floatingActionButton: FloatingCartButton(),
      drawer: drawer(),
      body: Obx(() {
        if (static.dynamicoptions.isNotEmpty) {
          static.dynamicoptions.forEach((tourOptionsDynamicResult) {
            // Assuming tourOptionsDynamicResult.transferName and tourOptionsDynamicResult.transferId are not null
            static.addUniquePair(
              transferOptionsMap,
              tourOptionsDynamicResult.transferName!,
              tourOptionsDynamicResult.transferId!,
            );
          });
          static.selectedTransfer.value =
              static.dynamicoptions[0].transferName!;
        }
        if (tourController.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final ScrollController scrollController = ScrollController();
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
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
                  padding: EdgeInsets.symmetric( vertical: 20.0 ,horizontal: 10),
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
                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
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
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1,color: colorlightgrey),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1C112211),
                                  blurRadius: 16,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * .28,
                            child: DropdownWidgetMobile(
                              label: 'Adults',
                              selectedValue: static.adultsSelectedValue.value,
                              onChanged: (value) {
                                static.adultsSelectedValue.value = value ?? 1;
                                static.getOptionsDynamicData();
                              },
                            ),
                          )),
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: colorlightgrey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1C112211),
                                  blurRadius: 16,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            width: MediaQuery.of(context).size.width * .28,
                            child: DropdownWidgetMobile(
                              label: 'Children',
                              selectedValue: static.childrenSelectedValue.value,
                              onChanged: (value) {
                                static.childrenSelectedValue.value = value ?? 0;
                                static.getOptionsDynamicData();
                              },
                            ),
                          )),
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: colorlightgrey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1C112211),
                                  blurRadius: 16,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            width: Get.width * .28,
                            child: DropdownWidgetMobile(
                              label: 'Infants',
                              selectedValue: static.infantsSelectedValue.value,
                              onChanged: (value) {
                                static.infantsSelectedValue.value = value ?? 0;
                                static.getOptionsDynamicData();
                              },
                            ),
                          )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
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
                  static.output1 = tourOptionsDynamicList;



                  switch (outputState.state) {
                    case UiState.SUCCESS:
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: Get.width * .98,
                          child: ListView.builder(
                            controller: listController,
                            itemCount: outputState.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              static.getTimeSlots(static
                                  .options.value.data?[index].tourOptionId ??
                                  0);
                              static.timeslots.clear();


                              int? id = static.options.value.data?[index].tourId;
                              int tourIdIndex = tourOptionsDynamicList
                                  .indexWhere((element) => element.tourId == id);
                              static.optionId.value =
                                  outputState.data![index].tourOptionId!;
                              if (kDebugMode) {
                                print("optionId is ${static.optionId.value}");
                              }
                              static.transferId.value =
                                  tourOptionsDynamicList.isNotEmpty
                                      ? tourOptionsDynamicList[tourIdIndex]
                                          .transferId!
                                      : 0;

                              static.currOptionId = static.optionId.value;

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
                                          FormHeader(
                                            heading:
                                                '${static.options.value.data?[index].optionName ?? ''}',
                                          ),
                                          PriceAndInfoRow(
                                            price: (tourOptionsDynamicList[index]
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
                                                    0),
                                          ),
                                          InfoAndButtonRow(
                                            widgets: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20.0, vertical: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      "Option Name:${static.options.value.data?[index].optionName}",
                                                      style: H1black.copyWith(
                                                          fontSize: 18)),
                                                  Text(
                                                    "Option Description: ${static.options.value.data?[index].optionDescription ?? 'No description available.'}",
                                                    style: H1black.copyWith(
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            tourOptionId: static.options.value
                                                    .data?[index].tourOptionId ??
                                                0,
                                            index: index,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                        ),
                      );
                    case UiState.EMPTY:
                      return const Text('Empty');
                    case UiState.LOADING:
                      return Center(child: const CircularProgressIndicator());
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
      }),
    );
  }
}
