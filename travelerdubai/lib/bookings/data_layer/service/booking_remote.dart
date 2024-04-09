import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/UserBookings.dart';
import '../../../core/constants/constants.dart';
import '../model/request/booking_request.dart';
import '../model/request/user_bookings.dart';
import '../model/response/BookingResponse.dart';
part 'booking_remote.g.dart';




@RestApi(baseUrl:"http://localhost:3000")
abstract class BookingsRemoteService {
  factory BookingsRemoteService(Dio dio, {String? baseUrl}) =
  _BookingsRemoteService;


   @POST('/bookings')
  Future<BookingResponse> doBookings(
      @Body()  BookingRequest requestBody,
      );
  @POST('/userbookings')
  Future<List<BookingList>> getBookings(
      @Body()  UserBookingsRequest requestBody,
      );
}

