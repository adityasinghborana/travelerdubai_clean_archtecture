

import 'package:travelerdubai/auth/usersdatalayer/model/request/updateuser.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/updateuserresponse.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/user_detail_response.dart';

import '../model/request/create_user_request.dart';
import '../model/response/create_user_response.dart';
import '../service/create_user_remote.dart';

abstract  class UserRepository {
  Future<UserModelResponse>createusers(User requestBody);
  Future<List<UserDetail>> getUserDetail(String uid);
  Future<UpdateUserDetailResponse> updateUserDetail(UpdateUser data);
}



class UserRepositoryImpl implements UserRepository {
  final createUserRemoteService remoteService;

  UserRepositoryImpl(this.remoteService);


  @override
  Future<UserModelResponse> createusers(User requestBody) async {
    try {

      UserModelResponse response = await remoteService.createuser(requestBody);


      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to create user");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error creating user: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
  @override
  Future<List<UserDetail>> getUserDetail(String uid) async {
    try {

     List<UserDetail> response = await remoteService.getUserDetail(uid);


      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to get user detail");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error fetching userDetails: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
  @override
  Future<UpdateUserDetailResponse> updateUserDetail(UpdateUser data) async {
    try {

    UpdateUserDetailResponse response = await remoteService.updateUser(data);


      if (response != null) {
        return response;
      } else {
        throw Exception("Failed to get user detail");
      }
    } catch (error) {
      // Handle any errors that might occur during the process
      print("Error fetching userDetails: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }


}