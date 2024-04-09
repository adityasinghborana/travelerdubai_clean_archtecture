import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/create_user_response.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/user_detail_response.dart';
import 'package:travelerdubai/core/constants/constants.dart';

import '../model/request/create_user_request.dart';
part 'create_user_remote.g.dart';



@RestApi(baseUrl: baseurl)
abstract class createUserRemoteService {
  factory createUserRemoteService(Dio dio, {String? baseUrl}) =
  _createUserRemoteService;


   @POST('/createusers')
  Future<UserModelResponse> createuser(
      @Body() User requestBody,
      );

  @GET('/checkuser')
  Future<List<UserDetail>> getUserDetail(
      @Query('uid') String uid,
      );

}

