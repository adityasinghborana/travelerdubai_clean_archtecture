import 'package:flutter/material.dart';

import '../../tourdetails/presentation/Widgets/button.dart';

class InfoWidget extends StatelessWidget {
  final Widget widget;
  final double width;
  final double height;
  final String title;

  const InfoWidget({super.key ,required this.widget,required this.height,required this.width,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: ExpansionTile(
        leading: Icon(Icons.arrow_drop_down),

        childrenPadding: EdgeInsets.symmetric(horizontal: width*0.05),
        tilePadding: EdgeInsets.zero,
        // Optionally set padding to zero
        collapsedIconColor: Colors.black,
        // Set the color of the collapsed icon
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8), // Adjust spacing as needed
                    Text(title),
                  ],
                ),
                InlineFlexButton(
                  label: "Save",
                  bgcolor: Colors.blue,
                  onPressed: () => print("hello"),
                ),
              ],
            ),
          ),
        ),
        children: [

         widget
        ],
      ),
    );
  }
}
