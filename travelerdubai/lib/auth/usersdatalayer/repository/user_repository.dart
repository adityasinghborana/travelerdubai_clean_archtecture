

import '../model/request/create_user_request.dart';
import '../model/response/create_user_response.dart';
import '../service/create_user_remote.dart';

abstract  class UserRepository {
  Future<UserModelResponse>createusers(User requestBody);
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

}