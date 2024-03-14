import 'package:travelerdubai/AboutPage/datalayer/model/response/Aboutus.dart';
import 'package:travelerdubai/AboutPage/datalayer/repository/aboutus_repositiory.dart';

class AboutUsUseCase{
  final AboutPageRepository repository;

  AboutUsUseCase(this.repository);

  Future<Aboutpagedata> execute() {
    return repository.getAboutusData();
  }
}