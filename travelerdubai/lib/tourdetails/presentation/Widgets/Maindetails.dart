import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDetails extends StatelessWidget {
  final Rx<DateTime?> selectedDate = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child:
         Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],

      ),
    );
  }
}