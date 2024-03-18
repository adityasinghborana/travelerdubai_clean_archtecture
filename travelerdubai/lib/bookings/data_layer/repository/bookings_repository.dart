import 'package:travelerdubai/bookings/data_layer/model/request/booking_request.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/BookingResponse.dart';

import '../service/booking_remote.dart';

abstract class BookingsRepository {
  Future<BookingResponse> getBookingDetails(BookingRequest data);
}

@override
class BookingsRepositoryImpl implements BookingsRepository {
  final BookingsRemoteService remote;

  BookingsRepositoryImpl(this.remote);

  @override
  Future<BookingResponse> getBookingDetails( BookingRequest data) {
    return remote.doBookings( data);
  }
}