import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/tourdetails/presentation/tours_controller.dart';

import '../../../../Cart/data_layer/repository/cart_repository.dart';
import '../../../../Cart/data_layer/service/cart_remote.dart';
import '../../../../Cart/data_layer/usecase/update_cart.dart';
import '../../../../Components/date_picker.dart';
import '../../../../core/widgets/Mobileheader.dart';
import '../../../timeslot_data_layer/repositories/timeslot_repository.dart';
import '../../../timeslot_data_layer/service/timslot_remote.dart';
import '../../../timeslot_data_layer/use_cases/timeslot_usecase.dart';
import '../../../tourdetail_data_layer/Usecase/usecase.dart';
import '../../../tourdetail_data_layer/remote/tour_remote.dart';
import '../../../tourdetail_data_layer/repository/tour_repository.dart';
import '../../../touroption_data_layer/remote/service/touroption_remote.dart';
import '../../../touroption_data_layer/repository/tour_option_repository.dart';
import '../../../touroption_data_layer/usecase/touroption_dynamic_data.dart';
import '../../../touroption_data_layer/usecase/usecase_touroptions_staticdata.dart';
import '../../tour_options_controller.dart';

class FormsMobile extends StatelessWidget {
  FormsMobile({Key? key}) : super(key: key);
  final TourController tourController = Get.put(TourController(
    GetCityTourUseCase(TourRepositoryImpl(TourRemoteService(Dio()))),
  ));
  final TourOptionStaticDataController static = Get.put(
    TourOptionStaticDataController(
        GetTourOptionsStaticDataUseCase(
            TourOptionsRepositoryImpl(TourOptionRemoteService(Dio()))),
        GetTourOptionsDynamicDataUseCase(
          TourOptionsRepositoryImpl(
            TourOptionRemoteService(Dio()),
          ),
        ),
        GetTimeSlotUseCase(
          TimeSlotRepositoryImpl(
            TimeSlotRemoteService(Dio()),
          ),
        ),
        UpdateCartUseCase(
          CartRepositoryImpl(
            CartRemoteService(Dio()),
          ),
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MobileHeader(),
            _buildBackArrowContainer(context, tourController),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                'Select Booking Date',
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: dateInputField(
                  static.dateTextController.value, Get.context!, () {
                static.selectedDate.value =
                    DateTime.parse(static.dateTextController.value.text);
                static.getOptionsdynamicData();
                static.gettimeSlots();
              }, MediaQuery.of(context).size.width),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Transfer Type',
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const TransferOptions(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Packages',
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .65,
              child: ListView.builder(
                itemCount: 5, // Change the itemCount as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      shadowColor: const Color(0x1C112211),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      surfaceTintColor: Colors.grey,
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

  Widget _buildBackArrowContainer(
      BuildContext context, TourController tourController) {
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${tourController.tour.value.tourName}",
              style: formHeaderTextStyleMobile,
            ),
          ),
        ],
      ),
    );
  }
}

class TransferOptions extends StatefulWidget {
  const TransferOptions({Key? key}) : super(key: key);

  @override
  _TransferOptionsState createState() => _TransferOptionsState();
}

class _TransferOptionsState extends State<TransferOptions> {
  String? _selectedOption; // Variable to hold the selected option

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildOption('Without Transfer'),
          _buildOption('Sharing Transfer'),
          _buildOption('Private Transfer'),
        ],
      ),
    );
  }

  Widget _buildOption(String option) {
    return Container(
      width: 140,
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1C112211),
            blurRadius: 16,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Radio<String>(
            value: option,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                option,
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
