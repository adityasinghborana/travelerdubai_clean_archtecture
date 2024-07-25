import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/controller/headercontroller.dart';
import 'package:travelerdubai/eventDetails/eventdetails_Controller.dart';
import 'package:travelerdubai/eventDetails/widgets/priceWidget.dart';
import 'package:travelerdubai/eventDetails/widgets/timedropdown.dart';

import '../../Components/custom_button.dart';
import '../../core/constants/constants.dart';
import '../../tourdetails/presentation/Widgets/dropdown_widget.dart';

class EventOptions extends StatelessWidget {
  const EventOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final HeaderController headerController = Get.find();

    final EventdetailsController eventdetailsController = Get.find();
    return Flexible(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
            color: colorwhite, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => DropdownWidget(
                      label: 'Adults',
                      selectedValue:
                          eventdetailsController.adultsSelectedValue.value,
                      onChanged: (value) {
                        eventdetailsController.adultsSelectedValue.value =
                            value ?? 1;
                      },
                    )),
                Obx(() => DropdownWidget(
                      label: 'Children',
                      selectedValue:
                          eventdetailsController.childrenSelectedValue.value,
                      onChanged: (value) {
                        eventdetailsController.childrenSelectedValue.value =
                            value ?? 0;
                      },
                    )),
                Obx(() => DropdownWidget(
                      label: 'Infants',
                      selectedValue:
                          eventdetailsController.infantsSelectedValue.value,
                      onChanged: (value) {
                        eventdetailsController.infantsSelectedValue.value =
                            value ?? 0;
                      },
                    )),
              ],
            ),
            Divider(
              height: 2,
              color: colorlightgrey,
            ),
            Container(
              width: double.infinity,
              height: Get.height * .2,
              child: Obx(() {
                return ListView.builder(
                  itemCount: eventdetailsController.eventoption.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    final timeslots = eventdetailsController
                        .eventoption.value[index].timeslots
                        ?.map((e) => e.timeSlot)
                        .toList();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                "${eventdetailsController.eventoption.value[index].optionname}"),
                          ),
                          Obx(() {
                            return Price(
                                double.parse(eventdetailsController
                                        .eventoption.value[index].adultprice ??
                                    ""),
                                double.parse(eventdetailsController
                                        .eventoption.value[index].infantprice ??
                                    ""),
                                double.parse(eventdetailsController
                                        .eventoption.value[index].childprice ??
                                    ""));
                          }),
                          TimeDropDown(
                            items: timeslots!.map((slot) {
                              return DropdownMenuItem(
                                value: slot,
                                child: Text(slot ?? ""),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              print(value);
                            },
                          ),
                          headerController.loggedIn.isTrue
                              ? ButtonView(
                                  btnName: "Book Now ",
                                  bgColor: colorMediumBlue,
                                  borderColor: colorMediumBlue,
                            onButtonTap: (){
                              Get.toNamed('/eventcheckout');
                            },
                                )
                              : ButtonView(
                                  btnName: "Login ",
                                  bgColor: colorMediumBlue,
                                  borderColor: colorMediumBlue,
                            onButtonTap: (){
                                    Get.toNamed('/login');
                            },
                                )
                        ],
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
