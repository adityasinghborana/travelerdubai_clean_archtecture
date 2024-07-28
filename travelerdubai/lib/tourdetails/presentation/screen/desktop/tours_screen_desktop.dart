import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:auraa_ui/aura_ui.dart';
import 'package:travelerdubai/Cart/data_layer/repository/cart_repository.dart';
import 'package:travelerdubai/Cart/data_layer/service/cart_remote.dart';
import 'package:travelerdubai/Cart/data_layer/usecase/update_cart.dart';
import 'package:travelerdubai/Components/date_picker.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/Components/header.dart';
import 'package:travelerdubai/homepage/presentaion/widgets/cities.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/tour_option_detail.dart';
import 'package:travelerdubai/tourdetails/presentation/tour_options_controller.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/service/timslot_remote.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../../../core/controller/headercontroller.dart';
import '../../../../Components/footer.dart';

import '../../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../../Widgets/MainDetail.dart';
import '../../Widgets/dropdown_widget.dart';
import '../../Widgets/tranfertype_dropdown.dart';

class TourPageDesktop extends StatelessWidget {

  final TourOptionStaticDataController static = Get.put(
    TourOptionStaticDataController(
      GetTourOptionsStaticDataUseCase(
        TourOptionsRepositoryImpl(TourOptionRemoteService(Dio())),
      ),
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
      ),
    ),
  );

  TourPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
  //  final ScrollController ss = ScrollController();
    final HeaderController controller = Get.find();

    final TourController tourController = Get.find();

    // Update dateTextController and selectedDate
    _updateDateFields(tourController);

    // Log cartId for debugging
    if (kDebugMode) {
      print("${controller.cartId.value} hello tour detail");
    }

    // React to changes in tourController.isLoading
    ever(tourController.isLoading, (isLoading) {
      if (!isLoading) {
        _updateStaticDataFields(tourController);
        static.getOptionsStaticData();
      }
    });

    return Scaffold(
      body: Obx(() {

        if (tourController.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(gradient: backgroundgradient),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildHeader(context, tourController),
                  _buildCarousel(context, tourController),
                  _buildTourName(context, tourController),

                  formSection(),
                  SizedBox(height: 50),
                  _buildMainDetails(context, tourController),
                  SizedBox(height: 50),
                  _buildCityList(),
                  buildFooter(),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  void _updateDateFields(TourController tourController) {
    final cutoffHours = tourController.tour.value.cutOffhrs ?? 0;
    final cutoffDate = DateTime.now().add(Duration(hours: cutoffHours));
    static.dateTextController.value.text =
        cutoffDate.toString().substring(0, 10);
    static.selectedDate.value = cutoffDate;
  }

  void _updateStaticDataFields(TourController tourController) {
    final tour = tourController.tour.value;
    static.id.value = tour.TourId.toString();
    static.contractid.value = tour.contractId.toString();
    static.vendoruid.value = tour.vendorUid ?? '';
    static.starttime.value = tour.startTime ?? '';
    static.isvendor.value = tour.isVendorTour ?? false;
  }

  Widget _buildHeader(BuildContext context, TourController tourController) {
    final PageController pageController = PageController();
    return Column(
      children: [
        Header(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.035),
          child: AuraUICarousel(
            duration: Duration(seconds: 3),
            images: _getTourImageUrls(tourController),
            maxWidth: 1340,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            showButtons: true,
            pageController: pageController,
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context, TourController tourController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
              "${tourController.tour.value.tourName}",
              style: getH2TextStyle(context).copyWith(color: Colors.black),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTourName(BuildContext context, TourController tourController) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildIconColumns(),
      ),
    );
  }

  List<Widget> _buildIconColumns() {
    return [
      _buildIconColumn(
          Icons.security_rounded, 'Secure Checkout', 'Fast and Secure Payment'),
      _buildIconColumn(Icons.fact_check_outlined, 'Instant confirmation',
          'Refund Guarantee Option'),
      _buildIconColumn(FontAwesomeIcons.ticket, 'Official Ticket Seller',
          'Used by 3m+ people'),
      _buildIconColumn(Icons.co_present, '24/7 customer service',
          'Reliable after sales support'),
    ];
  }

  Widget _buildIconColumn(IconData icon, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorgreen),
          Text(title, style: iconText),
          Text(subtitle, style: iconText2),
        ],
      ),
    );
  }


  Widget _buildMainDetails(BuildContext context,
      TourController tourController) {
    return Padding(
      padding: EdgeInsets.only(
          left: Get.width * 0.035, right: Get.width * 0.05),
      child: MainDetails(
        imageUrl: tourController.tourImages[0].imagePath ?? '',
        textStyle: detailBoxTextStyle,
      ),
    );
  }

  Widget _buildCityList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      height: 300,
      child: CityList(),
    );
  }

  List<String> _getTourImageUrls(TourController tourController) {
    return tourController.tourImages.map((imageModel) => imageModel.imagePath!)
        .toList();
  }

  Widget formSection() {
    final transferOptionsMap = _getTransferOptionsMap();

    return Obx(() {
      final TourController tourController = Get.find();
      return Card(
        elevation: 25.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
            color: colorwhite,
            width: Get.width * 0.9,
            height: Get.height * .5,
            child: Column(
              children: [
                _buildFormRow(transferOptionsMap),
                SizedBox(height: 30),
                const Divider(height: 1),
                options(tourController.tour.value.tourName!),
              ],
            ),
          ),
        ),
      );
    });
  }

  HashMap<String, int> _getTransferOptionsMap() {
    final transferOptionsMap = HashMap<String, int>();

    if (kDebugMode) {
      print('static.dynamic length is ${static.dynamicoptions.length}');
      print(
          'in the form section options state is ${static.options.value.state}');
    }

    for (var option in static.dynamicoptions) {
      static.addUniquePair(
        transferOptionsMap,
        option.transferName!,
        option.transferId!,
      );
    }

    static.selectedTransfer.value = static.dynamicoptions.isNotEmpty
        ? static.dynamicoptions[0].transferName!
        : '';

    if (kDebugMode) {
      print('transferOptionMap is $transferOptionsMap');
    }

    return transferOptionsMap;
  }

  Widget _buildFormRow(HashMap<String, int> transferOptionsMap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() =>
            DropdownWidget(
              label: 'Adults',
              selectedValue: static.adultsSelectedValue.value,
              onChanged: (value) {
                static.adultsSelectedValue.value = value ?? 1;
                static.getOptionsDynamicData();
              },
            )),
        Obx(() =>
            DropdownWidget(
              label: 'Children',
              selectedValue: static.childrenSelectedValue.value,
              onChanged: (value) {
                static.childrenSelectedValue.value = value ?? 0;
                static.getOptionsDynamicData();
              },
            )),
        Obx(() =>
            DropdownWidget(
              label: 'Infants',
              selectedValue: static.infantsSelectedValue.value,
              onChanged: (value) {
                static.infantsSelectedValue.value = value ?? 0;
              },
            )),
        Obx(() {
          return dateInputField(
            static.dateTextController.value,
            Get.context!,
                () {
              static.changePickedDate(
                  DateTime.parse(static.dateTextController.value.text));
            },
            null,
          );
        }),
        DropdownTransferWidget(
          label: 'type',
          selectedValue: transferOptionsMap.containsKey(
              static.selectedTransfer.value)
              ? static.selectedTransfer.value
              : transferOptionsMap.keys.isNotEmpty
              ? transferOptionsMap.keys.first
              : 'Without Transfers',
          onChanged: (value) {
            static.changeSelectedTransfer(value);
          },
          items: transferOptionsMap.keys.isNotEmpty
              ? transferOptionsMap.keys.toList()
              : ['Without Transfers'],
        ),

      ],
    );
  }
}
