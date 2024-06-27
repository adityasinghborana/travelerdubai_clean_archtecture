import 'package:travelerdubai/contactus/datalayer/models/request/postform.dart';
import 'package:travelerdubai/contactus/datalayer/models/response/postform_response.dart';
import 'package:travelerdubai/contactus/datalayer/repository/repositoty.dart';

class PostFormUseCase {
  final ContactUsRepository repository;

  PostFormUseCase(this.repository);

  Future<PostFormResponse> execute(PostForm request) {
    return repository.postData(request);
  }
}