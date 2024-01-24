import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyGridSectionController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString heading = ''.obs;
  RxString subheading = ''.obs;
  RxList<Map<String, dynamic>> cardsData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // fetchPageData();
    super.onInit();
  }

  // void fetchPageData() async {
  //   DocumentSnapshot<Map<String, dynamic>> docSnapshot =
  //       await firestore.collection('pages').doc('Homepage').get();

  //   if (docSnapshot.exists) {
  //     Map<String, dynamic> data = docSnapshot.data()!;
  //     print(data); // Check the retrieved data
  //     heading.value = data['gridsectionheading'] ?? '';
  //     subheading.value = data['gridsectionsubheading'] ?? '';
  //     cardsData.value = List.from(data['gridsectioncards'] ?? []);
  //     print(data);
  //   }
  // }
}
