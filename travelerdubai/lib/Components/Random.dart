import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animal Experience'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    buildNumberOfPersons(),
                    buildSelectDate(),
                    buildExoticBirdShow(),
                    buildSwimmingWithDolphins(),
                    buildDolphinSealShow(),
                  ],
                ),
              ),
              buildGetPriceButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumberOfPersons() {
    return Column(
      children: [
        Text('No. of persons'),
        buildAdults(),
        // buildChildren(),
        // buildInfants(),
      ],
    );
  }

  Widget buildAdults() {
    return Row(
      children: [
        Text('Adults'),
        Expanded(
            child: Container()), // This is a placeholder for the input field
      ],
    );
  }

  // Similarly, you can create buildChildren and buildInfants methods

  Widget buildSelectDate() {
    return Column(
      children: [
        Text('Select a date'),
        // Similarly, you can create two of these for both 'Select a date'
      ],
    );
  }

  Widget buildExoticBirdShow() {
    return Column(
      children: [
        Text('Exotic Bird Show'),
        // Similarly, you can create a Get Price button here
      ],
    );
  }

  Widget buildSwimmingWithDolphins() {
    return Column(
      children: [
        Text('Swimming with Dolphins (Deep Water)'),
        buildSelectDate(),
        // Similarly, you can create a Get Price button here
      ],
    );
  }

  Widget buildDolphinSealShow() {
    return Column(
      children: [
        Text('Dolphin & Seal Show VIP Tickets'),
        buildNumberOfPersons(),
        buildSelectDate(),
        // Similarly, you can create a Get Price button here
      ],
    );
  }

  Widget buildGetPriceButton() {
    return ElevatedButton(
      onPressed: () {
        // Add logic to get the price here
      },
      child: Text('Get Price'),
    );
  }
}
