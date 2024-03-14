import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/core/constants/contants.dart';
import 'package:travelerdubai/experiences/model/experience_response_model.dart';

part 'experiences_remote_service.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ExperienceRemoteService {
  factory ExperienceRemoteService(Dio dio, {String? baseUrl}) =
      _ExperienceRemoteService;

  @GET('/tours')
  Future<List<Experiences>> getExperiences();
}
