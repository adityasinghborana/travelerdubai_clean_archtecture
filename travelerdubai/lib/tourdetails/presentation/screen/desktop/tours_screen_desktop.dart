import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/Components/date_picker.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/core/widgets/header.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_detail.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/service/timslot_remote.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';

import '../../../../core/widgets/footer.dart';
import '../../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../../Widgets/MainDetail.dart';
import '../../Widgets/dropdown_widget.dart';
import '../../Widgets/tranfertype_dropdown.dart';

class TourPageDesktop extends StatelessWidget {
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));
  final TourOptionStaticDataController static = Get.put(
    TourOptionStaticDataController(
        GetTourOptionsStaticDataUseCase(
            TourOptionsRepositoryImpl(TourOptionRemoteService(Dio()))),
        GetTourOptionsDynamicDataUseCase(
          TourOptionsRepositoryImpl(
            TourOptionRemoteService(Dio()),
          ),
        ),
        GetTimeSlotUseCase(
          TimeSlotRepositoryImpl(
            TimeSlotRemoteService(Dio()),
          ),
        ),
        UpdateCartUseCase(
          CartRepositoryImpl(
            CartRemoteService(Dio()),
          ),
        )),
  );

  TourPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    //final double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text("Add to Cart"),
        onPressed: () => Get.toNamed("/checkout"),
      ),
      body: Obx(
        () {
          if (tourController.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else {
            static.id.value = tourController.tour.value.TourId.toString();
            static.contractid.value =
                tourController.tour.value.contractId.toString();
            static.dateTextController.value.text = DateTime.now()
                .add(
                    // Add a duration representing the specified number of hours.
                    Duration(hours: tourController.tour?.value?.cutOffhrs ?? 0))
                .toString()
                .substring(0, 10);
            static.selectedDate.value = DateTime.now().add(
                // Add a duration representing the specified number of hours.
                Duration(hours: tourController.tour?.value?.cutOffhrs ?? 0));
            static.getOptionsStaticData();

            var tourImages = tourController.tourImages;
            List<String> imageUrls =
                tourImages.map((imageModel) => imageModel.imagePath!).toList();

            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(gradient: backgroundgradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        //fixed the header issue
                        Header(),
                        MUICarousel(
                          images: imageUrls,
                          maxWidth: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${tourController.tour.value.tourName}",
                                style: getH2TextStyle(context),
                              ),
                            ],
                          ),
                        ),
                        formSection(),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: MainDetails(
                              textStyle: detailBoxTextStyle,
                            ),
                          ),
                          Flexible(flex: 1, child: Container())
                        ],
                      ),
                    ),
                    buildFooter()
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget formSection() {
    return Card(
      elevation: 25.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(50.0),
          color: colorwhite,
          width: Get.width * 0.9,
          height: Get.height * .6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("No Of Person"),
                  DropdownTransferWidget(
                      label: 'type',
                      selectedValue: static.selectedTransfer.value,
                      onChanged: (value) => static.changeSelectedTransfer),
                  Obx(() => DropdownWidget(
                      label: 'Adults',
                      selectedValue: static.adultsSelectedValue.value,
                      onChanged: (value) {
                        static.adultsSelectedValue.value = value ?? 1;
                        static.getOptionsdynamicData();
                      })),
                  Obx(() => DropdownWidget(
                      label: 'Children',
                      selectedValue: static.childrenSelectedValue.value,
                      onChanged: (value) {
                        static.childrenSelectedValue.value = value ?? 0;
                        static.getOptionsdynamicData();
                      })),
                  Obx(() => DropdownWidget(
                      label: 'Infants',
                      selectedValue: static.infantsSelectedValue.value,
                      onChanged: (value) {
                        static.infantsSelectedValue.value = value ?? 0;
                        static.getOptionsdynamicData();
                      })),
                  dateInputField(static.dateTextController.value, Get.context!,
                      () {
                    static.selectedDate.value =
                        DateTime.parse(static.dateTextController.value.text);
                    static.getOptionsdynamicData();
                    static.gettimeSlots();
                  }),
                ],
              ),
              const Divider(
                height: 1,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tour Options "),
                    Text("Price"),
                    Text("TimeSlots"),
                    SizedBox(),
                  ]),
              options(),
            ],
          ),
        ),
      ),
    );
  }
}
