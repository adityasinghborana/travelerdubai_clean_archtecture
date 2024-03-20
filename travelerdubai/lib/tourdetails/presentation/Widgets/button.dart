// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/AboutPage/presentationlayer/about_us_controller.dart';
import 'package:travelerdubai/core/constants/contants.dart';

class RotatingImageBanner extends StatefulWidget {
  const RotatingImageBanner({super.key});

  @override
  _RotatingImageBannerState createState() => _RotatingImageBannerState();
}

class _RotatingImageBannerState extends State<RotatingImageBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late AboutUsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AboutUsController>();

    _animationController = AnimationController(
      vsync: this, // Use the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 1),
    );
    _opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
              //controller.moveToNextImage();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Center(
        child: Obx(() {
          final imageUrl = controller.imageList[controller.currentIndex.value];
          return Stack(
            children: [
              FadeTransition(
                  opacity: _opacityAnimation,
                  child: SizedBox(
                    width: Get.width,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: InlineFlexButton(
                      label: 'Explore', onPressed: () => ("okay"))),
            ],
          );
        }),
      ),
    );
  }
}

class InlineFlexButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double vpadding;
  final double hpadding;
  final double fontsize;

  const InlineFlexButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.vpadding = 30,
    this.hpadding = 40,
    this.fontsize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorPrimary,
        padding: EdgeInsets.symmetric(vertical: vpadding, horizontal: hpadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(color: Colors.white),
        alignment: Alignment.center,
      ),
      child: Text(
        label,
        style: GoogleFonts.playfairDisplay(fontSize: 20, color: colorwhite),
      ),
    );
  }
}
