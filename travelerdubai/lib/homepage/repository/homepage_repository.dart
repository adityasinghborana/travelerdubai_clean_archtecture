import 'package:travelerdubai/homepage/remote/homepage_remote_service.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';

abstract class HomeRepository {
  Future<HomepageData> getdata();
}

@override
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteService remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<HomepageData> getdata() {
    return remote.getdata();
  }
}
