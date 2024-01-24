// data/repositories/tour_repository_impl.dart

import 'package:travelerdubai/tourdetails/model/tour_model.dart';
import 'package:travelerdubai/tourdetails/remote/tour_remote.dart';

abstract class TourRepository {
  Future<TourModel> getCityTour(String id);
}

@override
class TourRepositoryImpl implements TourRepository {
  final TourRemoteService remoteDataSource;

  TourRepositoryImpl(this.remoteDataSource);

  @override
  Future<TourModel> getCityTour(String id) {
    return remoteDataSource.getCityTour(id);
  }
}
