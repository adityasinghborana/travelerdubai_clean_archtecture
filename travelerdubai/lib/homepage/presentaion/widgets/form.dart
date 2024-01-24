import 'package:flutter/material.dart';

class ExploreAndTravelForm extends StatelessWidget {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController datesController = TextEditingController();
  final TextEditingController guestsController = TextEditingController();

  ExploreAndTravelForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildFormField(
            controller: destinationController,
            labelText: "Destination",
            prefixIcon: Icons.search,
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: datesController,
            labelText: "Dates",
            prefixIcon: Icons.calendar_today,
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: guestsController,
            labelText: "Guests",
            prefixIcon: Icons.person,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore and Travel",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Ut enim ad minima veniam, quis nostrum exercitationeme",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
