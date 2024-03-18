import 'package:dio/dio.dart'  ;
import 'package:retrofit/http.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/request/tour_option_dynamic.dart';
import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_option_dynamic_response.dart';

import 'package:travelerdubai/tourdetails/touroption_data_layer/model/response/tour_options_staticdata_response.dart';
import '../../../../core/constants/contants.dart';
import '../../model/request/tour_option_static_data.dart';

part 'touroption_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class TourOptionRemoteService {
  factory TourOptionRemoteService( Dio dio, {String? baseUrl}) =
      _TourOptionRemoteService;

  @POST('/touroptionsstatic')



  Future<TourOptionsStaticDataResponse> getOptionsstaticdata(

      @Body() TourOptionStaticData requestBody,
      );
  @POST('/touroptions')



  Future<TourOptionDynamicDataResponse> getOptionsdynamicdata(

      @Body() TourOptionDynamicRequest requestBody,
      );
}
