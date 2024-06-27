import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constants/constants.dart';
import '../models/request/postform.dart';
import '../models/response/contactusresponse.dart';
import '../models/response/postform_response.dart';
part 'remoteservice.g.dart';
@RestApi(baseUrl: baseurl)
abstract class ContactusRemote {
  factory ContactusRemote(Dio dio, {String? baseUrl}) =
      _ContactusRemote;

  @GET('/contactusdata')
  Future<ContactUsData> data();

  @POST('/submitform')
  Future<PostFormResponse> postForm(@Body() PostForm requestBody,);
}

