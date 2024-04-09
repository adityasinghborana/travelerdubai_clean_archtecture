import 'package:flutter/material.dart';

import '../../core/widgets/Textformfield.dart';

class EditForm extends StatelessWidget {
  final TextEditingController namecontrller = TextEditingController();
   EditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: buildTextFormField("Name", namecontrller)),
            SizedBox(width: 40), // Adjust spacing between text form fields
            Expanded(child: buildTextFormField("Email", namecontrller)),
          ],
        ),
        Row(
          children: [
            Expanded(child: buildTextFormField("Age", namecontrller)),
            SizedBox(width: 40), // Adjust spacing between text form fields
            Expanded(child: buildTextFormField("MobileNumber", namecontrller)),
          ],
        ),
        Row(
          children: [
            Expanded(child: buildTextFormField("DOB", namecontrller)),
            SizedBox(width: 40), // Adjust spacing between text form fields
            Expanded(child: buildTextFormField("Address", namecontrller)),
          ],
        ),
      ],
    );
  }
}
