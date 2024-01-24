import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/tourdetails/model/tour_model.dart';

part 'homepage_remote_service.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class HomeRemoteService {
  factory HomeRemoteService(Dio dio, {String? baseUrl}) = _HomeRemoteService;

  @GET('/homepage')
  Future<List<HomepageData>> getdata();
}
