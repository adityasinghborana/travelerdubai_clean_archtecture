import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';

class GetHomePageDatUseCase {
  final HomeRepository repository;

  GetHomePageDatUseCase(this.repository);

  Future<HomepageData> execute() {
    return repository.getdata();
  }
}
