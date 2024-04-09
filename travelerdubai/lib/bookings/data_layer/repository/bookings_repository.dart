import 'package:travelerdubai/bookings/data_layer/model/request/booking_request.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/BookingResponse.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/UserBookings.dart';
import 'package:travelerdubai/userdashboard/widgets/booking_list.dart';

import '../model/request/user_bookings.dart';
import '../service/booking_remote.dart';

abstract class BookingsRepository {
  Future<BookingResponse> getBookingDetails(BookingRequest data);
  Future<List<BookingList>> getUserBookings( UserBookingsRequest data);
}

@override
class BookingsRepositoryImpl implements BookingsRepository {
  final BookingsRemoteService remote;

  BookingsRepositoryImpl(this.remote);

  @override
  Future<BookingResponse> getBookingDetails( BookingRequest data) {
    return remote.doBookings( data);
  }
  @override
  Future<List<BookingList>> getUserBookings( UserBookingsRequest data) {
    return remote.getBookings( data);
  }
}