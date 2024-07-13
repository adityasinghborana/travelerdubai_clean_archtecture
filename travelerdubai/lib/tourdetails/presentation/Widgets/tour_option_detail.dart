import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/Components/ui_state.dart';
import 'package:travelerdubai/core/constants/constants.dart';
import 'package:travelerdubai/tourdetails/presentation/Widgets/transfer_time_dropdown.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';

import '../../../Cart/data_layer/model/request/update_cart.dart';
import '../../../core/controller/headercontroller.dart';
import '../tour_options_controller.dart';
import 'button.dart';

Widget options(String tourName) {
  final TourOptionStaticDataController optionsStatic = Get.find();
  final TourController tourController = Get.find();
  final HeaderController controller = Get.find();

  return Obx(() {
    var output = optionsStatic.options.value;
    var output1 = optionsStatic.dynamicoptions.toList();
    return getOutputWidget(output, output1, tourName, optionsStatic, tourController, controller);
  });
}

Widget getOutputWidget(
    output,
    output1,
    String tourName,
    TourOptionStaticDataController optionsStatic,
    TourController tourController,
    HeaderController controller,
    ) {
  switch (output.state) {
    case UiState.SUCCESS:
      return buildOptionsList(output, output1, tourName, optionsStatic, tourController, controller);
    case UiState.EMPTY:
      return const Text('Empty');
    case UiState.LOADING:
      return const CircularProgressIndicator();
    case UiState.ERROR:
      return const Text('Error');
    default:
      return const Text('Unknown State');
  }
}

Widget buildOptionsList(
    output,
    output1,
    String tourName,
    TourOptionStaticDataController optionsStatic,
    TourController tourController,
    HeaderController controller,
    ) {
  return Expanded(
    child: ListView.builder(
      key: UniqueKey(),
      itemCount: optionsStatic.options.value.data?.length,
      itemBuilder: (BuildContext context, int index) {
        return buildOptionItem(context, index, output, output1, tourName, optionsStatic, tourController, controller);
      },
    ),
  );
}

Widget buildOptionItem(
    BuildContext context,
    int index,
    output,
    output1,
    String tourName,
    TourOptionStaticDataController optionsStatic,
    TourController tourController,
    HeaderController controller,
    ) {
  optionsStatic.timeslots.clear();
  optionsStatic.getTimeSlots(optionsStatic.options.value.data?[index].tourOptionId ?? 0);

  int? id = optionsStatic.options.value.data?[index].tourId;
  int tourIdIndex = output1.indexWhere((element) => element.tourId == id);
  optionsStatic.optionId.value = output.data![index].tourOptionId!;

  if (optionsStatic.transferId.value == 0 && tourIdIndex != -1) {
    optionsStatic.transferId.value = output1.isNotEmpty ? output1[tourIdIndex].transferId! : 0;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        buildOptionRow(context, index, output, output1, tourName, optionsStatic, tourController, controller),
      ],
    ),
  );
}

Widget buildOptionRow(
    BuildContext context,
    int index,
    output,
    output1,
    String tourName,
    TourOptionStaticDataController optionsStatic,
    TourController tourController,
    HeaderController controller,
    ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      buildOptionName(context, index, optionsStatic),
      buildPricingSection(context, index, output1, optionsStatic),
      TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("${optionsStatic.options.value.data?[index].optionName}"),
                content: Text("${optionsStatic.options.value.data?[index].optionDescription ?? 'No description available.'}"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: const Text("More Info"),
      ),
       buildTimeSlotSection(index, optionsStatic, tourController),
      GetBuilder<HeaderController>(
        builder: (controller) {
          return controller.loggedIn.value
              ? buildAddToCartButton(index, output1, tourName, optionsStatic, controller)
              : buildLoginButton();
        },
      ),


    ],
  );
}

