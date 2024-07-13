import 'package:travelerdubai/bookings/data_layer/model/request/booking_request.dart';
import 'package:travelerdubai/bookings/data_layer/model/response/BookingResponse.dart';
import 'package:travelerdubai/bookings/data_layer/repository/bookings_repository.dart';

class DoBookingUseCase{
  final BookingsRepository repository;

  DoBookingUseCase(this.repository);

  Future<DataModel> execute(
        BookingRequest data) {
    return repository.getBookingDetails(data);
  }
}