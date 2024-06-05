import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:travelerdubai/homepage/cities_controller.dart';

import '../../../core/constants/constants.dart';
import '../../remote/homepage_remote_service.dart';
import '../../repository/homepage_repository.dart';
import '../../usecase/cities_usecase.dart';

class CityList extends StatefulWidget {
  CityList({Key? key}) : super(key: key);

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  final CityController controller = Get.put(
    CityController(
      GetCitiesUseCase(
        HomeRepositoryImpl(
          HomeRemoteService(
            Dio(),
          ),
        ),
      ),
    ),
  );

  final ItemScrollController itemScrollController = ItemScrollController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double widthFactor;
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          widthFactor = MediaQuery.of(context).size.height * .50;
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          widthFactor = MediaQuery.of(context).size.height * .30;
        } else {
          widthFactor = MediaQuery.of(context).size.height * .30;
        }
        return Obx(() {
          if (controller.cities.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                SizedBox(
                  width: Get.width>600 ?  Get.width * .9 :  Get.width,
                  height: Get.height * .5,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: itemScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cities.length,
                    itemBuilder: (context, index) {
                      final city = controller.cities[index];
                      return CityCard(city: city, widthFactor: widthFactor);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => _scrollToPrevious(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: colorwhite),
                      onPressed: () => _scrollToNext(),
                    ),
                  ),
                ),
              ],
            );
          }
        });
      },
    );
  }

  void _scrollToNext() {
    if (currentIndex < controller.cities.length - 1) {
      currentIndex++;
      itemScrollController.scrollTo(
        index: currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToPrevious() {
    if (currentIndex > 0) {
      currentIndex--;
      itemScrollController.scrollTo(
        index: currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

class CityCard extends StatefulWidget {
  final dynamic city; // Replace with your city model type
  final double widthFactor;

  const CityCard({Key? key, required this.city, required this.widthFactor})
      : super(key: key);

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  bool isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          String cityName = widget.city.CityName;

          Get.toNamed(
            '/experiences',
            parameters: {'cityName': cityName.toString()},
          );
        },
        child: GestureDetector(
          onTapDown: (_) => _onTap(true),
          onTapUp: (_) => _onTap(false),
          onTapCancel: () => _onTap(false),
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.identity()..scale(isHovered || _isTapped ? 1.015 : 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 10 / 9,
                        child: Image.network(
                          "https://source.unsplash.com/random/?${widget.city.CityName}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(gradient: imageGradient),
                      ),
                      Positioned(
                        bottom: 8.0,
                        left: 8.0,
                        right: 8.0,
                        child: SizedBox(
                          width: widget.widthFactor,
                          child: Text(
                            widget.city.CityName,
                            style: getH2TextStyle(context).copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovering) {
    setState(() {
      isHovered = isHovering;
    });
  }

  void _onTap(bool isTapped) {
    setState(() {
      _isTapped = isTapped;
    });
  }
}
