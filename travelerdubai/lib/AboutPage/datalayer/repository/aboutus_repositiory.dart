import 'package:travelerdubai/AboutPage/datalayer/model/response/Aboutus.dart';

import '../service/Aboutus_remote.dart';

abstract class AboutPageRepository {
  Future<Aboutpagedata> getAboutusData  ();
}

@override
class AboutPageImpl implements AboutPageRepository {
  final  AboutUsRemoteService remote;

  AboutPageImpl(this.remote);

  @override
  Future<Aboutpagedata> getAboutusData( ) {
    return remote.getAboutUsData();
  }
}