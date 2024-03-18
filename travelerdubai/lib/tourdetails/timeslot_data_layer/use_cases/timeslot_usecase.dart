
import 'package:travelerdubai/auth/usersdatalayer/model/request/create_user_request.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/create_user_response.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/request/timeslot_request.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/response/timeslot_response.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/repositories/timeslot_repository.dart';

class GetTimeSlotUseCase{
  final TimeSlotRepository repository;

  GetTimeSlotUseCase(this.repository);

  Future<TimeSlotResponse> execute(
     TimeSlotRequest data) {
    return repository.getTimeSlot( data);
  }
}