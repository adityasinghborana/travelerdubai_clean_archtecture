
import 'package:travelerdubai/auth/usersdatalayer/model/request/create_user_request.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/create_user_response.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';

class CreateUserUseCase{
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<UserModelResponse> execute(
     User data) {
    return repository.createusers( data);
  }
}