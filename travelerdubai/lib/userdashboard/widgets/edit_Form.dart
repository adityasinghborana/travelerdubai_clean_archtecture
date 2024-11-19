import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Components/Textformfield.dart';
import '../dashboard_controller.dart';

class EditForm extends StatelessWidget {
  final DashBoardController accountController = Get.find();

  EditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Get.width > 1000 ? desktop(context) : Mobile(),
    );
  }

  Widget desktop(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: buildTextFormField(
                  "Name*", accountController.nameController, "This field is required", null),
            ),
            const SizedBox(
                width: 40), // Adjust spacing between text form fields
            Expanded(
              child: buildTextFormField(
                  "Email*",accountController.emailController, "This field is required", null),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: buildTextFormField(
                  "Age*", accountController.ageController, "This field is required", null),
            ),
            const SizedBox(
                width: 40), // Adjust spacing between text form fields
            Expanded(
              child: buildTextFormField("MobileNumber*", accountController.mobileController,
                  "This field is required", null),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: buildTextFormField(
                  "DOB*",accountController.dobController, "This field is required", () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime(1920),
                        lastDate: DateTime.now(),
                        initialDatePickerMode: DatePickerMode.day)
                    .then((selectedDate) {
                  if (selectedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                    // Set the formatted date to the controller
                    accountController.dobController.text = formattedDate;
                  }
                });
              }),
            ),
            const SizedBox(
                width: 40), // Adjust spacing between text form fields
            Expanded(
              child: buildTextFormField("Address*",accountController.addressController,
                  "This field is required", null),
            ),
          ],
        ),
      ],
    );
  }

  Widget Mobile() {
    return Container(
      height: Get.height,
      child: Column(
        children: [
          Expanded(
            child: buildTextFormField(
                "Name*", accountController.nameController, "This field is required", null),
          ),
          const SizedBox(width: 40), // Adjust spacing between text form fields
          Expanded(
            child: buildTextFormField(
                "Email*", accountController.emailController, "This field is required", null),
          ),
          Expanded(
            child: buildTextFormField(
                "Age*", accountController.ageController, "This field is required", null),
          ),
          const SizedBox(width: 40), // Adjust spacing between text form fields
          Expanded(
            child: buildTextFormField("MobileNumber*", accountController.mobileController,
                "This field is required", null),
          ),
          Expanded(
            child: buildTextFormField(
                "DOB*", accountController.dobController, "This field is required", null),
          ),
          const SizedBox(width: 40), // Adjust spacing between text form fields
          Expanded(
            child: buildTextFormField(
                "Address", accountController.addressController, "This field is required", null),
          ),
        ],
      ),
    );
  }
}
