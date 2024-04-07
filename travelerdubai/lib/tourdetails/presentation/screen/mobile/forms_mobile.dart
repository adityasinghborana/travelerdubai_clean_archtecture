import 'package:flutter/material.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../../core/widgets/Mobileheader.dart';

class FormsMobile extends StatelessWidget {
  const FormsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MobileHeader(),
            _buildBackArrowContainer(context),
            SizedBox(
              height: MediaQuery.of(context).size.width * .65,
              child: ListView.builder(
                itemCount: 5, // Change the itemCount as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFormHeader(index),
                          _buildPriceAndInfoRow(),
                          _buildTimeRow(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormHeader(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Form Heading $index', // Dynamic heading based on index
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildPriceAndInfoRow() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Price: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$100', // Replace with dynamic price value
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'More Info: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet', // Replace with dynamic info
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            'Time: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter time', // Customize hint as needed
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackArrowContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffd1d5ff),
            Color(0xfff3c5f1),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Handle back arrow functionality
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Private ',
              style: formHeaderTextStyleMobile,
            ),
          ),
        ],
      ),
    );
  }
}
