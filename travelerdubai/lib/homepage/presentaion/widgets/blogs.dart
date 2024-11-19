import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

class BlogsSection extends StatelessWidget {
  final Widget heading;

  BlogsSection({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 80, right: 60),
      color: colorwhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [heading],
          ),
          Card(
            elevation: 3,
            borderOnForeground: true,
            color: colorblack,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: AspectRatio(
                        aspectRatio: 16/9,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(images.blogbanner))),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Planning your trip to Dubai?",
                            style: H1open(context).copyWith(color: colorwhite),
                          ),
                          Text(
                            "Find the perfect itinerary, discover the best shows and attractions, and get free insights on must-visit attractions and customize your perfect itinerary.",
                            style: bodyf.copyWith(color: colorwhite),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed("/Aboutus");
                            },

                            child: Text(
                              "Read More ...",
                              style: bodyf.copyWith(color: colorwhite,decoration: TextDecoration.underline,
                                decorationColor: colorwhite,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
