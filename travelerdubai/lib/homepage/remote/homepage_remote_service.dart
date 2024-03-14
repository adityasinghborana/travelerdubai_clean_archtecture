import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';


part 'homepage_remote_service.g.dart';

@RestApi(baseUrl: baseurl)
abstract class HomeRemoteService {
  factory HomeRemoteService(Dio dio, {String? baseUrl}) = _HomeRemoteService;

  @GET('/homepage')
  Future<HomepageData> getdata();
}
