
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_static_data.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_options_staticdata_response.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/repository/tour_option_repository.dart';

class GetTourOptionsStaticDataUseCase {
  final TourOptionsRepository repository;

  GetTourOptionsStaticDataUseCase(this.repository);

  Future<TourOptionsStaticDataResponse> execute(TourOptionStaticData data) {
    return repository.getTouroptionstatic( data);
  }
}
