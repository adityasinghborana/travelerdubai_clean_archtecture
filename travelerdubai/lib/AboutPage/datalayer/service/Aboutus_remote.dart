import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/AboutPage/datalayer/model/response/Aboutus.dart';


part 'Aboutus_remote.g.dart';


@RestApi(baseUrl: baseurl)
abstract class AboutUsRemoteService {
  factory AboutUsRemoteService(Dio dio, {String? baseUrl}) =
  _AboutUsRemoteService;


   @GET('/aboutus')
  Future<Aboutpagedata> getAboutUsData ();
}

