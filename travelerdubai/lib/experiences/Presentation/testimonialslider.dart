import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/tourdetails/presentation/testimonialcontroller.dart';

class testimonialWidget extends StatelessWidget {
  final TestimonialController controller = Get.put(TestimonialController());
  final List tourReview;

  testimonialWidget(this.tourReview, {super.key}) {
    controller.updatereviewList(tourReview);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.reviewList.isEmpty) {
                return const Text('No reviews available.');
              } else {
                final currentReview =
                    controller.reviewList[controller.currentIndex.value];
                return Container(
                  height: Get.height * .25,
                  width: Get.width * .50,
                  color: colorlightgrey,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              currentReview.reviewContent,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              currentReview.reviewTitle,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      currentReview.imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(currentReview.guestName),
                                    Text(currentReview.visitMonth),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                int.parse(currentReview
                                    .rating), // Convert rating to integer
                                (index) => const Icon(Icons.star,
                                    color: Colors.yellow),
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: controller.previoustestimonial,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: controller.nexttestimonial,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );

    //Column(
    //   children: [
    //     Stack(
    //       children: [
    //         Image.network(
    //           controller.reviewList[controller.currentIndex.value].imagePath,
    //           height: Get.height * 0.5,
    //           fit: BoxFit.cover,
    //           width: double.infinity,
    //         ),
    //         Positioned(
    //           width: Get.width,
    //           top: Get.height * 0.25,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 color: Color.fromRGBO(0, 0, 0, 0.1),
    //                 child: IconButton(
    //                   icon: Icon(Icons.arrow_back, color: colorwhite),
    //                   onPressed: controller.previoustestimonial,
    //                 ),
    //               ),
    //               Container(
    //                 color: Color.fromRGBO(0, 0, 0, 0.1),
    //                 child: IconButton(
    //                   icon: Icon(Icons.arrow_forward, color: colorwhite),
    //                   onPressed: controller.nexttestimonial,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Text(
    //           controller
    //               .reviewList[controller.currentIndex.value].reviewTitle,
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  }
}
