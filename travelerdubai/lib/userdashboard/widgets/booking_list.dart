import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/contants.dart';

class BookingsList extends StatelessWidget {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context , index){
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(

          height: 300,color: colorblue,),
      );
    }
    );
  }
}
