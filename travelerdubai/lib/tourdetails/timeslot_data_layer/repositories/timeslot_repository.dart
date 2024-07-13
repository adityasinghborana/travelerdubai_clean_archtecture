import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/request/timeslot_request.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/response/timeslot_response.dart';

import '../service/timslot_remote.dart';

abstract  class TimeSlotRepository {
  Future<TimeSlotResponse>getTimeSlot(TimeSlotRequest requestBody);
}



class TimeSlotRepositoryImpl implements TimeSlotRepository {
  final TimeSlotRemoteService remoteService;

  TimeSlotRepositoryImpl(this.remoteService);


  @override
  Future<TimeSlotResponse> getTimeSlot(TimeSlotRequest requestBody) async {
    try {
      TimeSlotResponse response = await remoteService.getTimeSlot(requestBody);

      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to create user");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error Fetching Time Slot: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
}
