// data/repositories/tour_repository_impl.dart



import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_dynamic.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_static_data.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_option_dynamic_response.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_options_staticdata_response.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/remote/service/touroption_remote.dart';

abstract class TourOptionsRepository {
  Future<TourOptionsStaticDataResponse> getTouroptionstatic(TourOptionStaticData data);
  Future<TourOptionDynamicDataResponse> getTouroptionsdynamic(
       TourOptionDynamicRequest data);
}

@override
class TourOptionsRepositoryImpl implements TourOptionsRepository {
  final TourOptionRemoteService remoteDataSource;

  TourOptionsRepositoryImpl(this.remoteDataSource);

  @override
  Future<TourOptionsStaticDataResponse> getTouroptionstatic(
      TourOptionStaticData data) {
    return remoteDataSource.getOptionsstaticdata( data);
  }
  @override
  Future<TourOptionDynamicDataResponse> getTouroptionsdynamic(
    TourOptionDynamicRequest data) {
    return remoteDataSource.getOptionsdynamicdata( data);
  }
}