import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../model/tour_model.dart';

part 'tour_remote.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class TourRemoteService {
  factory TourRemoteService(Dio dio, {String? baseUrl}) = _TourRemoteService;

  @GET('/tourdetails')
  Future<TourModel> getCityTour(@Query('id') String id);
}
