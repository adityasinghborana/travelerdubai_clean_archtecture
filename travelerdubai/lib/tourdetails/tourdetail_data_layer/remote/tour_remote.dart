import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/core/constants/contants.dart';


import '../model/tour_model.dart';

part 'tour_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class TourRemoteService {
  factory TourRemoteService(Dio dio, {String? baseUrl}) = _TourRemoteService;

  @GET('/tourdetails')
  Future<TourModel> getCityTour(@Query('id') String id);
}