Widget buildOptionName(BuildContext context, int index, TourOptionStaticDataController optionsStatic) {
  return SizedBox(
    width: Get.width * 0.20,
    child: Text(
      "${optionsStatic.options.value.data?[index].optionName}",
      style: bodyBlack(context).copyWith(fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildPricingSection(BuildContext context, int index, output1, TourOptionStaticDataController optionsStatic) {
  return Obx(() {
    if (optionsStatic.dateTextController.value.text != '') {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildPriceContainer(context, index, output1, optionsStatic),
        ],
      );
    } else {
      return const Text("fetching");
    }
  });
}

Widget buildPriceContainer(BuildContext context, int index, output1, TourOptionStaticDataController optionsStatic) {
  double finalAmount = 0.0;
  if (output1.isNotEmpty) {
    int tourIdIndex = output1.indexWhere((element) => element.tourId == optionsStatic.options.value.data?[index].tourId);
    if (tourIdIndex != -1) {
      finalAmount = (output1[tourIdIndex].finalAmount ?? 0) +
          (optionsStatic.pricing.value.addPriceAdult ?? 0) +
          (optionsStatic.pricing.value.addPriceChildren ?? 0) +
          (optionsStatic.pricing.value.additionalPriceInfant ?? 0);
    }
  }

  return Container(
    width: Get.width * 0.09,
    alignment: Alignment.center,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: color_EEEEEE),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "AED",
            style: bodyBlack(context).copyWith(fontSize: Get.width * 0.01, fontWeight: FontWeight.bold),
          ),
          Text(
            " $finalAmount",
            style: bodyBlack(context).copyWith(fontSize: Get.width * 0.01, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
}

Widget buildTimeSlotSection(int index, TourOptionStaticDataController optionsStatic, TourController tourController) {
  return Obx(() {
    var optionsSize = optionsStatic.timeslots.length;
    if (tourController.tour.value.isSlot == true && index >= optionsSize) {
      return Expanded(child: const Text("Loading "));
    } else if (tourController.tour.value.isSlot == false) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: color_EEEEEE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text("No time Slot required "),
      );
    } else {
      return TimeDropdownWidget(
        tourOptionId: optionsStatic.options.value.data?[index].tourOptionId ?? 0,
      );
    }
  });
}

Widget buildAddToCartButton(
    int index,
    output1,
    String tourName,
    TourOptionStaticDataController optionsStatic,
    HeaderController controller,
    ) {
  return Flexible(
    flex: 1,
    child: InlineFlexButton(
      vpadding: 20,
      hpadding: 30,
      bgcolor: colorblue,
      label: 'Add To Cart',
      onPressed: ()  {
        final data = output1.isNotEmpty
            ? output1[index]
            : optionsStatic.options.value.data![index]; // Fallback to static data if dynamic data is not available
        var value = UpdateCartTourDetail(
          tourname: tourName,
          tourOption: data.transferName ?? 'N/A',
          tourId: data.tourId!,
          optionId: data.tourOptionId!,
          adult: optionsStatic.adultsSelectedValue.value,
          child: optionsStatic.childrenSelectedValue.value,
          infant: optionsStatic.infantsSelectedValue.value,
          tourDate: optionsStatic.selectedDate.value.toString().substring(0, 10),
          timeSlotId: optionsStatic.timeSlotId.value,
          startTime: optionsStatic.starttime.value,
          vendoruid: optionsStatic.vendoruid.value ??"0000",
          transferId: data.transferId ?? 0,
          adultRate: data.adultPrice?.toDouble() ?? 0.0,
          childRate: data.childPrice?.toDouble() ?? 0.0,
          serviceTotal: ((data.finalAmount ?? 0) +
              (optionsStatic.pricing.value.addPriceAdult ?? 0) +
              (optionsStatic.pricing.value.addPriceChildren ?? 0) +
              (optionsStatic.pricing.value.additionalPriceInfant ?? 0)),
          cartId: controller.cartId.value,
        );


        optionsStatic.Addtocart(value);
      },
    ),
  );
}


Widget buildLoginButton(

    ) {
  return Flexible(
    flex: 1,
    child: InlineFlexButton(
      vpadding: 20,
      hpadding: 30,
      bgcolor: colorblue,
      label: 'Login',
      onPressed: () async {
       Get.toNamed('/login');
      },
    ),
  );
}
