import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/constants/contants.dart';
import '../model/request/booking_request.dart';
import '../model/response/BookingResponse.dart';
part 'booking_remote.g.dart';




@RestApi(baseUrl: baseurl)
abstract class BookingsRemoteService {
  factory BookingsRemoteService(Dio dio, {String? baseUrl}) =
  _BookingsRemoteService;


   @POST('/bookings')
  Future<BookingResponse> doBookings(
      @Body()  BookingRequest requestBody,
      );
}

