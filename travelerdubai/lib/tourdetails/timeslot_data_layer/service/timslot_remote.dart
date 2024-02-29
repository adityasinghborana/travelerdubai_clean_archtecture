import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/request/timeslot_request.dart';
import 'package:travelerdubai/tourdetails/timeslot_data_layer/models/response/timeslot_response.dart';



part 'timslot_remote.g.dart';


@RestApi(baseUrl: 'http://localhost:3000')
abstract class TimeSlotRemoteService {
  factory TimeSlotRemoteService(Dio dio, {String? baseUrl}) =
  _TimeSlotRemoteService;


   @POST('/createusers')
  Future<TimeSlotResponse> getTimeSlot(
      @Body() TimeSlotRequest requestBody,
      );
}

