import 'package:travelerdubai/homepage/remote/homepage_remote_service.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';

import '../model/city.dart';

abstract class HomeRepository {
  Future<HomepageData> getdata();
  Future<List<City>> getCities();
}

@override
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteService remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<HomepageData> getdata() {
    return remote.getdata();
  }
  @override
  Future<List<City>> getCities() {
    return remote.getcities();
  }
}
