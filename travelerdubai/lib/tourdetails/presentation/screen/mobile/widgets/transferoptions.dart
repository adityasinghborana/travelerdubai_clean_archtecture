import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../../../tour_options_controller.dart';

class TransferOptions extends StatefulWidget {
  final List<String> options; // List of transfer options
  final void Function(String)? onOptionSelected; // Callback function when an option is selected

  const TransferOptions({
    Key? key,
    required this.options,
    this.onOptionSelected,
  }) : super(key: key);

  @override
  _TransferOptionsState createState() => _TransferOptionsState();
}

class _TransferOptionsState extends State<TransferOptions> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    // Set the default selected option to the first item if available
    if (widget.options.isNotEmpty) {
      _selectedOption = widget.options.first;
    }
  }

  @override
  void didUpdateWidget(TransferOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the selected option if options change
    if (widget.options != oldWidget.options && widget.options.isNotEmpty) {
      _selectedOption = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.options.map((option) => _buildOption(option)).toList(),
      ),
    );
  }

  Widget _buildOption(String option) {
    final TourOptionStaticDataController static = Get.find();
    return GestureDetector(
      onTap: () {

        static.changeSelectedTransfer(option);

        setState(() {
          _selectedOption = option;
        });
        if (widget.onOptionSelected != null) {
          widget.onOptionSelected!(option);
        }
      },
      child: Container(
        width: Get.width/3.2,
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _selectedOption == option ? colorMediumBlue : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1C112211),
              blurRadius: 16,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              option,
              style: const TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 1.25,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
