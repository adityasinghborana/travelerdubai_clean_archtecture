import 'package:travelerdubai/homepage/model/city.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';

class GetCitiesUseCase{
  final HomeRepository repository;

  GetCitiesUseCase(this.repository);

  Future<List<City>> execute(
       ) {
    return repository.getCities();
  }
}