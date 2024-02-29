import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_dynamic.dart';

import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_option_dynamic_response.dart';

import 'package:travelerdubai/tourdetails/touroption_data_layer/repository/tour_option_repository.dart';

class GetTourOptionsDynamicDataUseCase {
  final TourOptionsRepository repository;

  GetTourOptionsDynamicDataUseCase(this.repository);

  Future<TourOptionDynamicDataResponse> execute(
      TourOptionDynamicRequest data) {
    return repository.getTouroptionsdynamic( data);
  }
}
