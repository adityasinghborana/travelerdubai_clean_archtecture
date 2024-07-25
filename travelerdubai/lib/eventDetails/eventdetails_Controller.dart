import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import 'package:travelerdubai/eventDetails/model/eventdetailsresponse.dart';
import '../core/constants/constants.dart';

class EventdetailsController extends GetxController {
  Rx<EventDetails?> eventdetails = Rx<EventDetails?>(null);
  RxList<EventOption> eventoption = <EventOption>[].obs;
  RxList<String> images = <String>[].obs;
  RxInt adultsSelectedValue = 1.obs;
  RxInt childrenSelectedValue = 0.obs;
  RxInt infantsSelectedValue = 0.obs;
  RxList <TimeSlot> timeslots =<TimeSlot>[].obs;

  @override
  void onInit() {
    super.onInit();

  }

  void fetchEvent(int id) async {
    try {
      dio.Response response = await dio.Dio().post('$baseurl/event', data: {"id": id});
      if (response.statusCode == 200) {
        // Deserialize the JSON response into an EventDetails object
        EventDetails eventDetail = EventDetails.fromJson(response.data);
        eventdetails.value = eventDetail;
        images.value = eventDetail.images?.map((e) => e.imagePath ?? '').toList() ?? [];
        eventoption.value= eventdetails.value?.eventoptions??[];


      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching event details: $e');
    }
  }
}
