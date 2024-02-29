import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/contants.dart';

class DetailBox extends StatelessWidget {
  final String title ;
  final Widget Description;

  DetailBox({required this.title,required this.Description});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: colorwhite,
      color: colorwhite,
      elevation: 3,
      child: ListTile(
contentPadding: EdgeInsets.all(20),
        title: Text(title,style: H3,),
        subtitle: Description,
      ),
    );
  }
}
