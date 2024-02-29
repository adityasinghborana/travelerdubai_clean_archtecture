import 'package:get/get.dart';
import 'package:travelerdubai/Cart/presentation/model/cart_request_model.dart';

class CartController extends GetxController {
  final RxList<BookingModel> tour = <BookingModel>[].obs;

  @override
  void onInit() {
    addtoCart();
    super.onInit();
  }
  final BookingModel data = BookingModel(tourDetails: [
    TourDetails(tourId: 1,
        optionId: 12,
        adult: 1,
        child: 0,
        infant: 0,
        tourDate: "28-02-2024",
        timeSlotId: 2212,
        startTime: "7:00pm",
        transferId: 00010,
        pickup: "none",
        adultRate: 150.00,
        childRate: 000.000,
        serviceTotal: 150.0)
  ],
    passengers: [Passenger(serviceType: "tour",
        prefix: "Mr",
        firstName: "Aditya",
        lastName: "Borana",
        email: "Aditya@ogresto.com",
        mobile: "+919993676834",
        nationality: "indian",
        message: "hello",
        leadPassenger: true , paxType: "Adult")
    ],);

  void addtoCart() {
    tour.value.add(data);
  }
}

