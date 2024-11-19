import 'package:travelerdubai/auth/usersdatalayer/model/request/updateuser.dart';
import 'package:travelerdubai/auth/usersdatalayer/model/response/updateuserresponse.dart';
import 'package:travelerdubai/auth/usersdatalayer/repository/user_repository.dart';

class UpdateUserUseCase {
  final  UserRepository repository;

  UpdateUserUseCase(this.repository);

  Future<UpdateUserDetailResponse> execute(UpdateUser data) {
    return repository.updateUserDetail(data);
  }
}