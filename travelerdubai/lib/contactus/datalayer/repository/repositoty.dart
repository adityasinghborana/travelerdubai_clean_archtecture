import 'package:travelerdubai/contactus/datalayer/models/request/postform.dart';
import 'package:travelerdubai/contactus/datalayer/models/response/postform_response.dart';
import 'package:travelerdubai/contactus/datalayer/services/remoteservice.dart';

import '../models/response/contactusresponse.dart';

abstract class  ContactUsRepository {
   Future<ContactUsData>getData ();
   Future<PostFormResponse> postData(PostForm requestBody);
}

@override
class ContactUsRepositoryImpl implements ContactUsRepository {
  final ContactusRemote remote;

  ContactUsRepositoryImpl(this.remote);

  @override
  Future<ContactUsData> getData() {
    return remote.data();
  }
  @override
  Future<PostFormResponse> postData(PostForm requestBody) {
    return remote.postForm( requestBody);
  }
}