import 'package:travelerdubai/tourdetails/model/tour_model.dart';
import 'package:travelerdubai/tourdetails/repository/tour_repository.dart';

class GetCityTourUseCase {
  final TourRepository repository;

  GetCityTourUseCase(this.repository);

  Future<TourModel> execute(String id) {
    return repository.getCityTour(id);
  }
}
