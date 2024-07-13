// data/repositories/tour_repository_impl.dart



import 'package:dio/dio.dart';
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

  Future<TourOptionsStaticDataResponse> getTouroptionstatic(
      TourOptionStaticData data) async {
    try {
      return await remoteDataSource.getOptionsstaticdata(data);
    } on DioException catch (e) {
      print('Error in getTouroptionstatic: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response status: ${e.response?.statusCode}');
      print('Request data: ${e.requestOptions.data}');
      print('Request headers: ${e.requestOptions.headers}');
      throw e; // Re-throw the error if you need to handle it further up the call stack
    } catch (e) {
      print('Unexpected error in getTouroptionstatic: $e');
      throw e; // Re-throw the error if you need to handle it further up the call stack
    }
  }
  @override
  Future<TourOptionDynamicDataResponse> getTouroptionsdynamic(
    TourOptionDynamicRequest data) {
    return remoteDataSource.getOptionsdynamicdata( data);
  }
}