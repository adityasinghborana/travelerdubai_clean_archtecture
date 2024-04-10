import 'package:flutter/material.dart';

import '../../core/widgets/Textformfield.dart';

class EditForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  EditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
    key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: buildTextFormField("Name", nameController, "This field is required")),
              SizedBox(width: 40), // Adjust spacing between text form fields
              Expanded(child: buildTextFormField("Email", emailController, "This field is required")),
            ],
          ),
          Row(
            children: [
              Expanded(child: buildTextFormField("Age", ageController, "This field is required")),
              SizedBox(width: 40), // Adjust spacing between text form fields
              Expanded(child: buildTextFormField("MobileNumber", mobileController, "This field is required")),
            ],
          ),
          Row(
            children: [
              Expanded(child: buildTextFormField("DOB", dobController, "This field is required")),
              SizedBox(width: 40), // Adjust spacing between text form fields
              Expanded(child: buildTextFormField("Address", addressController, "This field is required")),
            ],
          ),
        ],
      ),
    );
  }
}