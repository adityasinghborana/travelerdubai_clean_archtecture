import 'package:travelerdubai/bookings/data_layer/model/request/user_bookings.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/UserBookings.dart';
import 'package:travelerdubai/bookings/data_layer/repository/bookings_repository.dart';

class GetUserBookingsUseCase{
  final BookingsRepository repository;

  GetUserBookingsUseCase(this.repository);

  Future<List<BookingList>> execute(
      UserBookingsRequest data) {
    return repository.getUserBookings( data);
  }
}