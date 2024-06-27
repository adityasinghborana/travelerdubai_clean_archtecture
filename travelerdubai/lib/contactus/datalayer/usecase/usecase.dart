import 'package:travelerdubai/contactus/datalayer/models/response/contactusresponse.dart';
import 'package:travelerdubai/contactus/datalayer/repository/repositoty.dart';

class GetContactUsDataUseCase {
  final ContactUsRepository repository;

  GetContactUsDataUseCase(this.repository);

  Future<ContactUsData> execute() {
    return repository.getData();
  }
}