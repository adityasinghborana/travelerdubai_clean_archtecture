import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../Cart/data_layer/service/cart_remote.dart';
import '../../../Cart/data_layer/usecase/get_cart_usecase.dart';
import '../../../bookings/data_layer/repository/bookings_repository.dart';
import '../../../bookings/data_layer/service/booking_remote.dart';
import '../../../bookings/data_layer/usecase/bookings_usecase.dart';
import '../../data_layer/repository/Intent_repository.dart';
import '../../data_layer/service/remote.dart';
import '../../data_layer/usecase/intent_usecase.dart';
import '../checkout_controller.dart';

class ProductList extends StatelessWidget {
  final double height;
  final double width;
  ProductList({this.height = 500, this.width = 500});
  @override
  Widget build(BuildContext context) {
    final CheckoutController cc = Get.put(
      CheckoutController(
        getCartUseCase: GetCartUseCase(
          CartRepositoryImpl(
            CartRemoteService(Dio()),
          ),
        ),
        intentUseCase: IntentUseCase(
          StripeIntentRepositoryImpl(
            StripeRemoteService(Dio()),
          ),
        ),
        doBookingUseCase: DoBookingUseCase(
          BookingsRepositoryImpl(
            BookingsRemoteService(Dio()),
          ),
        ),
      ),
    );
    final ScrollController controller = ScrollController();

    return Container(
      height: Get.height * 0.7,
      width: width,
      child: Obx(
        () => ListView.builder(
          controller: controller,
          itemCount: cc.cartTours.length,
          itemBuilder: (context, index) {
            if (cc.cartTours.length != 0) {
              // Access the item at the given index
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorwhite,
                    ),
                    padding: const EdgeInsets.all(18.0),
                    height: height,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cc.cartTours[index].tourname),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.016),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Availability"),
                                    Text(
                                      cc.cartTours[index].tourname,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: const Text("Date",
                                            textAlign: TextAlign.left)),
                                    Text(cc.cartTours[index].tourDate,
                                        textAlign: TextAlign.left),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.016),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tickets"),
                                    Text(
                                        "${(cc.cartTours[index].adult ?? 0) + (cc.cartTours[index].child ?? 0) + (cc.cartTours[index].infant ?? 0)}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.016),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Time"),
                                    Text("${cc.cartTours[index].startTime}"),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Transfer Type "),
                                    Text("${cc.cartTours[index].tourOption}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.016),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Adult "),
                                    Text("${cc.cartTours[index].adult}"),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Children "),
                                    Text("${cc.cartTours[index].child}"),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Infant "),
                                    Text("${cc.cartTours[index].infant}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.016),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total", style: bodyBlack(context)),
                                    Text(
                                        "${cc.cartTours[index].serviceTotal} AED"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("../assets/images/exclamation.png"),
                              Text(
                                "Non Refundable",
                                style: bodyBlack(context)
                                    .copyWith(color: Colors.red.shade900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            } else {
              // Handle the case where the index is out of range
              return Container(
                height: 10,
                width: 20,
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}
